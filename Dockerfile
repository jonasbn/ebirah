FROM perl:5.30

RUN cpanm Dist::Zilla

ENTRYPOINT [ "dzil" ]
