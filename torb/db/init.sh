#!/bin/bash

ROOT_DIR=$(cd $(dirname $0)/..; pwd)
DB_DIR="$ROOT_DIR/db"
BENCH_DIR="$ROOT_DIR/bench"

DATASET_FILE="${DATASET_FILE:-"isucon8q-initial-dataset-multiline.sql"}"

export MYSQL_PWD=isucon

mysql -h 172.18.79.1 -uisucon -e "DROP DATABASE IF EXISTS torb; CREATE DATABASE torb;"
mysql -h 172.18.79.1 -uisucon torb < "$DB_DIR/schema.sql"

if [ ! -f "$DB_DIR/${DATASET_FILE}" ]; then
  echo "Run the following command beforehand." 1>&2
  echo "$ ( cd \"$BENCH_DIR\" && bin/gen-initial-dataset )" 1>&2
  exit 1
fi

#mysql -h 172.18.79.1 -uisucon torb -e 'ALTER TABLE reservations DROP KEY event_id_and_sheet_id_idx'
cat "$DB_DIR/${DATASET_FILE}" | mysql -h 172.18.79.1 -uisucon torb
#mysql -h 172.18.79.1 -uisucon torb -e 'ALTER TABLE reservations ADD KEY event_id_and_sheet_id_idx (event_id, sheet_id)'
