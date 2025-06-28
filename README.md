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
          name          | default_version | installed_version |                          comment                           
------------------------+-----------------+-------------------+------------------------------------------------------------
 fuzzystrmatch          | 1.2             | 1.2               | determine similarities and distance between strings
 plpgsql                | 1.0             | 1.0               | PL/pgSQL procedural language
 vector                 | 0.8.0           | 0.8.0             | vector data type and ivfflat and hnsw access methods
 postgis                | 3.5.2           | 3.5.2             | PostGIS geometry and geography spatial types and functions
 postgis_topology       | 3.5.2           | 3.5.2             | PostGIS topology spatial types and functions
 postgis_tiger_geocoder | 3.5.2           | 3.5.2             | PostGIS tiger geocoder and reverse geocoder
(6 rows)

##
# To list all available extensions
##
postgres=# select * from pg_available_extensions;

```
