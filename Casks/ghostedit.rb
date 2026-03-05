cask "ghostedit" do
  version "7.9.1"
  sha256 "a5a71c00c7a75afa58a278084e7bb9979ad1a5d65d276e9ebf1a10b3c20dd02d"

  url "https://github.com/nareshnavinash/GhostEdit/releases/download/v#{version}/GhostEdit-macOS.dmg"
  name "GhostEdit"
  desc "Offline grammar checker for macOS — fix text in any app with a hotkey"
  homepage "https://github.com/nareshnavinash/GhostEdit"

  depends_on macos: ">= :ventura"

  app "GhostEdit.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/GhostEdit.app"],
                   sudo: false
  end

  zap trash: [
    "~/.ghostedit",
  ]
end
