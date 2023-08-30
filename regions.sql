CREATE TABLE antismash.regions (
    region_id	serial NOT NULL,
    accession text NOT NULL REFERENCES antismash.dna_sequences (accession) ON DELETE CASCADE,
    region_number	int4 NOT NULL,
    location	text NOT NULL,
    start_pos	int4 NOT NULL,
    end_pos	int4 NOT NULL,
    contig_edge	bool NOT NULL,
    best_mibig_hit_acc	text,
    best_mibig_hit_description	text,
    best_mibig_hit_similarity	int4,
    CONSTRAINT regions_pkey PRIMARY KEY (region_id)
);

COMMENT ON TABLE antismash.regions IS
  'A region of interest as predicted by antiSMASH.';
