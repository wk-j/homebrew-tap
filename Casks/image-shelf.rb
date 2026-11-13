cask "image-shelf" do
  version "0.3.0"
  sha256 "226eee78a999905c6c4588cca87b49adcc308d71ee0edf34334b93f333bab32d"

  url "https://github.com/wk-j/image-shelf/releases/download/v#{version}/image-shelf-#{version}-macos-arm64.zip"
  name "Image Shelf"
  desc "Compact image clipboard history island with drag and drop"
  homepage "https://github.com/wk-j/image-shelf"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Image Shelf.app"

  caveats <<~EOS
    Image Shelf is ad-hoc signed and not notarized by Apple.
    macOS may require manual approval in Privacy & Security on first launch.
    Uninstalling preserves your image history in ~/Library/Application Support/Image Shelf.
  EOS
end
