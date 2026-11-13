# Homebrew tap for CodeAtlas

    brew install gabions256/tap/codeatlas

Installs the `atlas` command from the [CodeAtlas](https://github.com/Gabions256/codeatlas) release archives: macOS (Apple Silicon and Intel) and Linux x86_64.

`atlas` conflicts with the Homebrew `atlas` formula (a database schema tool), which installs a command of the same name.

## Updating to a new release

In `Formula/codeatlas.rb`, change `version`, the three URLs and the three `sha256` values to the new release's archives (each has a `.sha256` file next to it on the release page). The `test` workflow installs and tests the formula on macOS and Linux for every push.
