# FLAKE TEMPLATES

This repo contains a set of standard Nix Flake templates.

Each sub directory is a templates in this repo. The name of the sub-dir is the name of the template.

### How to use:

Using SSH auth:

```
nix flake init -t git+ssh://git@github.com/Campbell-Kilgour/flake-templates.git#<template-name>
```

Using HTTP auth:
```
nix flake init -t github:Campbell-Kilgour/flake-templates#<template-name>
```
