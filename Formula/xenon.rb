class Xenon < Formula
  desc "Resource server for Krypton-generated artifacts, reviews and analyses"
  homepage "https://github.com/wk-j/xenon"
  url "https://github.com/wk-j/xenon/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "0f8a7a82786252dac7d4fcf60bf5b78b16b3d8d46738f8c9cdd53d070a7b5d5d"
  license "MIT"
  head "https://github.com/wk-j/xenon.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    # xenon refuses to start without XENON_SESSION_SECRET, and the secret has to
    # survive restarts or every session is invalidated. This wrapper mints one
    # on first run and reuses it after, so `brew services start xenon` works
    # with no manual setup. It deliberately does NOT set
    # XENON_INSECURE_COOKIES: that belongs to plain-HTTP local use only.
    (bin/"xenon-serve").write <<~SH
      #!/bin/sh
      set -eu
      DATA_DIR="${XENON_DATA_DIR:-$HOME/.config/xenon}"
      mkdir -p "$DATA_DIR"
      SECRET_FILE="$DATA_DIR/.session-secret"
      if [ ! -f "$SECRET_FILE" ]; then
        (umask 077; openssl rand -hex 32 > "$SECRET_FILE")
        echo "generated a new session secret at $SECRET_FILE" >&2
      fi
      XENON_SESSION_SECRET="$(cat "$SECRET_FILE")"
      export XENON_SESSION_SECRET
      export XENON_DATA_DIR="$DATA_DIR"
      exec "#{opt_bin}/xenon" "$@"
    SH
    chmod 0755, bin/"xenon-serve"
  end

  service do
    run [opt_bin/"xenon-serve"]
    keep_alive true
    log_path var/"log/xenon.log"
    error_log_path var/"log/xenon.log"
  end

  def caveats
    <<~EOS
      State lives in ~/.config/xenon — the database, the blob store and the
      session secret. Back up that whole directory: xenon.db alone is not
      enough, because file bytes live beside it in blobs/.

        brew services start xenon    run in the background on :8787
        xenon-serve                  run in the foreground

      The FIRST account registered at http://localhost:8787/register becomes the
      admin. Do that before the instance is reachable from anywhere else.

      Over plain http://localhost you also need XENON_INSECURE_COOKIES=1, or the
      session cookie keeps its Secure flag and login will not stick. Real
      deployments terminate TLS at a reverse proxy and must not set it.

      xenon binds 0.0.0.0, not loopback.
    EOS
  end

  test do
    port = free_port
    ENV["XENON_SESSION_SECRET"] = "0" * 32
    ENV["XENON_DATA_DIR"] = testpath/"data"
    ENV["XENON_PORT"] = port.to_s

    pid = spawn bin/"xenon"
    sleep 5
    system bin/"xenon", "--healthcheck"
    assert_path_exists testpath/"data/xenon.db"
  ensure
    Process.kill "TERM", pid
    Process.wait pid
  end
end
