# Semgrep image

This container image runs a semgrep analysis on a mounted project.

## Installation

1. Pull from [Docker Hub], download the package from [Releases] or build using `builder/build.sh`

### Environment variables

## Usage

- `SEMGREP_RULES`
    - The rules to apply. See the [Dockerfile](./Dockerfile) for the default.
- `SEMGREP_SEND_METRICS`
    - Configure semgrep metrics, default: `off`.

### Volumes

- `/media/workdir`
    - The directory of the project to analyze.

## Development

To build and run the docker container for development execute:

```bash
docker compose --file docker-compose-dev.yaml up --build
```

[Docker Hub]: https://hub.docker.com/r/madebytimo/semgrep
[Releases]: https://github.com/mbT-Infrastructure/docker-semgrep/releases
