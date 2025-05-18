# Change log for Ebirah

## 0.12.0 2025-01-28 Maintenance release, update not required

- Bumping base image to Perl 5.40.2, See PR [#120](https://github.com/jonasbn/ebirah/pull/114) from @dependabot

- Attempting with pinned based image, pinned to SHA checksum

## 0.11.0 2025-01-28 Maintenance release, update not required

- Bumping base image to Perl 5.40.1, See PR [#114](https://github.com/jonasbn/ebirah/pull/114) from @dependabot

## 0.10.0 2024-07-03 Maintenance release, update not required

- Bumping base image to Perl 5.40.0 Bookworm instead of Bullseye. See PR [#92](https://github.com/jonasbn/ebirah/pull/92)

## 0.9.0 2024-06-24 Feature release, update recommended

- Via PR [#82](https://github.com/jonasbn/ebirah/pull/82) from @glasswalk3r, the Docker image has been updated to use a non-root user, this is a most welcome security enhancement

- The Docker base image has been updated from Perl 5.38.2 to Perl 5.40.0 via PR [#89](https://github.com/jonasbn/ebirah/pull/89) from @dependabot

- This release updates the dependency: [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) from version `6.025` to `6.032`, please see the [change log](https://metacpan.org/dist/Dist-Zilla/changes) of [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)

## 0.8.0 2022-10-02 Maintenance release, update recommended

- This release updates the dependency: [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) from version `6.017` to `6.025`, please see the [change log](https://metacpan.org/dist/Dist-Zilla/changes) of [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)

## 0.7.0 2022-09-03 Maintenance release, update not required

- Improvements to Docker image generation, reducing size via contribution and PR [#46](https://github.com/jonasbn/ebirah/pull/46) from @glasswalk3r

- The base image has been updated several times without releases, the are listed below for information. With this version the image is bumped up to Perl 5.36.0, which should be the latest at the time of writing

  - Renovate updated perl in `Dockerfile` from 5.34.1 to 5.36.0 via PR [#42](https://github.com/jonasbn/ebirah/pull/42)

  - Dependabot updated perl in `Dockerfile` from 5.34.0 to 5.34.1 via PR [#31](https://github.com/jonasbn/ebirah/pull/31)

  - Dependabot updated perl in `Dockerfile` from 5.32.1 to 5.34.0 via PR [#18](https://github.com/jonasbn/ebirah/pull/18)

  - Dependabot updated perl in `Dockerfile` from 5.32.0 to 5.32.1 via PR [#14](https://github.com/jonasbn/ebirah/pull/14)

## 0.6.0 2020-09-26 Feature release, update not required

- Added support for: [Dist::Zilla::Plugin::VersionFromMainModule](https://metacpan.org/pod/Dist::Zilla::Plugin::VersionFromMainModule)
  I have some older distributions, but instead of changing them all to adhere to the contemporary usage
  pattern I decided to be able to handle them, they will be updated eventually, but this is more in the spirit of Ebirah

- Added meta data information to `Dockerfile` so it identifies the repository it originates from

## 0.5.0 2020-06-30 Maintenance release, update not required

- Dependabot updated perl in `Dockerfile` from 5.30 to 5.32.0 via PR [#9](https://github.com/jonasbn/ebirah/pull/9)

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
