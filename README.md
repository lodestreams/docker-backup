LodeStream Docker Volumes Backup Tool
====

Mainly used to work with docker-compose.

## How to Use

In project directory

```bash
git submodule add <url> path/to/module/docker-backup
cd path/to/module
./docker-backup/backup.sh
```

### Working with Git sub-modules

#### Clone a repo that contains sub-modules

```bash
git clone --recurse-submodules -j8
```

#### Add a sub-module to existing repo

```bash
git submodule add repo.git path/
```

#### Updating sub-modules

```bash
git submodule update --init --recursive
```

## Upload backup files

With s3

```bash
pip install awscli
awscli configure
awscli s3 cp file.tar.gz s3://do-not-delete-ls-backup/package/date
```

## Copyright

```
by kun@lodestream.com
Copyright LodeStream, LLC
```
