cask "bug-trail" do
  version "0.2.0"

  name "bug-trail"
  desc "See which part of the code causes a bug, drawn as a code-flow map"
  homepage "https://github.com/wk-j/bug-trail"

  binary "bug-trail"

  on_macos do
    on_intel do
      url "https://github.com/wk-j/bug-trail/releases/download/v#{version}/bug-trail_#{version}_darwin_amd64.tar.gz"
      sha256 "831eecd9bc0c600f531a58715bd8e9c9befdbf40065dc29397d193ba8601eb7a"
    end
    on_arm do
      url "https://github.com/wk-j/bug-trail/releases/download/v#{version}/bug-trail_#{version}_darwin_arm64.tar.gz"
      sha256 "7b6054c29a22b1720c2d099eabf09445bb6aed294f78b76d66ad499076bc5e64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wk-j/bug-trail/releases/download/v#{version}/bug-trail_#{version}_linux_amd64.tar.gz"
      sha256 "68c7035506c2933eb9530a7d8a56c51a0878a1c43baedd1944c44499142bd188"
    end
    on_arm do
      url "https://github.com/wk-j/bug-trail/releases/download/v#{version}/bug-trail_#{version}_linux_arm64.tar.gz"
      sha256 "a4ede2729442cf9f14aa77df4b31bb77bce7f18b09b14304916aca8458eaec04"
    end
  end

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/bug-trail"]
    end
  end

  caveats <<~EOS
    Install the bug-trail skill into the coding agents on this machine with:
      bug-trail skill setup
  EOS
end
