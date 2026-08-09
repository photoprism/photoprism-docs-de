PhotoPrism: User Guide (German)
===============================

[![GitHub contributors](https://img.shields.io/github/contributors/photoprism/photoprism-docs-de.svg)](https://github.com/photoprism/photoprism-docs-de/graphs/contributors/)
[![Documentation](https://img.shields.io/badge/read-the%20docs-4aa087.svg)][docs]
[![Community Chat](https://img.shields.io/badge/chat-on%20gitter-4aa087.svg)][chat]
[![GitHub Discussions](https://img.shields.io/badge/ask-%20on%20github-4d6a91.svg)][ask]
[![Bluesky Social](https://dl.photoprism.app/img/badges/badge-bluesky.svg)](https://bsky.app/profile/photoprism.app)
[![Mastodon](https://dl.photoprism.app/img/badges/badge-floss-social.svg)](https://floss.social/@photoprism)

**The German version of the [User Guide](https://docs.photoprism.app/) is published at [docs-de.photoprism.app](https://docs-de.photoprism.app/). We appreciate your help with improving the translation and keeping it up to date!**

These source files are written in [human-friendly Markdown](https://squidfunk.github.io/mkdocs-material/reference/). They are meant to be parsed with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) to generate the final HTML pages.

Although arguably less convenient to work with than a Wiki, this enables us to easily merge pull requests and constantly improve our documentation in a transparent way.
Direct access to the source files in a revision control system is a big plus to ensure the quality of our documentation.

## Editing Content ##

At the top of each generated page is an *edit this page* link to the corresponding page on GitHub, where you can make changes (and submit pull requests with a few clicks) without needing to know Git or run anything on your system.

To make more extensive changes, fork this repository, modify the corresponding `.md` source files (or create new ones), commit the changes, push them back to your fork, and then submit a pull request to our `develop` branch.

### Project Layout ###

    mkdocs.yml    # The configuration file.
    _typos.toml   # Spell-checker configuration (see "Checking Your Changes").
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.
    scripts/      # Link checker and installers for the check tooling.

### Build Setup ###

MkDocs Material (including features that used to require the Insiders build) installs directly from PyPI, so `make deps` / `make install` work out of the box without adding anything to `.env`.

This site is built with [ProperDocs](https://properdocs.org/), a maintained drop-in fork of MkDocs 1.x (MkDocs core is EOL). It reads the existing `mkdocs.yml` unchanged and is installed via `requirements.txt`; the `make` targets call it under the hood, so the commands below are unchanged.

#### Installing MkDocs ####

When using a Debian, Ubuntu, or Mint Linux, run this command the first time you work with this repository on your computer so that the dependencies are installed:

```
make deps
```

Otherwise, install Python 3 and Pip manually and run the following command:

```
make install
```

#### Fixing Permissions ####

In case files in the project directory have bad permissions and mkdocs cannot read or write them:

```
make fix
```

### Using MkDocs ###

Once the dependencies are installed (see [Build Setup](#build-setup) above), preview the documentation locally with live reload:

```sh
make watch
```

This runs [MkDocs Material](https://github.com/squidfunk/mkdocs-material) from the local `venv/`. Now open [http://localhost:8000/](http://localhost:8000/) in a browser to view the rendered documentation.

**The content will be updated automatically when changes are detected.**

### Building in a Container ###

To produce a one-off build without installing a Python toolchain on your host, run the upstream MkDocs Material image and add this repo's extra plugins at run time (the image's entrypoint is `mkdocs`, so override it to run `pip` first):

```sh
docker run --rm --entrypoint sh -v "$PWD":/docs -w /docs squidfunk/mkdocs-material:latest \
  -c "pip install -r requirements.txt && properdocs build -f mkdocs.deploy.yml"
```

The rendered site is written to `site/` (the container writes it as `root`). Both `site/` and `venv/` are git-ignored build artifacts.

Note that a `venv/` does not survive the checkout being moved: the scripts in `venv/bin/` hard-code an absolute interpreter path, so a relocated repository makes `make build` fail with a bare `Error 127`. Run `make upgrade` to rebuild it.

### Checking Your Changes ###

After `make build`, three optional checks are available. None of them is run by CI, and only the first is a reliable gate:

```
make check-links           # internal links and assets in site/; exits non-zero on a miss
make spellcheck            # typos over docs/, configured in _typos.toml
make muffet                # crawls a locally served copy; also validates in-page anchors
```

`make spellcheck` uses [typos](https://github.com/crate-ci/typos), which reports only words on its curated typo list instead of dictionary-checking — that is what makes it workable on German text. German words that collide with an English typo entry are allowlisted in `_typos.toml`; add to that list as new vocabulary appears.

`make check-links-external` and `make muffet` also probe external URLs and are advisory only: they judge by status code, so bot-challenged hosts and JavaScript-driven page fragments show up as false positives.

### Deployment ###

When you merge the `develop` branch to `deploy`, the live documentation is automatically created, uploaded and will be visible shortly.

Linux/Unix users can run `make merge` in a terminal. Otherwise, please use the tools provided by your development environment or editor.

### Contributor License Agreement (CLA) ###

After you submit your first pull request, you will be asked to accept our Contributor License Agreement (CLA). Visit [photoprism.app/cla](https://www.photoprism.app/cla/) to learn more.

## Other Documentation ##

- [photoprism/photoprism-docs](https://github.com/photoprism/photoprism-docs) - Official Documentation (English)

## Related Repositories ##

- [photoprism/photoprism](https://github.com/photoprism/photoprism) - AI-powered, self-hosted photo & video platform 🌈💎✨
- [photoprism/photoprism-contrib](https://github.com/photoprism/photoprism-contrib) - Contributed Resources, Scripts, Tutorials and Examples

----

*PhotoPrism® is a [registered trademark](https://www.photoprism.app/trademark/). By using the software and services we provide, you agree to our [Terms of Service](https://www.photoprism.app/terms/), [Privacy Policy](https://www.photoprism.app/privacy/), and [Code of Conduct](https://www.photoprism.app/code-of-conduct/). Docs are [available](https://link.photoprism.app/github-docs) under the [CC BY-NC-SA 4.0 License](https://creativecommons.org/licenses/by-nc-sa/4.0/); [additional terms](https://github.com/photoprism/photoprism/blob/develop/assets/README.md) may apply.*

[docs]: https://docs-de.photoprism.app/
[chat]: https://link.photoprism.app/chat
[ask]: https://link.photoprism.app/discussions
