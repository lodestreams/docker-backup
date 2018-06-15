LodeStream Docker Containers Backup Tool
====

## How to Use

```bash
# In project directory
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
