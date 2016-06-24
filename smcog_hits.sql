CREATE TABLE antismash.smcog_hits (
    smcog_hit_id	serial NOT NULL,
    score	float4,
    evalue	float4,
    image_path	text,
    smcog_class	int4,
    CONSTRAINT smcog_hits_pkey PRIMARY KEY (smcog_hit_id),
    CONSTRAINT smcog_hits_smcog_class_fkey FOREIGN KEY (smcog_class) REFERENCES antismash.smcogs (smcog_id)
);
COMMENT ON TABLE antismash.smcog_hits IS
  'Metadata about an smCoG hit';
