# REF: https://docs.docker.com/engine/reference/builder/
# REF: https://hub.docker.com/_/perl
FROM perl:5.34.1-bullseye

# We point to the original repository for the image
LABEL org.opencontainers.image.source https://github.com/jonasbn/ebirah

# This is our Dist::Zilla work directory, we do not want to mix this
# with our staging area
WORKDIR /usr/src/dzil

# REF: http://dzil.org/
COPY cpanfile .
RUN cpanm Dist::Zilla \
    && cpanm --installdeps .

# This is our staging work directory
WORKDIR /tmp

# This is our executable, it consumes all parameters passed to our container
ENTRYPOINT [ "dzil" ]
