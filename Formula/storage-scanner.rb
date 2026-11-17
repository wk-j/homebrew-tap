class StorageScanner < Formula
  desc "Native disk map with a developer tools view and manual cleanup commands"
  homepage "https://github.com/wk-j/storage-scanner"
  url "https://github.com/wk-j/storage-scanner/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9944fe5a0ddf7c41738b6ac3f6c3f74e134286c9f1b20b2d27b9fb0028900603"
  head "https://github.com/wk-j/storage-scanner.git", branch: "main"

  depends_on "rust" => :build
  # The window renders through Metal; only the macOS build is tested.
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Lists the headless scenes and exits without opening a window.
    assert_match "developer", shell_output("#{bin}/storage-scanner --list-scenes")
  end
end
