ARG PG_MAJOR=17
ARG PG_VECTOR_VERSION=0.8.0
# See https://github.com/postgis/docker-postgis/issues/216
FROM imresamu/postgis:$PG_MAJOR-3.5-bookworm
ARG PG_MAJOR
ARG PG_VECTOR_VERSION

LABEL org.opencontainers.image.title="postgis-vector" \
      org.opencontainers.image.description="postgresql+postgis container with pgvector added" \
      org.opencontainers.image.vendor="Payload" \
      org.opencontainers.image.authors="Payload <dev@payloadcms.com>" \
      org.opencontainers.image.version="17-4.0" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.url="https://github.com/payloadcms/postgis-vector" \
      org.opencontainers.image.source="https://github.com/payloadcms/postgis-vector"

RUN apt-get update \
  && apt-mark hold locales \
  && apt-get install -qq -y --no-install-recommends \
  build-essential \
  git \
  clang-13 \
  llvm-13 \
  llvm-13-dev \
  pgxnclient \
  postgresql-server-dev-$PG_MAJOR \
  && git clone --branch v"${PG_VECTOR_VERSION}" https://github.com/pgvector/pgvector.git /tmp/pgvector \
  && cd /tmp/pgvector \
  && make && make install \
  && cd / \
  && rm -rf /tmp/pgvector \
  && apt-get remove -y build-essential clang-13 llvm-13 llvm-13-dev postgresql-server-dev-$PG_MAJOR \
  && apt-get autoremove -y \
  && apt-get clean \
  && apt-mark unhold locales \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./initdb-extensions.sh /docker-entrypoint-initdb.d/20_extensions.sh

# Ensure postgis extension does not automatically create tables to prevent "You're about to delete spatial_ref_sys table with 8500 items" drizzle schema prompts on first run
RUN rm -f /docker-entrypoint-initdb.d/10_postgis.sh
