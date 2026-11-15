class StorageScanner < Formula
  desc "Native disk map with a developer tools view and manual cleanup commands"
  homepage "https://github.com/wk-j/storage-scanner"
  url "https://github.com/wk-j/storage-scanner/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f095a1a430807d0d0669596bd5cfa6352af1d59b85e447964e6c9e601bf57ce4"
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
