class Valence < Formula
  desc "Web report for Krypton e2e runs and security scans"
  homepage "https://github.com/wk-j/valence"
  # wk-j/valence is private, so there is no public tarball: Homebrew clones it
  # with the installing user's git credentials for github.com.
  url "https://github.com/wk-j/valence.git",
      tag:      "v0.1.8",
      revision: "e2bd69bd269b58277dd801c8f7c619401076c530"
  head "https://github.com/wk-j/valence.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/valence"
  end

  def caveats
    <<~EOS
      Set up the publish-to-valence skill for your coding agents with:
        valence skill setup
    EOS
  end

  test do
    assert_match "# Publish e2e runs", shell_output("#{bin}/valence skill show")

    port = free_port
    pid = spawn bin/"valence", "serve", "--addr", "127.0.0.1:#{port}", "--data", testpath/"data"
    sleep 3
    system bin/"valence", "health", "--url", "http://127.0.0.1:#{port}/healthz"
  ensure
    Process.kill "TERM", pid
    Process.wait pid
  end
end
