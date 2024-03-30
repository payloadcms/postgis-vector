# Deploy

```
ghcr.io/gvkhna/postgis-vector:latest
```

# After Deploy Initialize Extensions

```sh
$ su - postgres
$ psql
postgres=# CREATE EXTENSION vector;
postgres=# CREATE EXTENSION fuzzystrmatch;
postgres=# CREATE EXTENSION pg_trgm;
postgres=# CREATE EXTENSION pg_uuidv7;

# to verify extensions installed
postgres=# \dx
```

## Build

```sh
podman build -t postgis-vector .
```

## Minimal Run

```
podman run -it --name postgis-vector -e POSTGRES_PASSWORD=mysecretpassword -d postgis-vector
podman exec -it postgis-vector bash
```