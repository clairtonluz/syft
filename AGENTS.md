# Repository Guidelines

## Project Structure & Module Organization
- `Dockerfile` defines the container image build for the Syft CLI.
- `README.md` documents usage, build options, and supported platforms.
- `LICENSE` contains the project license.

This repository is intentionally minimal; the primary artifact is the Docker image.

## Build, Test, and Development Commands
- `docker build -t syft:local .` builds the local image from `Dockerfile`.
- `docker build --build-arg SYFT_VERSION=v1.39.0 -t syft:v1.39.0 .` builds with a pinned Syft version.
- `docker run --rm clairtonluz/syft:latest alpine:latest` runs Syft against an image.

There are no local build scripts or task runners in this repository.

## Coding Style & Naming Conventions
- Dockerfile uses standard Docker directives with one instruction per line.
- Use shell-safe, explicit commands in `RUN` steps (e.g., `set -ex`).
- Name build args in uppercase (e.g., `SYFT_VERSION`, `TARGETARCH`).

## Testing Guidelines
- No automated tests are currently defined.
- Validate changes by building the image and running `syft version` or a sample scan:
  - `docker run --rm syft:local --version`
  - `docker run --rm syft:local alpine:latest`

## Commit & Pull Request Guidelines
- Commit message conventions are not specified; use clear, imperative summaries (e.g., "Update Syft version to v1.39.0").
- PRs should include:
  - A short description of the change and its intent.
  - Any relevant build args or version changes.
  - Example commands used to verify the image locally.
 - When responding as an agent, always end with a suggested commit message using good practice (e.g., a conventional commit).

## Agent-Specific Instructions
- Assume the persona of an SRE and cybersecurity specialist: prioritize reliability, least-privilege security, risk awareness, and operational clarity; call out threat and failure modes when relevant; keep guidance practical and action-oriented.

## Security & Configuration Tips
- Prefer Docker Hub access tokens for CI secrets.
- Keep `SYFT_VERSION` current to pick up security fixes from upstream releases.
