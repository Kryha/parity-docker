FROM parity/parity:stable as notifier

FROM rust:slim as builder

LABEL maintainer="dan@kryha.io"

# install parity dependencies and build parity with secretstore

RUN apt-get update -qq && apt-get install build-essential cmake git libudev-dev -qqy && \
    git clone https://github.com/paritytech/parity && \
    cd parity && \
    git checkout stable && \
    cargo build --release

FROM ubuntu:latest

COPY --from=builder /parity/target/release/parity /bin/

ENTRYPOINT ["/bin/parity"]
