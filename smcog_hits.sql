CREATE TABLE antismash.smcog_hits (
    smcog_id	int4,
    gene_id	int4,
    score	float8,
    evalue	float8,
    image_path	text,
    CONSTRAINT smcog_hits_pkey PRIMARY KEY (smcog_id, gene_id),
    CONSTRAINT smcog_hits_gene_id_fkey FOREIGN KEY (gene_id) REFERENCES antismash.genes (gene_id) ON DELETE CASCADE,
    CONSTRAINT smcog_hits_smcog_id_fkey FOREIGN KEY (smcog_id) REFERENCES antismash.smcogs (smcog_id)
);
COMMENT ON TABLE antismash.smcog_hits IS
  'Metadata about an smCoG hit';
