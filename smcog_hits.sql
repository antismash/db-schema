CREATE TABLE antismash.smcog_hits (
    smcog_id	int4,
    cds_id	int4,
    score	float8,
    evalue	float8,
    image_path	text,
    CONSTRAINT smcog_hits_pkey PRIMARY KEY (smcog_id, cds_id),
    CONSTRAINT smcog_hits_cds_id_fkey FOREIGN KEY (cds_id) REFERENCES antismash.cdses (cds_id) ON DELETE CASCADE,
    CONSTRAINT smcog_hits_smcog_id_fkey FOREIGN KEY (smcog_id) REFERENCES antismash.smcogs (smcog_id)
);
COMMENT ON TABLE antismash.smcog_hits IS
  'Metadata about an smCoG hit';

CREATE INDEX smcog_hits_cds_id_idx ON antismash.smcog_hits (cds_id);
