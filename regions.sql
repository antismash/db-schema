CREATE TABLE antismash.regions (
    region_id	serial NOT NULL,
    accession text NOT NULL REFERENCES antismash.dna_sequences (accession) ON DELETE CASCADE,
    region_number	int4,
    location	text,
    start_pos	int4,
    end_pos	int4,
    contig_edge	bool,
    CONSTRAINT regions_pkey PRIMARY KEY (region_id)
);

COMMENT ON TABLE antismash.regions IS
  'A region of interest as predicted by antiSMASH.';
