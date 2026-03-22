# ollama-docker

Docker Compose stack for [Ollama](https://ollama.com) and [Open WebUI](https://github.com/open-webui/open-webui).

- **Ollama API:** [http://localhost:11434](http://localhost:11434)
- **Open WebUI:** [http://localhost:3000](http://localhost:3000)

## Quick start

From the repository root:

```bash
docker compose up -d --build
```

Models listed in `docker-compose.yml` (`MODELS`) are pulled on first container start via `entrypoint.sh`.

## Helper scripts

| Workflow | Start | Stop | Status | Teardown |
|----------|--------|------|--------|----------|
| **Colima** (macOS) | `./colima/start.sh` | `./colima/stop.sh` | `./colima/status.sh` | `./colima/teardown.sh` |
| **Docker Desktop** | `./docker/start.sh` | `./docker/stop.sh` | `./docker/status.sh` | `./docker/teardown.sh` |

- **Stop** removes containers for this project; **named volumes are kept** (models and WebUI data).
- **Teardown** runs `docker compose down -v` and removes those volumes; Colima teardown also stops Colima.

Restart: `./colima/restart.sh` or `./docker/restart.sh`.

## API examples

See `ollama-api.http` for sample HTTP requests (e.g. REST Client in VS Code / Cursor).

## GPU (Linux + NVIDIA)

Uncomment the `deploy.resources.reservations.devices` block under the `ollama` service in `docker-compose.yml`. On macOS, Docker does not expose the GPU to this stack; Ollama runs on CPU.
