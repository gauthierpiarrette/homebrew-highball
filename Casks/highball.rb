cask "highball" do
  version "0.8.0"
  sha256 "7cb9d273b1bbc9d1df4505e17016090d357df8036eb3b4736580ad79769c415c"

  url "https://github.com/gauthierpiarrette/highball/releases/download/v#{version}/Highball.dmg",
      verified: "github.com/gauthierpiarrette/highball/"
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
