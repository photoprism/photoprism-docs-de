# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Authoritative In-Repo References

Read these first — they cover everything below in more depth and are kept more current than this file:

- `AGENTS.md` — the authoritative agent/contributor guide for this repo: purpose, sources of truth, scope, build/preview workflow, style notes, commit and issue conventions, security notes.
- `README.md` — contributor onboarding, MkDocs install, local preview, and deployment overview.
- `mkdocs.yml` — the German navigation tree; a new or moved page is invisible until registered here.

If anything below conflicts with those files or with the `Makefile`, those win.

## What This Repo Is

The **German translation of the PhotoPrism User Guide**, published at https://docs-de.photoprism.app/. It is a **MkDocs Material** site — German Markdown sources under `docs/`, rendered to static HTML. There is no application code.

- **User Guide only.** Content lives in `docs/user-guide/` plus the landing page `docs/index.md`. Unlike the English docs, there is **no Getting Started or Developer Guide** tree here.
- **Source of truth for content is the English repo**, `photoprism/photoprism-docs` (`docs/` tree + `AGENTS.md`/`CODEMAP.md`). Translate from there; mirror English paths where possible so redirects stay predictable. Nav labels are German (in `mkdocs.yml`).
- **No `llms.txt` here — intentional.** Unlike the English docs, this site does **not** publish `llms.txt` / `llms-full.txt`. Do not add an llms.txt build hook to this repo.

## Common Commands (via `Makefile`)

| Command           | What it does                                                                                                             |
|-------------------|--------------------------------------------------------------------------------------------------------------------------|
| `make deps`       | Debian/Ubuntu first-time setup: `apt` Python packages, then `make upgrade`                                               |
| `make install`    | Create `venv/` and install MkDocs Material + `requirements.txt` (no `apt`)                                               |
| `make upgrade`    | Nuke `venv/` and reinstall; use when dependencies drift or you want the latest Material                                  |
| `make watch`      | Alias for `make serve` — MkDocs livereload on `0.0.0.0:8000` (watches `docs/`, `overrides/`, `mkdocs.yml`)               |
| `make build`      | Production render using `mkdocs.deploy.yml` → `site/` (do not commit `site/`)                                            |
| `make deploy`     | `mkdocs gh-deploy --force --config-file mkdocs.deploy.yml` — emergency manual publish only                               |
| `make merge`      | `develop` → `deploy` merge that triggers the GitHub Actions publish pipeline                                             |
| `make img-resize` | `mogrify` to cap screenshots at `1000x860`; run after adding images under `docs/user-guide/img` or nested `img/` folders |
| `make fix`        | `chown`/`chmod` the tree when MkDocs can't read or write files                                                           |

There are no repo-wide lint or test targets — reviewing `make watch` output for MkDocs warnings (missing files, broken nav links, unresolved references) is the closest equivalent.

MkDocs Material Insiders is now public on PyPI, so **no `GH_TOKEN` is required** in `.env`.

**Building — two options:**

- **Ephemeral container (preferred — installs nothing on the host).** Use the upstream `squidfunk/mkdocs-material` image and add the repo's extra plugins from `requirements.txt` at run time. The image's entrypoint is `mkdocs`, so override it with `--entrypoint sh` to run `pip` first:

  ```sh
  docker run --rm --entrypoint sh -v "$PWD":/docs -w /docs squidfunk/mkdocs-material:latest \
    -c "pip install -r requirements.txt && mkdocs build -f mkdocs.deploy.yml"
  ```

  A complete, throwaway build env. The container writes `site/` as **root** (git-ignored; remove with another `docker run … rm -rf site` if needed).
- **Host `venv`.** `make deps` (first time), then `make watch` (livereload) or `make build`.

## Architecture & Deployment

**Two MkDocs configs, both must stay in sync.**
- `mkdocs.yml` — base config: `nav:` (German), theme options, plugins (`search`, `redirects` with the dev redirect map), Markdown extensions, metadata, edit links. **The `nav:` map is the sole source of truth for site navigation.**
- `mkdocs.deploy.yml` — inherits from `mkdocs.yml`, re-declares the plugins with the **production** redirect map, and adds the `privacy` plugin (mirrors external assets at build time). Used by `make build` / `make deploy` and by CI.

When you **add or rename a redirect**, update the entries in **both** configs so local previews and production match. Same for nav changes that affect URLs.

**Deployment flow.** Work on `develop`. Merging `develop` → `deploy` (`make merge`) triggers the GitHub Actions pipeline (`.github/workflows/ci.yml`) which runs `mkdocs gh-deploy --force --config-file mkdocs.deploy.yml`, publishing to `gh-pages`. `web2` pulls `gh-pages` every ~5 minutes and serves `docs-de.photoprism.app` (fronted by the Bunny CDN). So **`deploy` updates are production releases**, not staging. `make merge` ends by switching back to `develop`.

**`site/` and `venv/` are build artifacts.** Never commit them and never edit `site/` by hand.

## Style & Conventions

- **Write natural German** that matches the tone and terminology of the canonical English pages; keep feature-name translations consistent (Alben, Personen, Labels, Bibliothek, …). Confirm product behavior against the main app repo or English docs to avoid drift.
- **German straight double quotes** `"…"` — not the typographic `„…"` form.
- **Localize, don't translate 1:1**, the `<meta name="keywords">` list in `overrides/main.html` (e.g. `dsgvo`, not `gdpr`).
- **Keep headings/nav labels consistent with `mkdocs.yml`**; don't introduce new casing styles. Store images next to the page that references them, with descriptive alt text.
- **Refresh `**Last Updated:**`** at the top of a page whenever you change its contents (format: `January 20, 2026`, no time); leave it for whitespace-only edits.
- **Commit messages:** concise, imperative, one-word `Prefix:` (e.g. `Content: Translate Search Filters page`), subject ≤80 chars. Do **not** append `Co-Authored-By: Claude …` trailers; no emojis.
- **GitHub issues:** only create/edit/close/relabel when explicitly asked (see `AGENTS.md` for the required User Story + Acceptance Criteria format).
- **Never commit credentials**; keep `.env` untracked.
