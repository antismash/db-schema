CREATE TABLE antismash.genes (
    gene_id	serial NOT NULL,
    locus_tag	text,
    locus_id	int4,
    operon_id	int4,
    CONSTRAINT genes_pkey PRIMARY KEY (gene_id),
    CONSTRAINT genes_locus_id_fkey FOREIGN KEY (locus_id) REFERENCES antismash.loci (locus_id) ON DELETE CASCADE,
    CONSTRAINT genes_operon_id_fkey FOREIGN KEY (operon_id) REFERENCES antismash.operons (operon_id)
);
COMMENT ON TABLE antismash.genes IS
  'A gene record.';

CREATE INDEX genes_locus_id_idx ON antismash.genes (locus_id);
CREATE INDEX genes_locus_tag_idx ON antismash.genes (locus_tag);
