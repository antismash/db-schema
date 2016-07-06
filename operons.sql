CREATE TABLE antismash.operons (
    operon_id	serial NOT NULL,
    label	text,
    evidence	int4,
    locus	int4,
    CONSTRAINT operons_pkey PRIMARY KEY (operon_id),
    CONSTRAINT operons_evidence_fkey FOREIGN KEY (evidence) REFERENCES antismash.evidences (evidence_id),
    CONSTRAINT operons_locus_fkey FOREIGN KEY (locus) REFERENCES antismash.loci (locus_id) ON DELETE CASCADE
);
COMMENT ON TABLE antismash.operons
  IS 'A transcriptional unit in a cluster';
