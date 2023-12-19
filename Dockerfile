# Builder stage
FROM quay.io/projectquay/golang:1.20 as builder

ARG TARGETOS
ARG TARGETARCH

WORKDIR /go/src/app
COPY . .
RUN make build TARGETOS=${TARGETOS} TARGETARCH=${TARGETARCH}

# Final image stage
# Using Alpine as a common base for the final image
# Alpine is a lightweight image that supports multiple architectures including amd64 and arm64
FROM alpine:latest

WORKDIR /

# Copy the binary from the builder stage
COPY --from=builder /go/src/app/kbot .

# Install ca-certificates for secure connections
# RUN apk --no-cache add ca-certificates
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

ENTRYPOINT ["./kbot", "start"]
