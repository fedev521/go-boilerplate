# Go Boilerplate

Features:

- Dockerfile that leverages cache to avoid unnecessary downloads, compilations
  and tests. It uses a distroless Debian image. Build with `DOCKER_BUILDKIT=1
  docker build -t "<imagename>:latest" .`
- logging: uses [logur](https://github.com/logur/logur) as a facade (and
  adapter) and [logrus](https://github.com/sirupsen/logrus) under the hood.
  Always uses JSON formatter.
- configuration: uses [viper](https://github.com/spf13/viper). Convention:
  mandatory configuration file named `config.toml`.
- flags: with [pflag](https://github.com/spf13/pflag)
- a `run()` function to facilitate tests.

## TODO

- run function, then app start
- VSCode launch and task
- graceful degradation
- HTTP server
- recover middleware
- support to CLI?
- telemetry?
- tests?

## Useful Resources

Heavily inspired by
[modern-go-application](https://github.com/sagikazarmark/modern-go-application/blob/main/cmd/modern-go-application/main.go).