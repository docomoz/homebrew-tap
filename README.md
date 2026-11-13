# docomoz/homebrew-tap

Homebrew casks for apps by docomoz.

## Murmur

Menu bar ambient sound mixer for focus and sleep — [github.com/docomoz/Murmur](https://github.com/docomoz/Murmur).

```bash
brew install --cask docomoz/tap/murmur
```

Murmur updates itself (Sparkle); `brew upgrade --cask --greedy murmur` works too.
Uninstall with settings: `brew uninstall --zap --cask murmur`.

## Pisa

Meeting recorder with local transcription — [getpisa.app](https://getpisa.app).

```bash
brew install --cask docomoz/tap/pisa
```

Pisa updates itself through Sparkle. To update through Homebrew, use
`brew upgrade --cask --greedy docomoz/tap/pisa`.

### Moving from Pisya

Pisa has a new app identity and a separate local library. Installing it does not
copy your meetings or remove Pisya. Follow the [manual migration instructions](https://getpisa.app/migration)
on each Mac, then verify your transcripts, audio, folders, saved voices and dictionary.
Keep the old library as a backup. Grant Pisa microphone and system-audio access
and reselect any export or custom-model folders.

The `pisya` cask stays frozen at 0.4.220 for existing installations. It has no automatic
rename mapping to `pisa`, so Homebrew will not replace it as part of this migration.
After checking your copied library, you can remove the old app explicitly:

```bash
brew uninstall --cask docomoz/tap/pisya
```

Do not use `--zap` or delete the old library during migration.
