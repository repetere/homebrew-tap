# GPDoc Homebrew tap

Install the [GPDoc command-line tools and terminal editor](https://gpdoc.io/cli):

```sh
brew install repetere/tap/gpdoc
gpdoc version
```

The current formula installs **GPDoc CLI 1.32.0** and **FileKit 1.32.0** from the published npm packages. Homebrew installs its `node` dependency; GPDoc requires Node 20 or later.

## Verification

```sh
brew test repetere/tap/gpdoc
"$(brew --prefix gpdoc)/bin/gpdoc" version
```

The formula was verified on Apple Silicon macOS, including document creation, validation and opening/quitting the terminal editor. Linux direct-package staging was smoke-tested; native Linux Homebrew and Intel macOS installation have not yet been verified.

If another GPDoc installation appears earlier on your `PATH` (for example, an npm installation), plain `gpdoc` may still run that copy. The explicit Homebrew path above selects this installation. This formula does not remove or modify global npm packages or shell configuration.

## Package integrity

The formula pins the CLI and all ten runtime dependency archives to exact published npm URLs and SHA-256 checksums. All eleven archives were independently checked against npm SHA-512 integrity metadata. Packages are installed under Homebrew's private formula prefix without npm dependency resolution or lifecycle scripts. Dependency versions are a verified snapshot, not a claim that upstream npm caret ranges are immutable.

To check for future formula releases, use the normal Homebrew commands:

```sh
brew update
brew upgrade repetere/tap/gpdoc
```

Updates are available only when a new formula version is published in this tap.

## Licensing

The published GPDoc CLI and FileKit 1.32.0 packages do not declare a project license. This tap does not assign or change their license, grant additional software rights, or represent acceptance into `homebrew/core`. Third-party dependency license files and bundled notices are preserved in the installed packages.
