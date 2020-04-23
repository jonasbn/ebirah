# ebirah

Experimental Docker project for [Dist::Zilla](dzil.org)

[Ebirah](https://en.wikipedia.org/wiki/Ebirah) is one of the [Godzilla characters](https://en.wikipedia.org/wiki/Category:Godzilla_characters)

The Dockerfile is based on [the official Perl Docker image](https://hub.docker.com/_/perl)

## Building the Docker Image

```bash
$ docker build -t ebirah .
```

## Running the Docker Image

```bash
$ docker run --rm -v $PWD:/tmp ebirah
```

## Resources

- [Blog post by Andrew Lock: "Packaging CLI programs into Docker images to avoid dependency hell"](https://andrewlock.net/packaging-cli-programs-into-docker-images-to-avoid-dependency-hell/)
- [GitHub repository](https://github.com/jonasbn/ebirah)
- [Docker Documentation: run reference for docker cli](https://docs.docker.com/engine/reference/run/)
- [DockerHub: Perl](https://hub.docker.com/_/perl)
- [dzil.org](http://dzil.org/)
- [MetaCPAN: Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)
