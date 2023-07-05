# REF: https://docs.docker.com/engine/reference/builder/
# REF: https://hub.docker.com/_/perl
FROM perl:5.38.0-bullseye

# We point to the original repository for the image
LABEL org.opencontainers.image.source https://github.com/jonasbn/ebirah

# This is our Dist::Zilla work directory, we do not want to mix this
# with our staging area
WORKDIR /usr/src/dzil

# REF: http://dzil.org/
COPY cpanfile .

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN cpanm --notest Dist::Zilla && rm -rf $HOME/.cpanm && rm -rf /tmp/*
RUN cpanm --installdeps --notest . && rm -rf $HOME/.cpanm && rm -rf /tmp/*

# This is our staging work directory
WORKDIR /tmp

# This is our executable, it consumes all parameters passed to our container
ENTRYPOINT [ "dzil" ]
