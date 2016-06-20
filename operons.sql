CREATE TABLE antismash.operons (
    id	serial NOT NULL,
    label	text,
    evidence	int4,
    locus	int4,
    CONSTRAINT operons_pkey PRIMARY KEY (id),
    CONSTRAINT operons_evidence_fkey FOREIGN KEY (evidence) REFERENCES antismash.evidences (id),
    CONSTRAINT operons_locus_fkey FOREIGN KEY (locus) REFERENCES antismash.loci (id)
);
COMMENT ON TABLE antismash.operons
  IS 'A transcriptional unit in a cluster';
