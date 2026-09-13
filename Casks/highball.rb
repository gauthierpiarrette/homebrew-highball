cask "highball" do
  version "0.9.10"
  sha256 "5789eb11a22c0998464bef29c857a3b16ff300d4518aa0574398223d23aa9b43"

  url "https://github.com/gauthierpiarrette/highball/releases/download/v#{version}/Highball.dmg"
  name "Highball"
  desc "Run Windows games on Apple Silicon"
  homepage "https://gethighball.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Highball updates itself through Sparkle. Without this, brew would manage versions too
  # and report the app as outdated the moment it self-updates.
  auto_updates true
  # The Wine engine is x86_64 under Rosetta, but the app bundle itself is arm64-only.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Highball.app"

  # Application Support holds every engine, bottle and installed game, so this is usually
  # tens of gigabytes. Only `brew uninstall --zap` touches it; a plain uninstall leaves
  # games in place.
  zap trash: [
    "~/Library/Application Support/Highball",
    "~/Library/Caches/app.highball.Highball",
    "~/Library/HTTPStorages/app.highball.Highball",
    "~/Library/Preferences/app.highball.Highball.plist",
  ]
end
