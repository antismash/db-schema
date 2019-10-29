CREATE TABLE antismash.genes (
    gene_id	serial NOT NULL,
    locus_tag	text,
    location text NOT NULL,
    CONSTRAINT genes_pkey PRIMARY KEY (gene_id)
);
COMMENT ON TABLE antismash.genes IS
  'A gene record.';

CREATE INDEX genes_locus_tag_idx ON antismash.genes (locus_tag);
