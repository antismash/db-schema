CREATE TABLE antismash.ripps (
    protocluster_id int4 NOT NULL REFERENCES antismash.protoclusters ON DELETE CASCADE,
    peptide_sequence	text,
    molecular_weight	float4,
    monoisotopic_mass	float4,
    --- TODO: Create alternative compounds for this
    alternative_weights	text,
    bridges	int4,
    class	text,
    subclass text,
    score	float8,
    locus_tag	text NOT NULL,
    cds_id  int4 NOT NULL REFERENCES antismash.cdss ON DELETE CASCADE,
    CONSTRAINT ripps_pkey PRIMARY KEY (protocluster_id, locus_tag)
);

COMMENT ON TABLE antismash.ripps IS
  'A (predicted) ribosomally preduced peptide compound.';

CREATE INDEX ripps_peptides_sequence_idx ON antismash.ripps (peptide_sequence);
CREATE INDEX ripps_locus_tag_idx ON antismash.ripps (locus_tag);
