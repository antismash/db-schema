CREATE TABLE antismash.tta_codons (
    tta_codon_id	serial NOT NULL,
    locus_id	int4,
    CONSTRAINT tta_codon_pkey PRIMARY KEY (tta_codon_id),
    CONSTRAINT tta_codon_locus_id_fkey FOREIGN KEY (locus_id) REFERENCES antismash.loci (locus_id) ON DELETE CASCADE
);
COMMENT ON TABLE antismash.tta_codons IS
  'A TTA codon record.';

CREATE INDEX tta_codon_locus_id_idx ON antismash.tta_codons (locus_id);
