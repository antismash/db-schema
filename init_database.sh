#!/bin/bash

set -o nounset

PSQL_HOST=localhost
PSQL_PORT=5432
PSQL_USER=postgres
PSQL_DB=antismash
PSQL_SCHEMA=antismash

PSQL="psql -h $PSQL_HOST -p $PSQL_PORT -U $PSQL_USER"
PSQL_AS="$PSQL $PSQL_DB"

$PSQL -tc "SELECT 1 FROM pg_database WHERE datname = '${PSQL_DB}';" | grep -q 1 || $PSQL -c "CREATE DATABASE $PSQL_DB;"

if [ -n `echo -n $ASDB_REINIT` ]; then
    echo "Clearing out the whole schema"
    $PSQL_AS -c "DROP SCHEMA IF EXISTS ${PSQL_SCHEMA} CASCADE;"
fi

$PSQL_AS -c "CREATE SCHEMA IF NOT EXISTS ${PSQL_SCHEMA};"

# tables not depending on other tables
TABLES="sampling_sites bgc_types compounds monomers taxa profiles "
TABLES="$TABLES as_domain_profiles pfams "
# tables depending on other tables. Please keep the order intact
TABLES="$TABLES bgc_rules samples isolates genomes dna_sequences loci "
TABLES="$TABLES functional_classes smcogs cdss genes biosynthetic_gene_clusters"
TABLES="$TABLES as_domains clusterblast_algorithms clusterblast_hits tta_codons"
TABLES="$TABLES pfam_domains filenames"
# tables that create many-to-many relations
TABLES="$TABLES rel_clusters_types rel_clusters_compounds rel_compounds_monomers"
TABLES="$TABLES rel_as_domains_monomers smcog_hits profile_hits "
# views that depend on all this stuff
TABLES="$TABLES view_cds_cluster_map view_sequence_gc_content view_sequence_lengths"
# precalculated data, load this last
TABLES="$TABLES preload_taxa"

for t in $TABLES; do
    if [ -f "${t}.sql" ]; then
        echo "Processing $t"
    else
        echo "no such file: ${t}.sql"
        exit 1
    fi
    $PSQL_AS 2>&1 < "${t}.sql" | tee tmp | grep ERROR
    if [ "$?" -eq "0" ]; then
        cat tmp
        rm tmp
        exit 1
    fi
    rm tmp
done
