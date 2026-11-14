cask "font-420-taper" do
  version "1.0.0"
  sha256 "9e5a9166909e45d4654cec3b88f2c8efcffc56716a13a02807926ecc639912c6"

  url "https://github.com/wk-j/420-taper/releases/download/v#{version}/420Taper.zip"
  name "420 Taper"
  desc "Monospaced coding font with tapered stems and Nerd Font icons"
  homepage "https://github.com/wk-j/420-taper"

  livecheck do
    url :url
    strategy :github_latest
  end

  font "420Taper/420Taper-Italic.ttf"
  font "420Taper/420Taper-Regular.ttf"

  zap :not_required
end
