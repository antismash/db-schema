CREATE TABLE antismash.compounds (
    compound_id	serial NOT NULL,
    smile_structure	text,
    peptide_sequence	text,
    molecular_weight	float4,
    monoisotopic_mass	float4,
    CONSTRAINT compounds_pkey PRIMARY KEY (compound_id)
);

COMMENT ON TABLE antismash.compounds IS
  'A (predicted) checical compound.';
