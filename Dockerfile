# Use Alpine Linux as the base image (includes sh by default)
FROM alpine:latest

# Install curl and ca-certificates for Syft installation and runtime
# Alpine's package manager will be available in proper build environments
RUN apk add --no-cache curl ca-certificates

# Download and install Syft using the official installation script
# The script will download the appropriate binary for the architecture
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin

# Verify installation
RUN syft version

# Set Syft as the entrypoint
ENTRYPOINT ["/usr/local/bin/syft"]

# Default command - show help
CMD ["--help"]
