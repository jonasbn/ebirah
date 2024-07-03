# REF: https://docs.docker.com/engine/reference/builder/
# REF: https://hub.docker.com/_/perl
FROM perl:5.40.0-slim-bookworm

# We point to the original repository for the image
LABEL org.opencontainers.image.source="https://github.com/jonasbn/ebirah"
LABEL org.opencontainers.image.base.name="registry.hub.docker.com/library/perl:5.40.0-bookworm"
LABEL org.opencontainers.image.url="https://github.com/jonasbn/ebirah"
LABEL org.opencontainers.image.title="ebirah"
LABEL org.opencontainers.image.description="Experimental Docker image for Dist::Zilla"

ENV DEBIAN_FRONTEND=noninteractive RUNNER_GROUP=distzilla RUNNER_USER=runner
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/* && addgroup "$RUNNER_GROUP" && \
    adduser --ingroup "$RUNNER_GROUP" --home /home/runner --shell /bin/bash \
    --disabled-password --gecos '' runner

# Non-privileged user to run dzil
USER "$RUNNER_USER"
# This is our Dist::Zilla work directory, we do not want to mix this
# with our staging area
WORKDIR /home/runner

ENV LOCAL_LIB_FILE=local_lib.txt CPAN_FILE=cpanfile
# REF: http://dzil.org/
COPY $LOCAL_LIB_FILE $CPAN_FILE ./
RUN cpanm --local-lib="$HOME/perl5" 'local::lib' && \
    eval "$(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)" && \
    # probably not required, but let's setup it here
    cat $LOCAL_LIB_FILE >> .bashrc && \
    rm -fv $LOCAL_LIB_FILE

RUN cpanm --notest Dist::Zilla && rm -rf "$HOME/.cpanm" && rm -rf /tmp/*
RUN cpanm --installdeps --notest . && rm -rf "$HOME/.cpanm" && rm -rf /tmp/* && rm -fv "$CPAN_FILE"

# This is our staging work directory
WORKDIR /tmp
COPY --chmod=555 entrypoint.sh /opt
# This is our executable, it consumes all parameters passed to our container
ENTRYPOINT ["/bin/bash", "/opt/entrypoint.sh"]
CMD ["version"]
