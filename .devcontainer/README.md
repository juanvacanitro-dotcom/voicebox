# Voicebox in GitHub Codespaces

This repository includes a Codespaces configuration for using Voicebox's Docker web UI from a phone or desktop browser.

## Start

1. Create a Codespace from this repository using a **4-core / 16 GB RAM** machine if available.
2. The Codespaces setup starts `docker compose up -d --build` in the background.
3. Wait for the first Docker build to finish. It can take a while because Voicebox installs the CPU inference stack and builds its web UI.
4. Open the forwarded **Voicebox Web UI** port (**17600**) from the Ports panel.

## Check progress

```bash
tail -f /tmp/voicebox-compose.log
```

Check the service:

```bash
docker compose ps
curl -fsS http://127.0.0.1:17600/health
```

If the automatic build did not start:

```bash
docker compose up -d --build
```

## Important

- The phone only displays the web UI; inference runs on the Codespaces machine.
- Use the Codespaces port as **Private**. Voicebox's API does not provide built-in authentication.
- The first build downloads large Python/TTS dependencies and voice models may require additional disk space and RAM.
- Codespaces compute and storage can be billable. Stop the Codespace when you are finished; do not leave it running unnecessarily.
- The default Voicebox Compose file exposes the web service on host port 17600 and keeps persistent Docker volumes for profiles, data, and model cache.
