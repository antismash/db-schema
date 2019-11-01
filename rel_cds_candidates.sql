--- Many to many relation for CDSs to candidates
CREATE TABLE antismash.rel_cds_candidates (
    candidate_id	int4,
    cds_id	int4,
    CONSTRAINT rel_cds_candidates_pkey PRIMARY KEY (candidate_id, cds_id),
    CONSTRAINT rel_cds_candidates_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES antismash.candidates (candidate_id),
    CONSTRAINT rel_cds_candidates_cds_id_fkey FOREIGN KEY (cds_id) REFERENCES antismash.cdss (cds_id)
);
