# Homebrew tap for Tracemark

    brew install gabions256/tap/tracemark

Installs the `tracemark` command from the [Tracemark](https://github.com/Gabions256/tracemark) release archives: macOS (Apple Silicon and Intel) and Linux x86_64.

Tracemark was named CodeAtlas until 0.1.1. `formula_renames.json` maps the old `codeatlas` formula to `tracemark`, so `brew upgrade` moves existing installs over.

## Updating to a new release

In `Formula/tracemark.rb`, change `version`, the three URLs and the three `sha256` values to the new release's archives (each has a `.sha256` file next to it on the release page). The `test` workflow installs and tests the formula on macOS and Linux for every push.
