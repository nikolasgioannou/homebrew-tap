# homebrew-tap

Homebrew formulae for [@nikolasgioannou](https://github.com/nikolasgioannou)'s tools.

## Usage

```
brew install nikolasgioannou/tap/<formula>
```

Or tap once and install by short name:

```
brew tap nikolasgioannou/tap
brew install <formula>
```

## Formulae

| Formula | Description |
| --- | --- |
| [`baton`](Formula/baton.rb) | Share Claude Code conversations with others |

## Updating

Formulae here are bumped automatically by the source repo's release workflow
(`scripts/bump-formula.sh`). To run it locally:

```
scripts/bump-formula.sh baton v0.3.0
```
