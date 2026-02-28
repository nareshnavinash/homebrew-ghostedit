cask "ghostedit" do
  version "7.7.0"
  sha256 "540d735de180316708789803b7a3aea398e6c4cdf36e9aef590499d6ec1eaa05"

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
