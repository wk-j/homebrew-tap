cask "image-shelf" do
  version "0.3.1"
  sha256 "7a8c41f8de33ded3412a0567bb661f691f57c3c3ed9dbce37b272a038f2d8a17"

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
