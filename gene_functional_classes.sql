CREATE TABLE antismash.gene_functional_classes (
    id	serial NOT NULL,
    name	text,
    parent	int4,
    CONSTRAINT gene_functional_classes_pkey PRIMARY KEY (id),
    CONSTRAINT gene_functional_classes_parent_fkey FOREIGN KEY (parent) REFERENCES antismash.gene_functional_classes (id)
);
COMMENT ON TABLE antismash.gene_functional_classes IS
  'An index of possible functional classes for genes';
