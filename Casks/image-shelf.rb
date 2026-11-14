cask "image-shelf" do
  version "0.4.2"
  sha256 "59be1f1e8dface78a334bd8e7cdf76caa6c6c5fc92f6f58c787f8f90f5511c25"

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
