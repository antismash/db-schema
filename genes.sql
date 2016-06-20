CREATE TABLE antismash.genes (
    id	serial NOT NULL,
    functional_class	int4,
    specificity	int4,
    evidence	int4,
    locus_tag	text,
    acc	text,
    gene_id	text,
    key_val_column	int4,
    label	text,
    locus	int4,
    operon	int4,
    CONSTRAINT genes_pkey PRIMARY KEY (id),
    CONSTRAINT genes_functional_class_fkey FOREIGN KEY (functional_class) REFERENCES antismash.gene_functional_classes (id),
    CONSTRAINT genes_evidence_fkey FOREIGN KEY (evidence) REFERENCES antismash.evidences (id),
    CONSTRAINT genes_locus_fkey FOREIGN KEY (locus) REFERENCES antismash.loci (id),
    CONSTRAINT genes_operon_fkey FOREIGN KEY (operon) REFERENCES antismash.operons (id)
);
COMMENT ON TABLE antismash.genes IS
  'A gene record.';
