CREATE TABLE IF NOT EXISTS antismash.cdss (
    cds_id	serial NOT NULL,
    functional_class_id	int4,
    locus_tag	text,
    name	text,
    product	text,
    protein_id	text,
    translation	text,
    location text NOT NULL,
    region_id   int4 REFERENCES antismash.regions ON DELETE CASCADE,
    CONSTRAINT cdss_pkey PRIMARY KEY (cds_id),
    CONSTRAINT cdss_functional_class_id_fkey FOREIGN KEY (functional_class_id) REFERENCES antismash.functional_classes (functional_class_id)
);
COMMENT ON TABLE antismash.cdss IS
  'A CDS record.';

CREATE INDEX IF NOT EXISTS cdss_locus_tag_idx ON antismash.cdss (locus_tag);


CREATE TABLE IF NOT EXISTS antismash.gene_functions (
    gene_function_id serial PRIMARY KEY,
    cds_id int4 NOT NULL REFERENCES antismash.cdss ON DELETE CASCADE,
    functional_class_id int4 NOT NULL REFERENCES antismash.functional_classes ON DELETE CASCADE
);

COMMENT ON TABLE antismash.gene_functions IS
  'A table to link CDSs to functional classes.';

CREATE INDEX IF NOT EXISTS gene_functions_cds_id_idx ON antismash.gene_functions (cds_id);
CREATE INDEX IF NOT EXISTS gene_functions_functional_class_id_idx ON antismash.gene_functions (functional_class_id);
