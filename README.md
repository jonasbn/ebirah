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
- `ebirah setup` - runs interactive configuration process, resulting in `$HOME/.dzil/config.ini` file
- `ebirah run` - runs a executable in the context of the distribution
- `ebirah nop` - a _no-operation_ primarily for diagnostic purposes

All command options are supported.

Please see the documentation at dzil.org for more details on `dzil` use.

Ebirah does not currently support:

- `dzil release`

## Specification

The Docker image is based on [the official Perl Docker image][dockerhubperl], using the latest available stable version of this image. See the `Dockerfile` for details.

It is based on the _larger_ image, not the _slim_ version since Dist::Zilla and extensions require a toolchain for XS based Perl distributions.

## Building ebirah

Ebirah is [available on DockerHub][dockerhubebirah], but you can build it yourself based on this repository.

### Building the Docker Image

```bash
$ docker build -t ebirah .
```

### Running the Docker Image

```bash
$ docker run --rm -v $PWD:/tmp ebirah
```

## Summoning Ebirah

### Using a script

The feature listing assumes the script is named `ebirah`

```bash
#!/bin/bash

# REF:http://jonasbn.github.io/til/bash/write_safe_shell_scripts.html
set -euf -o pipefail

# run ebirah docker image in current directory and cleanup the image afterwards
docker run --rm --volume $PWD:/tmp ebirah "$@"
```

### Using an alias

```bash
# run ebirah docker image in current directory and cleanup the image afterwards
alias ebirah='docker run --rm --volume $PWD:/tmp ebirah'
```

## Resources

- [Blog post by Andrew Lock: "Packaging CLI programs into Docker images to avoid dependency hell"](https://andrewlock.net/packaging-cli-programs-into-docker-images-to-avoid-dependency-hell/)
- [GitHub repository](https://github.com/jonasbn/ebirah)
- [Docker Documentation: run reference for docker cli](https://docs.docker.com/engine/reference/run/)
- [DockerHub: Perl][dockerhubperl]
- [DockerHub: Ebirah][dockerhubebirah]
- [dzil.org](http://dzil.org/)
- [MetaCPAN: Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)

[dockerhubebirah]: https://hub.docker.com/repository/docker/jonasbn/ebirah
[dockerhubperl]: https://hub.docker.com/_/perl
