#!/bin/bash

# TODO: probably not the best way to setup local::lib, but bash --login
# is not doing it's job
PATH="/home/runner/perl5/bin${PATH:+:${PATH}}"
export PATH
PERL5LIB="/home/runner/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/runner/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
# shellcheck disable=SC2089
PERL_MB_OPT="--install_base \"/home/runner/perl5\"";
# shellcheck disable=SC2090
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/home/runner/perl5"
export PERL_MM_OPT

exec dzil "$@"