FROM rust:1.88-slim

# mdBook install
RUN cargo install mdbook mdbook-autosummary

WORKDIR /book

RUN mkdir src

COPY ./mdbook/entrypoint.sh /book/entrypoint.sh

RUN chmod +x /book/entrypoint.sh

EXPOSE 80

ENTRYPOINT /book/entrypoint.sh
