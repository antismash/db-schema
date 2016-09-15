--- DROP TABLE antismash.samples;

CREATE TABLE antismash.samples (
    sample_id	serial NOT NULL,
    habitat	text,
    time	text,
    site_id	int4,
    CONSTRAINT samples_pkey PRIMARY KEY (sample_id),
    CONSTRAINT samples_site_id_fkey FOREIGN KEY (site_id) REFERENCES antismash.sampling_sites (site_id)
);
COMMENT ON TABLE antismash.samples IS
  'A biological sample.';
