# wk-j/homebrew-tap

Homebrew formulae for [wk-j](https://github.com/wk-j)'s tools.

```sh
brew install wk-j/tap/<formula>
```

## Formulae

### xenon

Central resource server for [Krypton](https://github.com/wk-j/krypton)-generated
work product — HTML artifacts, review bundles, issue analyses, docs and
attention flags. Single static binary, SQLite metadata, content-addressed blob
store, no external services. Source: [wk-j/xenon](https://github.com/wk-j/xenon).

Installs three commands: `xenon` (server), `xenon-serve` (wrapper that mints
the session secret), and `xen` (CLI for login, invite, tokens, push).

```sh
brew install wk-j/tap/xenon           # latest tagged release
brew install --HEAD wk-j/tap/xenon    # straight from master
brew services start xenon             # run on :8787
xen --help                            # talk to a running instance
```

Built from source — `rust` is pulled in as a build-only dependency, so the
install compiles rather than downloading a bottle.

State lives in `~/.config/xenon`, never in the checkout, so a dev build and the
installed binary are the same server with the same accounts. Back up that whole
directory: `xenon.db` alone is not enough, because file bytes live beside it in
`blobs/`.

### valence

Web report for [Krypton](https://github.com/wk-j/krypton) e2e runs and SARIF
security scans: `valence push` / `valence push-scan` send them,
`valence serve` shows them. Source: [wk-j/valence](https://github.com/wk-j/valence).

```sh
brew install wk-j/tap/valence           # latest tagged release
brew install --HEAD wk-j/tap/valence    # straight from main
valence skill setup                     # agent skill for Claude Code, Codex, …
```

wk-j/valence is private, so Homebrew clones it with your GitHub login instead
of downloading a tarball. Homebrew's download sandbox passes git a `GH_TOKEN`
from the GitHub CLI, which only gh's credential helper reads; Git Credential
Manager cannot run in the sandbox. Once per machine, with an account that can
read the repository:

```sh
gh auth login
gh auth setup-git --hostname github.com
```

Built from source — `go` is pulled in as a build-only dependency.

### tantalum

Local secret manager for AI coding agents on macOS: an agent runs a command with
a secret by name (`ta run -s TOKEN -- …`) and never sees its value. Source:
[wk-j/tantalum](https://github.com/wk-j/tantalum).

```sh
brew install wk-j/tap/tantalum           # latest tagged release
brew install --HEAD wk-j/tap/tantalum    # straight from main
ta init                                  # create a vault, in your own terminal
ta skill setup                           # agent skill for Claude Code, Codex, …
```

Installs the command `ta`. `ta skill setup` gives the agent skill to Claude Code,
Codex, OpenCode, Pi and omp, and `ta skill status` shows where it is installed.

Built from source — `go` is pulled in as a build-only dependency, and cgo needs
the Xcode command line tools. macOS only: vault keys live in the login Keychain.

### storage-scanner

Native disk map for macOS: a glowing dot-matrix bar of what is using the disk,
and a Developer tools tab that measures package-manager caches, toolchains and
project build folders and shows the command that cleans each one up. It never
runs those commands itself. Source:
[wk-j/storage-scanner](https://github.com/wk-j/storage-scanner).

```sh
brew install wk-j/tap/storage-scanner           # latest tagged release
brew install --HEAD wk-j/tap/storage-scanner    # straight from main
storage-scanner                                 # opens the window
```

Built from source — `rust` is pulled in as a build-only dependency, so the
install compiles rather than downloading a bottle. macOS only: the window
renders through Metal.

## Casks

### font-420-taper

Monospaced coding font: Share Tech Mono (Nerd Fonts patch) with stems that
narrow toward their free ends, plus a 10° Italic. Source:
[wk-j/420-taper](https://github.com/wk-j/420-taper).

```sh
brew install --cask wk-j/tap/font-420-taper
```

Installs `420Taper-Regular.ttf` and `420Taper-Italic.ttf` into `~/Library/Fonts`;
pick **420 Taper** in your editor or terminal.

### font-bai-jamjuree-taper

Bai Jamjuree (Cadson Demak) with stems that narrow toward their free ends.
Regular, Italic, Bold and Bold Italic; Latin, Vietnamese and Thai. Source:
[wk-j/bai-jamjuree-taper](https://github.com/wk-j/bai-jamjuree-taper).

```sh
brew install --cask wk-j/tap/font-bai-jamjuree-taper
```

Installs the four `BaiJamjureeTaper-*.ttf` files into `~/Library/Fonts`;
pick **Bai Jamjuree Taper**.

### font-m-plus-code-taper

Monospaced coding font: M PLUS 1 Code (M+ FONTS Project) with stems that narrow
toward their free ends. Regular and Bold; Latin, Vietnamese and Japanese (kana
and kanji stay untouched and two cells wide). Source:
[wk-j/m-plus-code-taper](https://github.com/wk-j/m-plus-code-taper).

```sh
brew install --cask wk-j/tap/font-m-plus-code-taper
```

Installs `MPLUSCodeTaper-Regular.ttf` and `MPLUSCodeTaper-Bold.ttf` into
`~/Library/Fonts`; pick **M PLUS Code Taper** in your editor or terminal.
