# git-annex-remote-conp
## Installation

- Requires git-annex version 7.20 or newer.
- Requires `AnnexRemote` module. Install dependency with `pip install -r requirements.txt` 
- Install `git-annex-remote-conp` somewhere in PATH and `chmod +x` the script.

### Setup

```bash
git annex initremote conp type=external externaltype=conp encryption=none autoenable=true
```

### Content distribution

```bash
git annex copy --to conp
```

### Show remote log 

```bash
show git-annex:remote.log
```

---

### Demo

1) Start virtual environment

```bash
$ python3 -m venv venv
$ source venv/bin/activate
```

2) Install dependencies

```bash
$ pip install -r requirements.txt
```

3) Start demo conp-server, this

```bash
$ ./demo/serve_conp.sh
```

You will see `Serving HTTP on 0.0.0.0 port 8080 (http://0.0.0.0:8080/)` 

4) Run the sample preperation script `prep_conp_ds.sh` , needs to be in the PATH

```bash
$ PATH=$PWD:$PATH bash demo/prep_conp_ds.sh
```

This script will create two directories `demods` (demo dataset) and `clientds` (client dataset) with a `content		` sample dataset 

Sample output:

```bash
[INFO   ] Creating a new annex repo at /some_path/git-annex-remote-conp/demods
Total (3 ok out of 2):  30%|▎| 55.0/183 [00:00<00:00, 1.14kB                                                            create(ok): /some_path/git-annex-remote-conp/demods (dataset)
initremote conp ok
(recording state in git...)
add(ok): content (file)
save(ok): . (dataset)
action summary:
  add (ok: 1)
  save (ok: 1)
setpresentkey MD5E-s0--d41d8cd98f00b204e9800998ecf8427e ok
drop(ok): /some_path/git-annex-remote-conp/demods/content (file)
drop(ok): /some_path/git-annex-remote-conp/demods (directory)
action summary:
  drop (ok: 2)
[INFO   ] Cloning demods into '/some_path/git-annex-remote-conp/clientds'
install(ok): /some_path/git-annex-remote-conp/clientds (dataset)
action summary:
  get (ok: 2)
  install (ok: 1)
```

5) You will see the GET request on the server:

```bash
127.0.0.1 - - [29/Mar/2019 14:10:58] "GET /MD5E-s0--d41d8cd98f00b204e9800998ecf8427e HTTP/1.1" 200 -
```

The hash `MD5E-s0--d41d8cd98f00b204e9800998ecf8427e` corresponds to a dummy file