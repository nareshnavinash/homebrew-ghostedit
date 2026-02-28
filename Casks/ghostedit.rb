cask "ghostedit" do
  version "7.5.1"
  sha256 "17d3eacd308ba37a81b4cf208d723932048b1e38af7ba4737c4a587dbcb82458"

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
