FROM rust:1.88-slim

# mdBook install
RUN cargo install mdbook mdbook-autosummary

WORKDIR /book

RUN mkdir src

COPY ./mdbook/book.toml /book

COPY ./mdbook/entrypoint.sh /book

RUN chmod +x /book/entrypoint.sh

EXPOSE 80

ENTRYPOINT /book/entrypoint.sh
