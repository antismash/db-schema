CREATE TABLE antismash.smcogs (
    smcog_id	serial NOT NULL,
    description	text,
    functional_class	int4,
    CONSTRAINT smcogs_pkey PRIMARY KEY (smcog_id),
    CONSTRAINT smcogs_functional_class_fkey FOREIGN KEY (functional_class) REFERENCES antismash.functional_classes (functional_class_id)
);
COMMENT ON TABLE antismash.smcogs IS
  'Secondary Metabolite specific Clusters of Orthologous Groups (smCoGs)';
