CREATE TABLE antismash.profile_hits (
    profile_hit_id	serial NOT NULL,
    cds_id	int4,
    name	text,
    evalue	float8,
    bitscore	float8,
    seeds	int4,
    CONSTRAINT profile_hits_pkey PRIMARY KEY (profile_hit_id),
    CONSTRAINT profile_hits_cds_id_fkey FOREIGN KEY (cds_id) REFERENCES antismash.cdses (cds_id) ON DELETE CASCADE,
    CONSTRAINT profile_hits_name_fkey FOREIGN KEY (name) REFERENCES antismash.profiles (name)
);

COMMENT ON TABLE antismash.profile_hits IS
  'A hit against one of the cluster detection profiles in a gene';

CREATE INDEX profile_hits_cds_id_idx ON antismash.profile_hits (cds_id);
