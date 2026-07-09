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
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

### Build Setup ###

MkDocs Material (including features that used to require the Insiders build) installs directly from PyPI, so `make deps` / `make install` work out of the box without adding anything to `.env`.

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
  -c "pip install -r requirements.txt && mkdocs build -f mkdocs.deploy.yml"
```

The rendered site is written to `site/` (the container writes it as `root`). Both `site/` and `venv/` are git-ignored build artifacts.

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
