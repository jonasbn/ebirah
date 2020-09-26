# ebirah

Experimental Docker project for [Dist::Zilla](dzil.org)

[Ebirah](https://en.wikipedia.org/wiki/Ebirah) is one of the [Godzilla characters](https://en.wikipedia.org/wiki/Category:Godzilla_characters)

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

This is on [the roadmap](https://github.com/jonasbn/ebirah/projects/1).

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
$ docker pull jonasbn/ebirah:0.6.0
$ docker run --rm --volume $PWD:/tmp jonasbn/ebirah:0.6.0
```

And if you are want the latest build from DockerHub:

```bash
$ docker pull jonasbn/ebirah:lastest
$ docker run --rm --volume $PWD:/tmp jonasbn/ebirah:latest
```

As mentioned `latest` can be considered _unstable_ or _experimental_. Development is kept in branches, but new experimental features might make into master for wider evaluation.

Using the image [available from GitHub](https://github.com/jonasbn/ebirah/packages) instead of DockerHub, do note this repository is in beta:

```bash
$ docker pull ghcr.io/jonasbn/ebirah:0.6.0
$ docker run --rm --volume $PWD:/tmp ghcr.io/jonasbn/ebirah:0.6.0
```

### Using a script

The feature listing assumes the script is named `ebirah`

```bash
#!/bin/bash

# REF:http://jonasbn.github.io/til/bash/write_safe_shell_scripts.html
set -euf -o pipefail

# run ebirah docker image in current directory and cleanup the image afterwards
docker run --rm --volume $PWD:/tmp jonasbn/ebirah "$@"
```

### Using an alias

```bash
# run ebirah docker image in current directory and cleanup the image afterwards
alias ebirah='docker run --rm --volume $PWD:/tmp jonasbn/ebirah'
```

## Diagnostics

### `no configuration (e.g, dist.ini)`

This error indicates that you have forgotten to invoke the Docker command with `--volume`

1. Add `--volume` as specified in the documentation to your invocation

```bash
docker run --rm --volume $PWD:/tmp jonasbn/ebirah'
```

### `Invalid selection, please try again:`

If you are executing the `setup` command and you have forgotten to o invoke the Docker command with `--volume`. You will get a lot of repeated messages:

```text
Invalid selection, please try again: Invalid selection, please try again:
```

For now the `setup` command is not supported.

```bash
docker run --rm --volume $PWD:/tmp jonasbn/ebirah'
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
$ docker run --rm -v $PWD:/tmp jonasbn/ebirah
```

Do note you can use the shortform `ebirah` for the image name, I just use the fully qualified name matching my own usage pattern and the examples and documentation above.

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
