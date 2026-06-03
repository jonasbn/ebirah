# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**ebirah** is a Docker image that encapsulates [Dist::Zilla](https://dzil.org/), a Perl distribution builder, so developers can use `dzil` without a local installation.

## Common Commands

### Build the Docker image
```bash
docker build -t jonasbn/ebirah .
```

### Run the container (standard usage)
```bash
docker run --rm -v $PWD:/opt jonasbn/ebirah
```

### Run a specific dzil command
```bash
docker run --rm -v $PWD:/opt jonasbn/ebirah dzil build
docker run --rm -v $PWD:/opt jonasbn/ebirah dzil test
```

### Check documentation locally (mirrors CI checks)
```bash
# Markdown lint — requires markdownlint-cli
markdownlint --config .markdownlint.json README.md CHANGELOG.md

# Spell check — runs via CI using .spellcheck.yml
```

## Architecture

### Docker Image
- **Base**: `perl:5.40.2-slim-bookworm` (pinned by SHA256 in Dockerfile for reproducible builds)
- **User**: Runs as non-root `runner` in group `distzilla`
- **Entry point**: `entrypoint.sh` configures `local::lib` env vars and delegates all arguments to `dzil`
- **Default command**: `dzil version`
- **Perl dependencies**: Managed via `cpanfile` and installed with `cpanm` into a user-local library

### Supported dzil commands
`help`, `commands`, `new`, `build`, `clean`, `test`, `smoke`, `install`, `add`, `listdeps`, `authordeps`, `run`, `nop`, `xtest`

**Not supported**: `dzil release` (PAUSE upload) and `dzil setup` (interactive).

### CI/CD
- **ci.yml**: Runs on push/PR — checks Markdown linting (`.markdownlint.json`) and spell checking (`.spellcheck.yml` with `.wordlist.txt`/`dictionary.dic`)
- **publish.yml**: Triggered on push to `master` and version tags (`*.*.*`) — builds multi-platform images (`linux/amd64`, `linux/arm64`) and pushes to DockerHub (`jonasbn/ebirah`) and GHCR (`ghcr.io/jonasbn/ebirah`)

### Documentation site
The `Gemfile` powers a Jekyll/GitHub Pages documentation site (Ruby 2.7.7, specified in `.ruby-version`). The site is not part of the Docker build.

## Key Files
| File | Purpose |
|------|---------|
| `Dockerfile` | Image definition with pinned base SHA |
| `entrypoint.sh` | Configures local::lib and execs dzil |
| `cpanfile` | Perl runtime dependencies for Dist::Zilla and plugins |
| `.markdownlint.json` | Disables line-length rule, enables commands output |
| `.spellcheck.yml` | Aspell config scoped to Markdown files |
