cask "font-bai-jamjuree-taper" do
  version "1.0.0"
  sha256 "5e62672812154b522bc56d03854e964caa491f8803b65386e6bc8a03467e1f3b"

  url "https://github.com/wk-j/bai-jamjuree-taper/releases/download/v#{version}/BaiJamjureeTaper.zip"
  name "Bai Jamjuree Taper"
  desc "Bai Jamjuree with stems that narrow toward their free ends"
  homepage "https://github.com/wk-j/bai-jamjuree-taper"

  livecheck do
    url :url
    strategy :github_latest
  end

  font "BaiJamjureeTaper/BaiJamjureeTaper-Bold.ttf"
  font "BaiJamjureeTaper/BaiJamjureeTaper-BoldItalic.ttf"
  font "BaiJamjureeTaper/BaiJamjureeTaper-Italic.ttf"
  font "BaiJamjureeTaper/BaiJamjureeTaper-Regular.ttf"

  zap :not_required
end
