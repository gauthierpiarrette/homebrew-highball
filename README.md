# Highball tap

Highball is in the official Homebrew cask repository now, so this tap is no longer needed:

```sh
brew install --cask highball
```

Requires Apple Silicon and macOS 14 (Sonoma) or newer.

## If you installed from this tap

Nothing to do. Highball updates itself through Sparkle, so the app stays current either way, and
`tap_migrations.json` here points the `highball` token at `homebrew/cask`. You can drop the tap
whenever you like:

```sh
brew untap gauthierpiarrette/highball
```

## Removing Highball

```sh
brew uninstall --cask highball          # the app
brew uninstall --zap --cask highball    # the app plus engines, bottles and installed games
```

`--zap` deletes `~/Library/Application Support/Highball`, which holds every Wine engine,
bottle and game you have installed. That is usually tens of gigabytes and it is not
recoverable from the Trash if you have emptied it. A plain uninstall leaves it alone, so
reinstalling picks your games back up.
