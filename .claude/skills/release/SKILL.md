---
name: release
description: Cut a release by updating CHANGELOG and creating a signed version tag
disable-model-invocation: true
---

Usage: /release <version>  (e.g. /release 1.2.3)

Steps:

1. If no version provided, ask the user for the semver version (format: X.Y.Z).

2. In `CHANGELOG.md`, rename `[Unreleased]` to `[<version>] - <today's date>` and add a new empty `[Unreleased]` section above it with the standard subsections.

3. Show the CHANGELOG diff and ask for confirmation before proceeding.

4. Stage and commit:
   ```
   git add CHANGELOG.md
   git commit -m "Release <version>"
   ```

5. Create an annotated tag:
   ```
   git tag -a <version> -m "Release <version>"
   ```

6. Remind the user to push both branch and tag:
   ```
   git push && git push --tags
   ```
   The `publish.yml` workflow triggers automatically on the tag and builds
   multi-platform images (linux/amd64, linux/arm64) pushed to DockerHub
   and GHCR.
