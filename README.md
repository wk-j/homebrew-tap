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

```sh
brew install wk-j/tap/xenon           # latest tagged release
brew install --HEAD wk-j/tap/xenon    # straight from master
brew services start xenon             # run on :8787
```

Built from source — `rust` is pulled in as a build-only dependency, so the
install compiles rather than downloading a bottle.

State lives in `~/.config/xenon`, never in the checkout, so a dev build and the
installed binary are the same server with the same accounts. Back up that whole
directory: `xenon.db` alone is not enough, because file bytes live beside it in
`blobs/`.
