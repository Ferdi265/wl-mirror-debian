# wl-mirror-debian

This repo contains the debian source package for
[wl-mirror](https://github.com/Ferdi265/wl-mirror).

Debian Mentors page: [wl-mirror](https://mentors.debian.net/package/wl-mirror/)

First supported Debian version is bookworm, since scdoc on bullseye has a bug
that breaks the wl-mirror man page.

## Building on Debian

- install `build-essential`, `wget`, `devscripts`, and `lintian`
- install `debhelper-compat`, `dh-cmake`, `cmake`, `scdoc`, `libwayland-dev`, and `libgles-dev`
- run `./build.sh`
- run `./lint.sh` for lintian

Environment variables such as `DEBFULLNAME` and `DEBEMAIL` are expected to be
already set by the user. Set `VERSION` to override the `wl-mirror` release to
be downloaded before building.

After building, `./build/wl-mirror-$VERSION/` will contain the debian source
package tree. `./build/` will contain the built package (including `.dsc`,
`.changes`, `.build`, `.deb`, etc). The package is built unsigned and is
expected to be signed by the user using `debsign`.

## Building on non-Debian

- run `./docker.sh` or `./docker.sh --base debian:RELEASE` (e.g. `debian:bookworm`)
- run `./docker.sh ./lint.sh` for lintian
- run `./docker.sh bash` to get a shell in the container

Environment variables are taken from `.env`. The current directory is mounted
into the container.

## Tag Structure

This repo contains tags of the format `v{UPSTREAM_VERSION}` for the first
commit that updates the Debian package to that specific version. Once a
specific version of `wl-mirror` is uploaded to the Debian archives I will
additionally tag the corresponding commit with `debian/{DEBIAN_VERSION}`.

Extracting a `.debian.tar.xz` archive at the corresponding `debian/` tagged
commit should result in no diffs.
