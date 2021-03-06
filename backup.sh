#!/usr/bin/env bash

#####################################
# by kun@lodestream.com
# Copyright LodeStream, LLC
# Usage
# ./docker-backup/backup.sh

readonly PROJ=`pwd`
readonly SCRIPTS_DIR=$PROJ/docker-backup
readonly DEST=$PROJ/docker-backup/backups
readonly NOW=`date +"%Y-%m-%d-%H-%M-%S"`
readonly KEEP=${KEEP:=5}

mkdir -p $DEST

function backup {
  $SCRIPTS_DIR/backup_volume.sh $1 "$DEST/$NOW/"
}


function confirm_or_quit {
  read -p "Are you sure? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
      exit 1
  fi
}

function delete_old_backups {
  cd $DEST
  echo "Will keep only $KEEP backups"
  old_backups=`ls -At | tail -n +$KEEP | wc -l`;
  if (( old_backups == 0 )); then
    cd - && return
  fi

  ls -At | tail -n +$KEEP
  echo 'is going to be moved to /tmp,' && confirm_or_quit
  ls -At | tail -n +$KEEP | xargs -i mv {} /tmp
  cd - && return
}
delete_old_backups

# Create archive folder
echo rm -rf "$DEST/$NOW", waiting for 3s
sleep 3
rm -rf "$DEST/$NOW"

echo mkdir -p "$DEST/$NOW"
mkdir -p "$DEST/$NOW"

# Backup
readonly volumes=`docker-compose --compatibility ps -q | xargs docker container inspect  \
                 -f '{{ range .Mounts }}{{ .Name }} {{ end }}' \
                 | xargs -n 1 echo`
readonly volumes_arr=($volumes)
for i in "${volumes_arr[@]}"
do
   backup "$i"
done
