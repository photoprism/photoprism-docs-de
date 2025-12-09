PhotoPrism Docs-DE CODEMAP

**Last Updated:** December 8, 2025

Purpose
- Provide a fast orientation for contributors working on the German User Guide so they can find Markdown sources, assets, templates, and build tooling without guesswork.
- Complement `AGENTS.md` by showing how MkDocs configuration, content folders, and deployment helpers relate to one another.

Quick Start
- Local workflow: `make deps` (Debian/Ubuntu) or `make install` to create `venv/`; refresh with `make upgrade` if dependencies drift.  
- Preview: `make watch` serves http://localhost:8000/ with live reload for `docs/`, `overrides/`, and `mkdocs.yml`.  
- Production render: `make build` uses `mkdocs.deploy.yml`; use `make deploy` only for emergency GitHub Pages pushes. Standard publishing happens by merging `develop` into `deploy` (or running `make merge`).  
- Material for MkDocs (former Insiders features) installs directly from PyPI, so no GitHub token or private repo is required.

Tooling & Configuration
- `README.md` — contributor entry point (German site focus, build/deploy instructions, CLA reminder).  
- `Makefile` — canonical commands: environment setup (`deps`, `install`, `upgrade`), MkDocs lifecycle (`watch`, `build`, `deploy`), Git helpers (`pull`, `push`, `merge`), and image normalization (`img-resize`).  
- `requirements.txt` — Python dependencies pinned for MkDocs Material and extensions.  
- `.env` (local) — optional for proxy or environment overrides; keep it untracked.  
- `mkdocs.yml` — main configuration: German navigation, metadata, theme options, redirects plugin, Markdown extensions.  
- `mkdocs.deploy.yml` — inherits the base config and appends `search` and `privacy` plugins plus asset mirror rules for production.  
- `overrides/` — Material template overrides (`main.html` for meta/analytics/banner; `partials/copyright.html` for footer text); icon SVGs live under `overrides/.icons/`.
- Generated output lives in `site/` (ignored). The Python virtualenv is in `venv/` (ignored).

Content Map (docs/)
- Root landing: `docs/index.md` introduces PhotoPrism and links into the German User Guide.  
- Shared assets: `docs/img/` (global images), `docs/icons/` (favicons, logos + `LICENSE`), and `docs/css/custom.css` for style overrides.  
- User Guide (`docs/user-guide/`):
  - Orientation: `index.md`, `first-steps.md`, `navigate.md`, `faq.md`, and PWA guide `pwa.md`.  
  - Library management: `library/` covers indexing/import, metadata, duplicates, file browser, uploads, and WebDAV.  
  - Organize & browse: `organize/` covers albums, people, labels, archive, review, stacks, search/views, folders, moments, places, panoramas, scans, calendar, rotate/edit, download, video.  
  - Settings: `settings/` covers general, library/content, advanced, services/sync, account, and places.  
  - Sharing & sync: `share/` (link sharing, uploads), `sync/` (WebDAV, phones, other services).  
  - Backups: `backups/` (create, restore, export, folder overview).  
  - Users: `users/` (admin UI, CLI, roles, sharing with guests, multiple libraries, 2FA).  
  - Use cases: `use-cases/` (Google, Apple, Dropbox, Flickr migrations).  
  - Mobile/PWA: `pwa.md` plus phone sync guides under `sync/`.

Assets & Overrides
- Screenshots for the user guide live primarily in `docs/user-guide/img/`; run `make img-resize` after adding new JPGs.  
- Additional icons referenced by templates live in `overrides/.icons/` and `docs/icons/`; update references in `overrides/main.html` when adding new artwork.  
- Keep alt text aligned with filenames to aid accessibility across German and English sites.

Drafting & Maintenance Tips
- Register every new or renamed page in `mkdocs.yml` and add redirects to both `mkdocs.yml` and `mkdocs.deploy.yml` when URLs change.  
- Maintain filename parity with the English repository where possible to simplify diff-based translation updates.  
- Favor MkDocs Material components over custom HTML; keep headings and terminology consistent with the English source while using natural German phrasing.  
- Recreate the virtualenv with `make upgrade` if MkDocs plugins or theme versions are bumped in `requirements.txt`.
