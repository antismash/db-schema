CREATE TABLE antismash.candidates (
    candidate_id	serial NOT NULL,
    region_id	int4 NOT NULL REFERENCES antismash.regions ON DELETE CASCADE,
    location	text NOT NULL,
    smiles	text,
    polymer  text,
    CONSTRAINT candidates_pkey PRIMARY KEY (candidate_id)
);

COMMENT ON TABLE antismash.candidates IS
  'A candidate cluster as predicted by antiSMASH.';
