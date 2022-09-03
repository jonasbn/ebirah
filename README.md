# ebirah

Experimental Docker project for [Dist::Zilla](dzil.org)

![ebirah logo](assets/ebirah_by_zappazee.png)

![Markdownlint Action][GHAMKDBADGE]
![Spellcheck Action][GHASPLLBADGE]
[![Docker Pulls](https://img.shields.io/docker/pulls/jonasbn/ebirah.svg?style=flat)](https://hub.docker.com/r/jonasbn/ebirah/)

## Features

- Encapsulates Dist::Zilla and `dzil` in a Docker container, so you do not have to install and maintain Dist::Zilla and all it's magnificent dependencies
- Offers interaction with the `dzil` command from the comfort of your terminal as `ebirah`
- It can be used for continuous integration pipelines

Ebirah supports all the following Dist::Zilla commands, so you can replace `dzil` with `ebirah` for using the Docker image (please see the section on summoning Ebirah):

- `ebirah help` - show helps message
- `ebirah commands` - lists available commands
- `ebirah new` - sets up a new distribution
- `ebirah build` - builds the distribution
- `ebirah clean` - cleans the build
- `ebirah test` - tests the build
- `ebirah smoke` - smoke tests the build
- `ebirah install` - installs the distribution
- `ebirah add` - adds an additional component to the distribution
- `ebirah listdeps` - lists runtime dependencies for the distribution
- `ebirah authordeps` - lists Dist::Zilla dependencies used the toolchain, Ebirah in this case
- `ebirah run` - runs a executable in the context of the distribution
- `ebirah nop` - a _no-operation_ primarily for diagnostic purposes
- `ebirah xtest` - tests the build using the contents of the `xt` directory

All command options are supported.

Please see the documentation at dzil.org for more details on `dzil` use.

Ebirah does not currently support:

- `ebirah release` - release the distribution to PAUSE/CPAN
- `ebirah setup` - runs interactive configuration process, resulting in `$HOME/.dzil/config.ini` file

This is on [the road map](https://github.com/jonasbn/ebirah/projects/1).

Ebirah does also not handle the definition of prerequisites in the `dist.ini` file.

## Specification

The Docker image is based on [the official Perl Docker image][dockerhubperl], using the latest available stable version of this image. See the `Dockerfile` for details.

It is based on the _larger_ image, not the _slim_ version since Dist::Zilla and extensions require a toolchain for XS based Perl distributions.

### A note on DockerHub

The images are build from the GitHub repository master branch.

The recommended use is to use the latest release with a version tag. See `Changelog.md` for details. Whereas the tag `latest` just reflect the latest build based on the master branch.

The master branch might contain changes not tagged as released yet and can be regarded as _unstable_ or _experimental_. Changes such as corrections to documentation etc. will not be tagged until separately as a general rule, unless the changes are significant, but the aim is to keep the documentation relevant and up to date.

## Summoning Ebirah

Ebirah is [available on DockerHub][dockerhubebirah], or you can build it yourself based on this repository, see the section below on building Ebirah.

```bash
$ docker pull jonasbn/ebirah:0.7.0
$ docker run --rm --volume $PWD:/opt jonasbn/ebirah:0.7.0
```

And if you are want the latest build from DockerHub:

```bash
$ docker pull jonasbn/ebirah:latest
$ docker run --rm --volume $PWD:/opt jonasbn/ebirah:latest
```

As mentioned `latest` can be considered _unstable_ or _experimental_. Development is kept in branches, but new experimental features might make into master for wider evaluation.

Using the image [available from GitHub](https://github.com/jonasbn/ebirah/packages) instead of DockerHub, do note this repository is in beta:

```bash
$ docker pull ghcr.io/jonasbn/ebirah:0.7.0
$ docker run --rm --volume $PWD:/opt ghcr.io/jonasbn/ebirah:0.7.0
```

### Using a script

The feature listing assumes the script is named `ebirah`

```bash
#!/bin/bash

# REF:http://jonasbn.github.io/til/bash/write_safe_shell_scripts.html
set -euf -o pipefail

# run ebirah docker image in current directory and cleanup the image afterwards
docker run --rm --volume $PWD:/opt jonasbn/ebirah "$@"
```

### Using an alias

```bash
# run ebirah docker image in current directory and cleanup the image afterwards
alias ebirah='docker run --rm --volume $PWD:/opt jonasbn/ebirah'
```

### Using Ebirah for Continuous Integration

Ebirah was built with continuous integration (CI) in mind, meaning that encapsulating Dist::Zilla in a easily distributable container.

First attempt at getting this to work has been implemented as [a GitHub Action](https://github.com/marketplace/actions/github-action-for-perl-s-dist-zilla).

The action can easily be implemented and current relies on Dist::Zilla using repositories.

The GitHub Action performs the following steps:

1. Installs Perl dependencies, specified in the repository (currently only support the presences of a `cpanfile`, this might be extended and/or changed in the future based on requirements)
1. Executes `dzil` with parameters specified in the GitHub Action configuration

An example configuration:

```yaml
name: CI Action
on: push

jobs:
  build:
    name: Continuous Integration
    runs-on: ubuntu-latest
    steps:
    # REF: https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow#using-the-checkout-action
    - name: "Checkout repository"
      uses: actions/checkout@v2
    - name: "Installing dependencies and testing all using dzil"
      uses: jonasbn/github-action-perl-dist-zilla@master
      with:
          dzil-arguments: 'test --all'
```

Lifted from: [`.github/workflows/ci.yml`](https://github.com/jonasbn/perl-app-yak/blob/master/.github/workflows/ci.yml) from [App::Yak](https://github.com/jonasbn/perl-app-yak/).

Examples are available here:

- [App::Yak](https://github.com/jonasbn/perl-app-yak)

Please [see the documentation on the GitHub Action for Dist::Zilla]((https://github.com/marketplace/actions/github-action-for-perl-s-dist-zilla)) for more details

## Diagnostics

### `no configuration (e.g, dist.ini)`

This error indicates that you have forgotten to invoke the Docker command with `--volume`

1. Add `--volume` as specified in the documentation to your invocation

```bash
docker run --rm --volume $PWD:/opt jonasbn/ebirah
```

### `Invalid selection, please try again:`

If you are executing the `setup` command and you have forgotten to o invoke the Docker command with `--volume`. You will get a lot of repeated messages:

```text
Invalid selection, please try again: Invalid selection, please try again:
```

For now the `setup` command is not supported.

```bash
docker run --rm --volume $PWD:/opt jonasbn/ebirah
```

Also you have to shut down the running container with the Docker `kill` command:

```bash
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
240e33386a0b        ebirah:latest       "dzil setup"        3 seconds ago       Up 1 second                             kind_hopper
$ docker kill 240e33386a0b
240e33386a0b
```

### `Cannot detect source of 'xt'!`

If you are executing the `xtest` command and the `xt` directory does either not exist or does not contain any tests.

1. Either add a `xt` directory with tests
1. Add tests to your empty `xt` directory
1. Do not use the `xtest` command since it does not make sense in the context you are running

## Building ebirah

If you choose to build the image yourself, the above information has to be adjusted accordingly to reflect the image name

### Building the Docker Image

```bash
$ docker build -t jonasbn/ebirah .
```

### Running the Docker Image

```bash
$ docker run --rm -v $PWD:/opt jonasbn/ebirah
```

Do note you can use the short-form `ebirah` for the image name, I just use the fully qualified name matching my own usage pattern and the examples and documentation above.

## Acknowledgements

A list of contributors in alphabetical order:

- Alceu Rodrigues de Freitas Junior (@glasswalk3r)

### About

[Ebirah](https://en.wikipedia.org/wiki/Ebirah) is one of the [Godzilla characters](https://en.wikipedia.org/wiki/Category:Godzilla_characters) ([kaiju](https://en.wikipedia.org/wiki/Kaiju)), since [Dist::Zilla](dzil.org) namewise also originates from the Godzilla ([kaiju](https://en.wikipedia.org/wiki/Kaiju)) universe, Ebirah was a good candidate for a project name with the marine relation, making sense in Docker backdrop.

The logo used is by the artist [ZappaZee](https://www.deviantart.com/zappazee). I found it via [Deviant Art](https://www.deviantart.com/) and it is used here with permission.

## Resources and References

- [Blog post by Andrew Lock: "Packaging CLI programs into Docker images to avoid dependency hell"](https://andrewlock.net/packaging-cli-programs-into-docker-images-to-avoid-dependency-hell/)
- [GitHub repository](https://github.com/jonasbn/ebirah)
- [Docker Documentation: run reference for docker cli](https://docs.docker.com/engine/reference/run/)
- [DockerHub: Perl][dockerhubperl]
- [DockerHub: Ebirah][dockerhubebirah]
- [dzil.org](http://dzil.org/)
- [MetaCPAN: Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)
- [GitHub: "Getting Started with the GitHub Container Registry](https://docs.github.com/en/free-pro-team@latest/packages/getting-started-with-github-container-registry/about-github-container-registry)

[dockerhubebirah]: https://hub.docker.com/repository/docker/jonasbn/ebirah
[dockerhubperl]: https://hub.docker.com/_/perl
[GHAMKDBADGE]: https://github.com/jonasbn/ebirah/workflows/Markdownlint%20Action/badge.svg
[GHASPLLBADGE]: https://github.com/jonasbn/ebirah/workflows/Spellcheck%20Action/badge.svg
