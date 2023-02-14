# wl-mirror-debian

This repo contains the debian source package for
[wl-mirror](https://github.com/Ferdi265/wl-mirror).

Debian Mentors page: [wl-mirror](https://mentors.debian.net/package/wl-mirror/)

This is still very WIP and will probably take a while to be done. Currently
only builds without lintian warnings on bookworm since scdoc on bullseye still
has a bug that breaks the wl-mirror man page.

## Building on Debian

- install `build-essential`, `wget`, `devscripts`, and `lintian`
- install `debhelper-compat`, `dh-cmake`, `cmake`, `scdoc`, `libwayland-dev`, and `libgles-dev`
- run `./build.sh`

Environment variables such as `DEBFULLNAME` and `DEBEMAIL` are expected to be
already set by the user. Set `VERSION` to override the `wl-mirror` release to
be downloaded before building.

After building, `./build/wl-mirror-$VERSION/` will contain the debian source
package tree. `./build/` will contain the built package (including `.dsc`,
`.changes`, `.build`, `.deb`, etc). The package is built unsigned and is
expected to be signed by the user using `debsign`.

## Building on non-Debian

- run `./docker.sh` or `./docker.sh --base debian:RELEASE` (e.g. `debian:bookworm`)

Environment variables are taken from `.env`.
