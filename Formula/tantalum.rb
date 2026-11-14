class Tantalum < Formula
  desc "Local secret manager for AI coding agents"
  homepage "https://github.com/wk-j/tantalum"
  url "https://github.com/wk-j/tantalum/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "137fcdb076e102021cd72a6ca6d052820958ea57c5938a0b16ef6a25fd0e6ff3"
  head "https://github.com/wk-j/tantalum.git", branch: "main"

  depends_on "go" => :build
  # Vault keys live in the login Keychain; cgo links LocalAuthentication for
  # Touch ID and AppKit for the clipboard.
  depends_on :macos

  def install
    system "go", "build", *std_go_args(output: bin/"ta", ldflags: "-s -w"), "./cmd/ta"
    pkgshare.install "skills"
  end

  def caveats
    <<~EOS
      Give your coding agents the tantalum skill, so they use secrets by name:
        ln -s #{opt_pkgshare}/skills/tantalum ~/.claude/skills/tantalum   # Claude Code
        ln -s #{opt_pkgshare}/skills/tantalum ~/.agents/skills/tantalum   # omp

      Then create a vault in your own terminal:
        ta init
    EOS
  end

  test do
    assert_match "local secret manager", shell_output("#{bin}/ta help")
    assert_path_exists pkgshare/"skills/tantalum/SKILL.md"

    ENV["TANTALUM_HOME"] = testpath/"tantalum"
    assert_match "no vault", shell_output("#{bin}/ta list 2>&1", 125)
  end
end
