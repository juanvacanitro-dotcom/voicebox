# Voicebox in GitHub Codespaces — free quota first

This setup is intended to stay within the monthly free allowance of a personal GitHub account. It is **not unlimited free hosting**.

## Included GitHub Codespaces allowance

GitHub personal accounts currently include monthly Codespaces allowance:

- GitHub Free: **120 core-hours** and **15 GB-month** storage.
- A 4-core Codespace uses 4 core-hours per active hour, so the 4-core / 16 GB machine uses up to **30 active hours** from the 120 core-hour allowance.
- Storage is measured separately and accumulates while the Codespace exists.

The included allowance is shared with other Codespaces on the same personal account. Check your current usage before creating this one:
https://github.com/settings/billing

To avoid any possibility of a charge, do not add a payment method for Codespaces. GitHub says usage is blocked when the included quota is exhausted if there is no valid payment method. If a payment method is already saved, review the spending limit and ensure paid overages are disabled before proceeding.

## Start

1. Check your remaining Codespaces compute and storage allowance at https://github.com/settings/billing.
2. Create a Codespace from this repository using **4 cores / 16 GB RAM** if it is available and the free allowance is sufficient.
3. The Codespaces setup starts `docker compose up -d --build` in the background.
4. Wait for the first Docker build to finish. It downloads a large Python/TTS stack and can take time.
5. Open the forwarded **Voicebox Web UI** port (**17600**) from the Ports panel. Keep the port **Private**.

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

## Keep it free

- Do not choose a paid machine or enable paid overages.
- Stop the Codespace when you are not using Voicebox. Active compute consumes core-hours.
- Delete the Codespace when you no longer need it; storage continues to accrue while it exists.
- Voicebox model downloads and generated files use disk space. The free storage allowance is limited, so avoid downloading multiple large models.
- The phone only displays the web UI; inference runs on the Codespaces machine.
- Voicebox's API does not provide built-in authentication. Keep the forwarded port **Private**.

This provides limited testing within GitHub's included allowance, not a permanently running, unlimited free server.
