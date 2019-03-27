# git-annex-remote-conp
## Installation

- Requires git-annex version 7.20 or newer.
- Requires `AnnexRemote` module. Install dependency with `pip install -r requirements.txt` 
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

