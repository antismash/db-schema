CREATE TABLE antismash.candidate_types (
	candidate_type_id	serial NOT NULL PRIMARY KEY,
	description	text	NOT NULL
);

COMMENT ON TABLE antismash.candidate_types IS
	'Candidate cluster types as used by antiSMASH.';

INSERT INTO antismash.candidate_types(description)
VALUES
	('chemical hybrid'),
	('interleaved'),
	('neighbouring'),
	('single');


CREATE TABLE antismash.candidates (
    candidate_id	serial NOT NULL,
    region_id	int4 NOT NULL REFERENCES antismash.regions ON DELETE CASCADE,
    location	text NOT NULL,
    candidate_type_id	int4 NOT NULL REFERENCES antismash.candidate_types ON DELETE CASCADE,
    smiles	text,
    polymer  text,
    CONSTRAINT candidates_pkey PRIMARY KEY (candidate_id)
);

COMMENT ON TABLE antismash.candidates IS
  'A candidate cluster as predicted by antiSMASH.';
