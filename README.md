# Highball tap

Homebrew cask for [Highball](https://github.com/gauthierpiarrette/highball), which runs
Windows games on Apple Silicon.

```sh
brew install --cask gauthierpiarrette/highball/highball
```

Requires Apple Silicon and macOS 14 (Sonoma) or newer.

## Updating

Highball updates itself through Sparkle, so the cask is marked `auto_updates true` and
`brew upgrade` normally has nothing to do. That is expected, not a broken cask.

## Removing it

```sh
brew uninstall --cask highball          # the app
brew uninstall --zap --cask highball    # the app plus engines, bottles and installed games
```

`--zap` deletes `~/Library/Application Support/Highball`, which holds every Wine engine,
bottle and game you have installed. That is usually tens of gigabytes and it is not
recoverable from the Trash if you have emptied it. A plain uninstall leaves it alone, so
reinstalling picks your games back up.

## Why a tap and not homebrew-cask

Core cask submissions have notability thresholds (stars, forks, watchers, repo age) that
Highball does not meet yet. This tap works identically in the meantime; if the cask later
moves into homebrew-cask, `brew install --cask highball` keeps working without the tap.

The cask version here is bumped automatically after each upstream release.
