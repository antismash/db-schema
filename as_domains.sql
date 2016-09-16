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
    locus_id	int4,
    gene_id	int4,
    CONSTRAINT as_domains_pkey PRIMARY KEY (as_domain_id),
    CONSTRAINT as_domains_locus_id_fkey FOREIGN KEY (locus_id) REFERENCES antismash.loci (locus_id) ON DELETE CASCADE,
    CONSTRAINT as_domains_gene_id_fkey FOREIGN KEY (gene_id) REFERENCES antismash.genes (gene_id) ON DELETE CASCADE
);

COMMENT ON TABLE antismash.as_domains IS
  'A functional domain on a gene as predicted by antiSMASH';

CREATE INDEX as_domains_gene_id_idx ON antismash.as_domains (gene_id);
CREATE INDEX as_domains_locus_id_idx ON antismash.as_domains (locus_id);
