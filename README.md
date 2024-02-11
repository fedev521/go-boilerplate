# Go Boilerplate

Features:

- Dockerfile that leverages cache to avoid unnecessary downloads, compilations
  and tests. It uses a distroless Debian image with non-root user.
- logging: uses [logur](https://github.com/logur/logur) as a facade (and
  adapter) and [logrus](https://github.com/sirupsen/logrus) under the hood.
  Always uses JSON formatter.
- configuration: uses [viper](https://github.com/spf13/viper). Convention:
  mandatory configuration file named `config.toml`.
- flags: with [pflag](https://github.com/spf13/pflag)
- a `run()` function to facilitate tests.

## Instructions

Run with:

```bash
cd cmd/myapp
go run .
```

Build container image with:

```bash
# DOCKER_BUILDKIT=1
docker build -t goboilerplate:latest .
```

Run container with:

```bash
docker compose up
```

## TODO

- devcontainer
- VSCode launch and task
- ko
- graceful degradation
- HTTP server
- telemetry
- helloworld tests

## Useful Resources

Heavily inspired by
[modern-go-application](https://github.com/sagikazarmark/modern-go-application/blob/main/cmd/modern-go-application/main.go).
