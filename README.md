# git-annex-remote-conp
## Requisites

- Git-annex version 7.20 or newer.
- Install `git-annex-remote-conp` somewhere in PATH and `chmod +x` the script.

### Setup

```bash
git annex initremote conp type=external externaltype=conp encryption=shared
```

### Content distribution

```bash
git annex copy --to conp
```

### Show remote log 

```bash
show git-annex:remote.log
```

