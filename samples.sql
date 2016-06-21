--- DROP TABLE antismash.samples;

CREATE TABLE antismash.samples (
    sample_id	serial NOT NULL,
    habitat	text,
    time	text,
    site	int4,
    CONSTRAINT samples_pkey PRIMARY KEY (sample_id),
    CONSTRAINT samples_site_fkey FOREIGN KEY (site) REFERENCES antismash.sampling_sites (site_id)
);
COMMENT ON TABLE antismash.samples IS
  'A biological sample.';
