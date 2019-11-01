--- Many to many relation for compounds to modules
CREATE TABLE antismash.rel_candidates_modules (
    candidate_id	int4 NOT NULL REFERENCES antismash.candidates ON DELETE CASCADE,
    module_id	int4 NOT NULL REFERENCES antismash.modules ON DELETE CASCADE,
    CONSTRAINT rel_candidates_modules_pkey PRIMARY KEY (candidate_id, module_id)
);
