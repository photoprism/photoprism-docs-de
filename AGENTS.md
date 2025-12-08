# PhotoPrism® Docs-DE Repository Guidelines

**Last Updated:** December 8, 2025

## Purpose

- Give agents and contributors a single, current reference for the German User Guide.  
- Clarify where canonical English content lives and how to preview, translate, and ship changes to https://docs-de.photoprism.app/.

## Sources of Truth

- `README.md` — contributor onboarding, MkDocs overview, and deployment notes specific to the German site.  
- `mkdocs.yml` — the entire navigation tree for the German User Guide; every new or moved page must be registered here before it appears.  
- `mkdocs.deploy.yml` — production settings (adds `search` and `privacy` plugins, mirrors assets) used for builds and deployments.  
- Canonical English docs: `https://github.com/photoprism/photoprism-docs` (AGENTS.md, CODEMAP.md, and the `docs/` tree) supply source text and structure for translations.  
- Main app references: `https://github.com/photoprism/photoprism/blob/develop/AGENTS.md` and `https://github.com/photoprism/photoprism/blob/develop/CODEMAP.md` remain authoritative for product behavior, CLI semantics, and backend/frontend boundaries.  
- Published sites: https://docs.photoprism.app/ (English) and https://docs-de.photoprism.app/ (German) are the live contracts; verify rendered behavior there before asserting version-specific details.

## Documentation Scope

- This repository hosts **only the German User Guide**. The content lives in `docs/user-guide/` plus the landing page `docs/index.md`; there is no Developer Guide or Getting Started tree here.  
- Navigation labels are defined in German within `mkdocs.yml`. Keep filenames lowercase with hyphens; mirror English paths where possible so redirects stay predictable.  
- Shared assets: `docs/img/` (global), `docs/user-guide/img/` (screenshots referenced by multiple pages), and section-local `img/` folders. Icons and favicons reside in `docs/icons/` with licensing in `docs/icons/LICENSE`.  
- Styling overrides belong in `docs/css/custom.css`; theme overrides live in `overrides/` (`main.html` for meta/analytics/banners, `partials/copyright.html` for footer text).  
- No drafts directory exists; introduce work-in-progress material behind clear TODO notices or stage it in a branch until ready to publish.

## Build & Preview Workflow

- Dependencies: on Debian/Ubuntu run `make deps`; otherwise `make install` to create `venv/` and install MkDocs plus requirements from `requirements.txt`. Material for MkDocs (including former Insiders features) now ships from PyPI, so no tokens or private repos are needed.  
- Preview locally with `make watch` (alias for `mkdocs serve --livereload`) and browse http://localhost:8000/. The command watches `docs/`, `overrides/`, and `mkdocs.yml`.  
- Production render: `make build` uses `mkdocs.deploy.yml`; `make deploy` runs `mkdocs gh-deploy --force` for emergency pushes. Normal releases flow by merging `develop` into `deploy` (see below).  
- Image hygiene: run `make img-resize` after adding screenshots under `docs/user-guide/img/` or nested `img/` folders to enforce the `1000x860` max size.

## Repository Layout & Ownership

- Branch flow: work in `develop`; merge `develop` into `deploy` (or run `make merge`) to trigger the GitHub Pages pipeline that publishes https://docs-de.photoprism.app/. Resolve conflicts locally so deploy history stays clean.  
- `mkdocs.yml` controls navigation, theme options, edit links, plugins (redirects), and Markdown extensions. Update redirects in both `mkdocs.yml` and `mkdocs.deploy.yml` when URLs change so previews and production behave identically.  
- `overrides/` contains the only template customizations; edit cautiously and verify both light/dark themes.  
- Generated output in `site/` and the virtualenv in `venv/` are workspace artifacts; do not commit them.

## Content Standards

- Match the tone and terminology of the canonical English pages while writing natural German; prefer consistent translations of feature names (Albums, Personen, Labels, Bibliothek, etc.).  
- Keep headings and navigation labels consistent with `mkdocs.yml`; avoid introducing new casing styles.  
- Prefer Markdown constructs supported by MkDocs Material (admonitions, tabs, tooltips) over raw HTML.  
- When documenting product behavior, confirm against the main application repository or the English docs to avoid drift.  
- Store images next to the pages that reference them and provide descriptive alt text.  
- Never commit credentials or private tokens; `.env` stays untracked.
