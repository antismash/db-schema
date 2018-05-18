CREATE TABLE antismash.cdses (
    cds_id	serial NOT NULL,
    functional_class_id	int4,
    evidence_id	int4,
    locus_tag	text,
    name	text,
    product	text,
    protein_id	text,
    translation	text,
    locus_id	int4,
    operon_id	int4,
    CONSTRAINT cdses_pkey PRIMARY KEY (cds_id),
    CONSTRAINT cdses_functional_class_id_fkey FOREIGN KEY (functional_class_id) REFERENCES antismash.functional_classes (functional_class_id),
    CONSTRAINT cdses_evidence_id_fkey FOREIGN KEY (evidence_id) REFERENCES antismash.evidences (evidence_id),
    CONSTRAINT cdses_locus_id_fkey FOREIGN KEY (locus_id) REFERENCES antismash.loci (locus_id) ON DELETE CASCADE,
    CONSTRAINT cdses_operon_id_fkey FOREIGN KEY (operon_id) REFERENCES antismash.operons (operon_id)
);
COMMENT ON TABLE antismash.cdses IS
  'A CDS record.';

CREATE INDEX cdses_locus_id_idx ON antismash.cdses (locus_id);
CREATE INDEX cdses_locus_tag_idx ON antismash.cdses (locus_tag);
