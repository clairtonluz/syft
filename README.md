# syft

Docker image for [Syft](https://github.com/anchore/syft) - A CLI tool for generating Software Bill of Materials (SBOM).

## Features

- Based on Alpine Linux (minimal image size)
- Includes `sh` shell (built-in with Alpine)
- Includes `curl` for downloading and working with remote resources
- Multi-architecture support: `linux/amd64`, `linux/arm64`, `linux/arm/v7`
- Automated builds via GitHub Actions

## Usage

### Pull the Docker image

```bash
docker pull clairtonluz/syft:latest
```

### Run Syft

```bash
# Scan a container image
docker run --rm clairtonluz/syft:latest alpine:latest

# Scan with specific output format
docker run --rm clairtonluz/syft:latest alpine:latest -o cyclonedx-json

# Mount a local directory and scan
docker run --rm -v $(pwd):/scan clairtonluz/syft:latest dir:/scan
```

### Available Tools

The image includes:
- `syft` - The main Syft binary
- `sh` - Shell for scripting
- `curl` - For HTTP/HTTPS operations

## Building

### Local Build

```bash
docker build -t syft:local .
```

To build with a specific Syft version:

```bash
docker build --build-arg SYFT_VERSION=v1.18.1 -t syft:v1.18.1 .
```

### Multi-Architecture Build

The repository includes a GitHub Actions workflow that automatically builds and pushes multi-architecture images:

- **Trigger**: Pushes to `main`/`master` branches, version tags, or manual dispatch
- **Platforms**: `linux/amd64`, `linux/arm64`, `linux/arm/v7`
- **Registry**: Docker Hub

#### Required Secrets

To enable automated builds, configure these secrets in your GitHub repository:
- `DOCKER_USERNAME`: Your Docker Hub username
- `DOCKER_PASSWORD`: Your Docker Hub access token (recommended) or password
  - For better security, use a [Docker Hub access token](https://docs.docker.com/security/for-developers/access-tokens/) instead of your password

## License

See [LICENSE](LICENSE) file.