ARG PG_MAJOR=16
FROM postgis/postgis:$PG_MAJOR-3.4
ARG PG_MAJOR

LABEL org.opencontainers.image.title="postgis-vector" \
      org.opencontainers.image.description="postgresql+postgis container with pgvector added" \
      org.opencontainers.image.vendor="@gvkhna" \
      org.opencontainers.image.authors="Gaurav Khanna <gaurav@gvkhna.com>" \
      org.opencontainers.image.version="16-3.4" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.url="https://github.com/gvkhna/postgis-vector" \
      org.opencontainers.image.source="https://github.com/gvkhna/postgis-vector"

RUN apt-get update \
  && apt-mark hold locales \
	&& apt-get install -qq -y --no-install-recommends \
  build-essential \
  pgxnclient \
  postgresql-server-dev-$PG_MAJOR \
  && pgxn install 'pg_uuidv7=1.5.0' \
  && pgxn install 'vector=0.6.2' \
  && apt-get remove -y build-essential postgresql-server-dev-$PG_MAJOR \
	&& apt-get autoremove -y \
  && apt-get clean \
  && apt-mark unhold locales \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*