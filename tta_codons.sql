CREATE TABLE antismash.tta_codons (
    tta_codon_id	serial NOT NULL,
    seq_id  text    NOT NULL REFERENCES antismash.dna_sequences (accession) ON DELETE CASCADE,
    location text NOT NULL,
    CONSTRAINT tta_codon_pkey PRIMARY KEY (tta_codon_id)
);
COMMENT ON TABLE antismash.tta_codons IS
  'A TTA codon record.';
