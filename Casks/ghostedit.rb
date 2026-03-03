cask "ghostedit" do
  version "7.8.0"
  sha256 "eb00c1429e8f94facdb11c6d90bb49574a1b8385db744fd7fd2b4d6027e6e74f"

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
