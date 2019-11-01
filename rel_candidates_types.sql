--- Many to many relation for candidates and bgc_types
CREATE TABLE antismash.rel_candidates_types (
    candidate_id	int4 NOT NULL REFERENCES antismash.candidates ON DELETE CASCADE,
    bgc_type_id	int4 NOT NULL REFERENCES antismash.bgc_types ON DELETE CASCADE,
    CONSTRAINT rel_candidates_types_pkey PRIMARY KEY (candidate_id, bgc_type_id)
);
