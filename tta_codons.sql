CREATE TABLE antismash.tta_codons (
    tta_codon_id	serial NOT NULL,
    location text NOT NULL,
    CONSTRAINT tta_codon_pkey PRIMARY KEY (tta_codon_id)
);
COMMENT ON TABLE antismash.tta_codons IS
  'A TTA codon record.';
