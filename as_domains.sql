CREATE TABLE antismash.as_domains (
    as_domain_id	serial NOT NULL,
    name	text,
    database	text,
    detection	text,
    score	float8,
    evalue	float8,
    translation	text,
    pks_signature	text,
    minowa	text,
    nrps_predictor	text,
    stachelhaus	text,
    consensus	text,
    kr_activity	bool,
    kr_stereochemistry	text,
    locus	int4,
    gene	int4,
    CONSTRAINT as_domains_pkey PRIMARY KEY (as_domain_id),
    CONSTRAINT as_domains_locus_fkey FOREIGN KEY (locus) REFERENCES antismash.loci (locus_id) ON DELETE CASCADE,
    CONSTRAINT as_domains_gene_fkey FOREIGN KEY (gene) REFERENCES antismash.genes (gene_id) ON DELETE CASCADE
);

COMMENT ON TABLE antismash.as_domains IS
  'A functional domain on a gene as predicted by antiSMASH';
