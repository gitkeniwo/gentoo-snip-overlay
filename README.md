# snip Gentoo overlay

Standalone Portage overlay for [`snip`](https://github.com/gitkeniwo/snip).

## Install

```bash
eselect repository add snip git https://github.com/gitkeniwo/gentoo-overlay.git
emaint sync -r snip
emerge --ask app-misc/sniplab-bin
```

`app-misc/sniplab-bin` installs the static musl release binary for `amd64` and
`arm64`. New versions are published automatically from the snip release workflow.
