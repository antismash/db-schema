#!/bin/bash

set -o errexit
set -o nounset

PSQL_HOST=localhost
PSQL_PORT=15432
PSQL_USER=postgres
PSQL_DB=antismash
PSQL_SCHEMA=antismash

PSQL="psql -h $PSQL_HOST -p $PSQL_PORT -U $PSQL_USER"
PSQL_AS="$PSQL $PSQL_DB"

$PSQL -tc "SELECT 1 FROM pg_database WHERE datname = '${PSQL_DB}';" | grep -q 1 || $PSQL -c "CREATE DATABASE $PSQL_DB;"
$PSQL_AS -c "CREATE SCHEMA IF NOT EXISTS ${PSQL_SCHEMA};"

for t in sampling_sites evidences samples isolates genomes dna_sequences loci operons gene_functional_classes genes; do
    echo "Processing $t"
    if [ -n "$ASDB_REINIT" ]; then
        echo "Dropping old table content"
        $PSQL_AS -c "DROP TABLE IF EXISTS ${PSQL_SCHEMA}.${t} CASCADE;"
    else
        echo "Just initialising new content"
    fi
    $PSQL_AS < "${t}.sql"
done
