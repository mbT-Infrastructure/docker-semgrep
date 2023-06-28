# Semgrep image

This Docker image contains a semgrep installation.


## Environment variables

- `SEMGREP_SEND_METRICS`
    - Configure semgrep metrics, default: `off`.


## Volumes

- `/media/workdir`
    - The directory of the project to analyze.


## Development

To build and run for development run:
```bash
docker compose --file docker-compose-dev.yaml up --build
```

To build the image locally run:
```bash
./docker-build.sh
```
