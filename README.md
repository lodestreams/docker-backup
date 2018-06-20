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
# first time
git submodule update --init --recursive

# afterwards updates
git submodule update --recursive --remote

# or
git pull --recurse-submodules
```

## Upload backup files

With s3

```bash
pip install awscli
awscli configure
awscli s3 cp file.tar.gz s3://do-not-delete-ls-backup/package/date
```

## Copyright

License: MIT

```
by kun@lodestream.com
Copyright LodeStream, LLC
```
