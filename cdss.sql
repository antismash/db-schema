CREATE TABLE antismash.cdss (
    cds_id	serial NOT NULL,
    functional_class_id	int4,
    locus_tag	text,
    name	text,
    product	text,
    protein_id	text,
    translation	text,
    locus_id	int4,
    operon_id	int4,
    CONSTRAINT cdss_pkey PRIMARY KEY (cds_id),
    CONSTRAINT cdss_functional_class_id_fkey FOREIGN KEY (functional_class_id) REFERENCES antismash.functional_classes (functional_class_id),
    CONSTRAINT cdss_locus_id_fkey FOREIGN KEY (locus_id) REFERENCES antismash.loci (locus_id) ON DELETE CASCADE,
    CONSTRAINT cdss_operon_id_fkey FOREIGN KEY (operon_id) REFERENCES antismash.operons (operon_id)
);
COMMENT ON TABLE antismash.cdss IS
  'A CDS record.';

CREATE INDEX cdss_locus_id_idx ON antismash.cdss (locus_id);
CREATE INDEX cdss_locus_tag_idx ON antismash.cdss (locus_tag);
