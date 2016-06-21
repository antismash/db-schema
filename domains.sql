CREATE TABLE antismash.domains (
    domain_id	serial NOT NULL,
    name	text,
    domain_type	text,
    locus	int4,
    gene	int4,
    CONSTRAINT domains_pkey PRIMARY KEY (domain_id),
    CONSTRAINT domains_locus_fkey FOREIGN KEY (locus) REFERENCES antismash.loci (locus_id),
    CONSTRAINT domains_gene_fkey FOREIGN KEY (gene) REFERENCES antismash.genes (gene_id)
);

COMMENT ON TABLE antismash.domains IS
  'A functional domain on a gene.';
