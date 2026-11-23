cask "font-m-plus-code-taper" do
  version "1.0.0"
  sha256 "9fc3a12ba0ba1e4b90e937c11a0fa9d75487e57f310c56b3667846951c7b8dd4"

  url "https://github.com/wk-j/m-plus-code-taper/releases/download/v#{version}/MPLUSCodeTaper.zip"
  name "M PLUS Code Taper"
  desc "M PLUS 1 Code with stems that narrow toward their free ends"
  homepage "https://github.com/wk-j/m-plus-code-taper"

  livecheck do
    url :url
    strategy :github_latest
  end

  font "MPLUSCodeTaper/MPLUSCodeTaper-Bold.ttf"
  font "MPLUSCodeTaper/MPLUSCodeTaper-Regular.ttf"

  zap :not_required
end
