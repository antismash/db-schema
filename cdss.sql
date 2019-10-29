CREATE TABLE antismash.cdss (
    cds_id	serial NOT NULL,
    functional_class_id	int4,
    locus_tag	text,
    name	text,
    product	text,
    protein_id	text,
    translation	text,
    location text NOT NULL,
    CONSTRAINT cdss_pkey PRIMARY KEY (cds_id),
    CONSTRAINT cdss_functional_class_id_fkey FOREIGN KEY (functional_class_id) REFERENCES antismash.functional_classes (functional_class_id)
);
COMMENT ON TABLE antismash.cdss IS
  'A CDS record.';

CREATE INDEX cdss_locus_tag_idx ON antismash.cdss (locus_tag);
