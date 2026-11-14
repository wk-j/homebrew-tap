class Tantalum < Formula
  desc "Local secret manager for AI coding agents"
  homepage "https://github.com/wk-j/tantalum"
  url "https://github.com/wk-j/tantalum/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3fd26c19a23159628f2e2a6f39d3b3e72b51076a0c360abd38de13499abddedb"
  license "MIT"
  head "https://github.com/wk-j/tantalum.git", branch: "main"

  depends_on "go" => :build
  # Vault keys live in the login Keychain; cgo links LocalAuthentication for
  # Touch ID and AppKit for the clipboard.
  depends_on :macos

  def install
    system "go", "build", *std_go_args(output: bin/"ta", ldflags: "-s -w"), "./cmd/ta"
    # 0.1.0's caveats linked agents' skill directories here; keep them working.
    pkgshare.install "skills"
  end

  def caveats
    <<~EOS
      Give your coding agents (Claude Code, Codex, OpenCode, Pi, omp) the
      tantalum skill, so they use secrets by name:
        ta skill setup

      Then create a vault in your own terminal:
        ta init
    EOS
  end

  test do
    assert_match "local secret manager", shell_output("#{bin}/ta help")
    assert_match "# tantalum", shell_output("#{bin}/ta skill show")
    assert_path_exists pkgshare/"skills/tantalum/SKILL.md"

    ENV["HOME"] = testpath
    system bin/"ta", "skill", "setup"
    assert_path_exists testpath/".agents/skills/tantalum/SKILL.md"

    ENV["TANTALUM_HOME"] = testpath/"tantalum"
    assert_match "no vault", shell_output("#{bin}/ta list 2>&1", 125)
  end
end
