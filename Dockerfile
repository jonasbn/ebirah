# https://docs.docker.com/engine/reference/builder/

# https://hub.docker.com/_/perl
FROM perl:5.30-slim

WORKDIR /usr/src/dzil

# https://metacpan.org/search?&q=Dist%3A%3AZilla
RUN cpanm Dist::Zilla

WORKDIR /tmp
ENTRYPOINT [ "dzil" ]
