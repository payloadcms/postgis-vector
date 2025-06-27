# postgis-vector

postgresql,postgis docker container with pgvector added

[![Build Status](https://github.com/payloadcms/postgis-vector/actions/workflows/build.yml/badge.svg)](https://github.com/payloadcms/postgis-vector/actions)

```bash
podman pull ghcr.io/payloadcms/postgis-vector:latest
```

## Build

```sh
podman build -t postgis-vector .
```

## Minimal Run

```sh
podman run -it --name postgis-vector -e POSTGRES_PASSWORD=mysecretpassword -d postgis-vector
podman exec -it postgis-vector bash

##
# To verify extensions installed
##
$ su - postgres
$ psql
postgres=# \dx

                                           List of installed extensions
          Name          | Version |   Schema   |                            Description
------------------------+---------+------------+-------------------------------------------------------------------
 fuzzystrmatch          | 1.2     | public     | determine similarities and distance between strings
 pg_trgm                | 1.6     | public     | text similarity measurement and index searching based on trigrams
 plpgsql                | 1.0     | pg_catalog | PL/pgSQL procedural language
 postgis                | 3.4.2   | public     | PostGIS geometry and geography spatial types and functions
 postgis_tiger_geocoder | 3.4.2   | tiger      | PostGIS tiger geocoder and reverse geocoder
 postgis_topology       | 3.4.2   | topology   | PostGIS topology spatial types and functions
 vector                 | 0.6.2   | public     | vector data type and ivfflat and hnsw access methods
(8 rows)

##
# To list all available extensions
##
postgres=# select * from pg_available_extensions;

```