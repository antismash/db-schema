#!/bin/bash

set -o errexit
set -o nounset

PSQL_HOST=localhost
PSQL_PORT=15432
PSQL_USER=postgres
PSQL_DB=antismash

PSQL="psql -h $PSQL_HOST -p $PSQL_PORT -U $PSQL_USER $PSQL_DB"

for t in sampling_sites evidences samples isolates genomes dna_sequences loci operons gene_functional_classes genes; do
    echo "Processing $t"
    if [ -n "$ASDB_REINIT" ]; then
        echo "Dropping old table content"
        echo "DROP TABLE IF EXISTS ${PSQL_DB}.${t} CASCADE;" | $PSQL
    else
        echo "Just initialising new content"
    fi
    $PSQL < "${t}.sql"
done
