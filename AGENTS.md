# PhotoPrism® Docs-DE Repository Guidelines

**Last Updated:** March 10, 2026

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
- Styling overrides belong in `docs/css/custom.css`; theme overrides live in `overrides/` (`main.html` for meta/analytics/banners, `partials/copyright.html` for footer text). The site-wide `<meta name="keywords">` is in `main.html`'s `extrahead` block (German-localized list + `page.meta.keywords` override); keep the German keywords localized, not translated 1:1 (e.g. `dsgvo` not `gdpr`).  
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

## Style Notes

### Content Standards

- Match the tone and terminology of the canonical English pages while writing natural German; prefer consistent translations of feature names (Albums, Personen, Labels, Bibliothek, etc.).  
- Keep headings and navigation labels consistent with `mkdocs.yml`; avoid introducing new casing styles.  
- Prefer Markdown constructs supported by MkDocs Material (admonitions, tabs, tooltips) over raw HTML.  
- When documenting product behavior, confirm against the main application repository or the English docs to avoid drift.  
- Store images next to the pages that reference them and provide descriptive alt text.  
- Never commit credentials or private tokens; `.env` stays untracked.

### Commit Messages

Use concise, imperative subjects with a one-word prefix indicating the scope or topic:

- `Config: Add tests for "darktable-cli" path detection`

If the commit relates to specific issues or pull requests, reference their IDs in the message:

- `Docker: Use two stage build to reduce image size #123 #5632`

Commit messages must not exceed 80 characters in length.

### GitHub Issues

Issue titles MUST be concise, use the imperative mood, and start with a single capitalized prefix followed by a colon and a space, e.g. `Search: Add filter for RAW image formats`.

Issue descriptions MUST begin with a one-sentence **User Story** where the sentence itself is fully bold in the format: `**As a <role>, I want <goal>, so that <outcome>.**`
Follow the User Story with a clear summary of the expected behavior, rationale, technical considerations, and constraints.

Descriptions MUST conclude with a checklist of **Acceptance Criteria**:
- Use GitHub checklist formatting: `- [ ]`
- Criteria MUST be clear, testable, and unambiguous.
- Each item MUST use one of the following priority keywords:
  - `MUST`   — required for the issue to be considered complete
  - `SHOULD` — strongly recommended but not strictly required
  - `MAY`    — optional enhancement

Additional details MAY be included as needed, such as related issues, references, screenshots, or external resources.

> Agents MUST create, edit, close, reopen, relabel, or otherwise modify GitHub issues only when explicitly requested by the user.

## Security & Access

- Never commit credentials. MkDocs Material Insiders is now public on PyPI, so we no longer ask contributors to add `GH_TOKEN` values to `.env`; keep that file untracked if you use it for other local overrides.
- Treat `docs/license`, `docs/icons/LICENSE`, and `docs/img/LICENSE` as authoritative for third-party assets. Confirm redistribution rights before adding new binaries or artwork.
- All social sharing and analytics scripts live in `overrides/main.html`. Review those tags when changing analytics providers to ensure we only load scripts from approved domains (`a.photoprism.app` for outbound tracking).
- Follow the main repository’s security and contribution policies (see `SECURITY.md` and `CONTRIBUTING.md` in photoprism/photoprism) when referencing vulnerabilities or non-public features in these docs.
