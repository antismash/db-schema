CREATE TABLE antismash.regions (
    region_id	serial NOT NULL,
    record_accession text NOT NULL REFERENCES antismash.dna_sequences (accession) ON DELETE CASCADE,
    region_number	int4,
    location	text,
    contig_edge	bool,
    minimal	bool,
    CONSTRAINT regions_pkey PRIMARY KEY (region_id)
);

COMMENT ON TABLE antismash.regions IS
  'A region of interest as predicted by antiSMASH.';
