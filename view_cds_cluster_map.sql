CREATE MATERIALIZED VIEW antismash.cds_cluster_map AS
SELECT sequence_id, bgc_id, cds_id FROM (
    SELECT
        cds_id, start_pos, end_pos, seq.sequence_id
    FROM antismash.cdss g
    JOIN antismash.loci l USING (locus_id)
    JOIN antismash.dna_sequences seq USING (sequence_id)
    ORDER BY
    cds_id
) e1
LEFT JOIN LATERAL (
    SELECT
        bgc_id
    FROM antismash.biosynthetic_gene_clusters bgc
    JOIN antismash.loci l USING (locus_id)
    JOIN antismash.dna_sequences seq USING (sequence_id)
    WHERE
        seq.sequence_id = e1.sequence_id AND
        int4range(l.start_pos, l.end_pos) @> int4range(e1.start_pos, e1.end_pos)
) e2 ON true
WHERE
    bgc_id IS NOT NULL;
