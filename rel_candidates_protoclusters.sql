--- Many to many relation for candidates to protoclusters
CREATE TABLE antismash.rel_candidates_protoclusters (
    candidate_id	int4 REFERENCES antismash.candidates ON DELETE CASCADE,
    protocluster_id	int4 REFERENCES antismash.protoclusters ON DELETE CASCADE,
    CONSTRAINT rel_candidates_protoclusters_pkey PRIMARY KEY (candidate_id, protocluster_id)
);
