# REF: https://docs.docker.com/engine/reference/builder/

# REF: https://hub.docker.com/_/perl
FROM perl:5.32.0

# We need C compiler and related tools
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends

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
