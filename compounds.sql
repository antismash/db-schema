CREATE TABLE antismash.compounds (
    compound_id	serial NOT NULL,
    smile_structure	text,
    peptide_sequence	text,
    molecular_weight	float4,
    monoisotopic_mass	float4,
    --- TODO: Create alternative compounds for this
    alternative_weights	text,
    bridges	int4,
    class	text,
    score	float8,
    CONSTRAINT compounds_pkey PRIMARY KEY (compound_id)
);

COMMENT ON TABLE antismash.compounds IS
  'A (predicted) checical compound.';

CREATE INDEX compounds_peptides_sequence_idx ON antismash.compounds (peptide_sequence);
