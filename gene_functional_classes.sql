CREATE TABLE antismash.gene_functional_classes (
    functional_class_id	serial NOT NULL,
    name	text,
    parent	int4,
    CONSTRAINT gene_functional_classes_pkey PRIMARY KEY (functional_class_id),
    CONSTRAINT gene_functional_classes_parent_fkey FOREIGN KEY (parent) REFERENCES antismash.gene_functional_classes (functional_class_id)
);
COMMENT ON TABLE antismash.gene_functional_classes IS
  'An index of possible functional classes for genes';
