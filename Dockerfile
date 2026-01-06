# Use Alpine Linux as the base image (includes sh by default)
FROM alpine:latest

# Install curl and ca-certificates for Syft installation and runtime
RUN apk add --no-cache curl ca-certificates

# Set Syft version (can be overridden at build time)
# Note: Update this version periodically to get the latest features and security fixes
# Check https://github.com/anchore/syft/releases for available versions
ARG SYFT_VERSION=v1.39.0
ARG TARGETOS=linux
ARG TARGETARCH=amd64

# Download and install Syft binary directly from GitHub releases
# This is more secure than running an arbitrary script
RUN set -ex && \
    SYFT_BINARY="syft_${SYFT_VERSION#v}_${TARGETOS}_${TARGETARCH}.tar.gz" && \
    curl -sSfL "https://github.com/anchore/syft/releases/download/${SYFT_VERSION}/${SYFT_BINARY}" -o /tmp/syft.tar.gz && \
    tar -xzf /tmp/syft.tar.gz -C /tmp && \
    mv /tmp/syft /usr/local/bin/syft && \
    chmod +x /usr/local/bin/syft && \
    rm -rf /tmp/*

# Verify installation
RUN syft version

# Set Syft as the entrypoint
ENTRYPOINT ["/usr/local/bin/syft"]

# Default command - show help
CMD ["--help"]
