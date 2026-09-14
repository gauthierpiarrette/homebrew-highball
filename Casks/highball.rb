cask "highball" do
  version "0.9.12"
  sha256 "363f47cdf9098f2f0c03d9b0a3b45ef732be465e8451be0350b91068c596fbca"

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
