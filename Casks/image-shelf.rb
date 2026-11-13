cask "image-shelf" do
  version "0.1.0"
  sha256 "67e67fb5d17de7c2603aebd78351744e45315b90d2f3053ee4008f9bd391b9fc"

  url "https://github.com/wk-j/image-shelf/releases/download/v#{version}/image-shelf-#{version}-macos-arm64.zip"
  name "Image Shelf"
  desc "Compact image clipboard history island with drag and drop"
  homepage "https://github.com/wk-j/image-shelf"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Image Shelf.app"

  caveats <<~EOS
    Image Shelf is ad-hoc signed and not notarized by Apple.
    macOS may require manual approval in Privacy & Security on first launch.
    Uninstalling preserves your image history in ~/Library/Application Support/Image Shelf.
  EOS
end
