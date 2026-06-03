---
name: update-base-image
description: Guide updating the pinned Perl base image SHA in the Dockerfile and syncing CHANGELOG
disable-model-invocation: true
---

Usage: /update-base-image [perl-version] [sha256-digest]

Steps:

1. If version or digest not provided, ask the user to supply the new `perl:X.Y.Z-slim-bookworm` tag and its SHA256 digest from https://hub.docker.com/_/perl/tags.

2. Update `ARG BASE_IMAGE=perl:X.Y.Z-slim-bookworm@sha256:<digest>` on line 1 of Dockerfile.

3. Update the `org.opencontainers.image.base.name` LABEL to match the new tag (without the digest).

4. Add a CHANGELOG.md entry under `[Unreleased]` (create the section if absent):
   ```
   ### Changed
   - Bumped Perl base image to perl:X.Y.Z-slim-bookworm
   ```

5. Show a summary diff of all changed lines.

6. Remind the user to verify the build locally:
   ```
   docker build -t jonasbn/ebirah .
   docker run --rm jonasbn/ebirah
   ```
