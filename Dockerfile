FROM rust:1.78 as builder

# Install required dependencies for diesel_cli and PostgreSQL
RUN apt-get update && \
    apt-get install -y \
    libpq-dev \
    pkg-config \
    openssl \
    postgresql-client

# Install diesel_cli for migrations
RUN cargo install diesel_cli --no-default-features --features postgres --locked

WORKDIR /app
COPY . .

# Build the application
RUN cargo build --release

# Runtime stage
FROM debian:bookworm-slim

# Install PostgreSQL client and other dependencies
RUN apt-get update && \
    apt-get install -y \
    libpq-dev \
    openssl \
    ca-certificates \
    postgresql-client

WORKDIR /app

# Copy the built binary from builder
COPY --from=builder /app/target/release/test-api /app/test-api
# Copy migrations
COPY --from=builder /app/migrations /app/migrations
# Copy diesel_cli binary
COPY --from=builder /usr/local/cargo/bin/diesel /usr/local/bin/diesel

# Copy entrypoint script
COPY entrypoint.sh /app/entrypoint.sh

# Make our entrypoint script executable
RUN chmod +x /app/entrypoint.sh

EXPOSE 9090

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/app/test-api"]