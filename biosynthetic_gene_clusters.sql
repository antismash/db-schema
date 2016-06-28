CREATE TABLE antismash.biosynthetic_gene_clusters (
    bgc_id	serial NOT NULL,
    cluster_number	int4,
    locus	int4,
    evidence	int4,
    CONSTRAINT biosynthetic_gene_clusters_pkey PRIMARY KEY (bgc_id),
    CONSTRAINT biosynthetic_gene_clusters_locus_fkey FOREIGN KEY (locus) REFERENCES antismash.loci (locus_id),
    CONSTRAINT biosynthetic_gene_clusters_evidence_fkey FOREIGN KEY (evidence) REFERENCES antismash.evidences (evidence_id)
);

COMMENT ON TABLE antismash.biosynthetic_gene_clusters IS
  'A biosynthetic gene cluster as predicted by antiSMASH.';
