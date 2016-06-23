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

# tables not depending on other tables
TABLES="sampling_sites evidences bgc_types compounds monomers"
# tables depending on other tables. Please keep the order intact
TABLES="$TABLES bgc_rules samples isolates genomes dna_sequences loci operons "
TABLES="$TABLES gene_functional_classes genes biosynthetic_gene_clusters as_domains"
# tables that create many-to-many relations
TABLES="$TABLES rel_clusters_types rel_clusters_compounds rel_compounds_monomers"


for t in $TABLES; do
    echo "Processing $t"
    if [ -n "$ASDB_REINIT" ]; then
        echo "Dropping old table content"
        $PSQL_AS -c "DROP TABLE IF EXISTS ${PSQL_SCHEMA}.${t} CASCADE;"
    else
        echo "Just initialising new content"
    fi
    $PSQL_AS < "${t}.sql"
done
