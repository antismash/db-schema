CREATE TABLE antismash.as_domains (
    as_domain_id	serial NOT NULL,
    name	text,
    domain_type	text,
    locus	int4,
    gene	int4,
    CONSTRAINT as_domains_pkey PRIMARY KEY (as_domain_id),
    CONSTRAINT as_domains_locus_fkey FOREIGN KEY (locus) REFERENCES antismash.loci (locus_id),
    CONSTRAINT as_domains_gene_fkey FOREIGN KEY (gene) REFERENCES antismash.genes (gene_id)
);

COMMENT ON TABLE antismash.as_domains IS
  'A functional domain on a gene as predicted by antiSMASH';
