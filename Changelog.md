# Change log for Ebirah

## 0.4.0 2020-05-03 Feature release, update recommended

- Added support for the `xtest` command using:
  - [Dist::Zilla::App::Command::xtest](https://metacpan.org/pod/Dist::Zilla::App::Command::xtest)

## 0.3.0 2020-04-26 Feature release, update recommended

- Changed the base Docker image to be a non-slim image so we get a complete toolchain for our Dist::Zilla extensions, what require or has requirements for XS based distributions

  REF: [DockerHub: Perl](https://hub.docker.com/_/perl)

  The non-slim images are are based on `buildpack-deps`

  REF: [DockerHub: buildpack-deps](https://hub.docker.com/_/buildpack-deps/)

- Shell script described in the documentation added to the prototypes directory for reference

## 0.2.0 2020-04-23 Feature release, update recommended

- Following additions have been made:
  - [Dist::Zilla::Plugin::ExtraTests](https://metacpan.org/pod/Dist::Zilla::Plugin::ExtraTests)
  - [Dist::Zilla::Plugin::GatherDir](https://metacpan.org/pod/Dist::Zilla::Plugin::GatherDir)
  - [Dist::Zilla::Plugin::GithubMeta](https://metacpan.org/pod/Dist::Zilla::Plugin::GithubMeta)
  - [Dist::Zilla::Plugin::InstallGuide](https://metacpan.org/pod/Dist::Zilla::Plugin::InstallGuide)
  - [Dist::Zilla::Plugin::MetaJSON](https://metacpan.org/pod/Dist::Zilla::Plugin::MetaJSON)
  - [Dist::Zilla::Plugin::MetaProvides::Package](https://metacpan.org/pod/Dist::Zilla::Plugin::MetaProvides::Package)
  - [Dist::Zilla::Plugin::ModuleBuild](https://metacpan.org/pod/Dist::Zilla::Plugin::ModuleBuild)
  - [Dist::Zilla::Plugin::OurPkgVersion](https://metacpan.org/pod/Dist::Zilla::Plugin::OurPkgVersion)
  - [Dist::Zilla::Plugin::PodCoverageTests](https://metacpan.org/pod/Dist::Zilla::Plugin::PodCoverageTests)
  - [Dist::Zilla::Plugin::PodSyntaxTests](https://metacpan.org/pod/Dist::Zilla::Plugin::PodSyntaxTests)
  - [Dist::Zilla::Plugin::Prereqs::FromCPANfile](https://metacpan.org/pod/Dist::Zilla::Plugin::Prereqs::FromCPANfile)
  - [Dist::Zilla::Plugin::ReadmeAnyFromPod](https://metacpan.org/pod/Dist::Zilla::Plugin::ReadmeAnyFromPod)
  - [Dist::Zilla::Plugin::Test::CPAN::Changes](https://metacpan.org/pod/Dist::Zilla::Plugin::Test::CPAN::Changes)
  - [Dist::Zilla::Plugin::Test::CPAN::Meta::JSON](https://metacpan.org/pod/Dist::Zilla::Plugin::Test::CPAN::Meta::JSON)
  - [Dist::Zilla::Plugin::Test::Compile](https://metacpan.org/pod/Dist::Zilla::Plugin::Test::Compile)
  - [Dist::Zilla::Plugin::Test::Kwalitee](https://metacpan.org/pod/Dist::Zilla::Plugin::Test::Kwalitee)
  - [Dist::Zilla::Plugin::Test::Perl::Critic](https://metacpan.org/pod/Dist::Zilla::Plugin::Test::Perl::Critic)
  - [Dist::Zilla::PluginBundle::Basic](https://metacpan.org/pod/Dist::Zilla::PluginBundle::Basic)
  - [Dist::Zilla::PluginBundle::Filter](https://metacpan.org/pod/Dist::Zilla::PluginBundle::Filter)
  - [Software::License::Artistic_2_0](https://metacpan.org/pod/Software::License::Artistic_2_0)

- Also added, since these are used by some of the above plugins, but not explicitly required
  - [Pod::Coverage::TrustPod](https://metacpan.org/pod/Pod::Coverage::TrustPod)
  - [Test::Pod::Coverage](https://metacpan.org/pod/Test::Pod::Coverage) 1.08

- ebirah now supports the following use cases/commands:
  - `dzil help`
  - `dzil new`
  - `dzil setup`
  - `dzil listdeps`
  - `dzil authordeps`
  - `dzil build`
  - `dzil test`
  - `dzil smoke`
  - `dzil clean`
  - parameters seem to be supported, an exhaustive test has not been completed yet

## 0.1.0 2020-04-23 Feature release

- Initial release
- Support for very limited use of [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) 6.014
- No interaction with other related tools like `cpanm`
- No support for Dist::Zilla plugins/extensions
