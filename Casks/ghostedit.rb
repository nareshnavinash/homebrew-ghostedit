cask "ghostedit" do
  version "7.8.1"
  sha256 "fb0378d03803d40670f93012b4ee642278db9ba6654d8af2352863051acdbd63"

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
