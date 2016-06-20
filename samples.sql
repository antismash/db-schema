--- DROP TABLE antismash.samples;

CREATE TABLE antismash.samples (
    id	serial NOT NULL,
    habitat	text,
    time	text,
    site	int4,
    CONSTRAINT samples_pkey PRIMARY KEY (id),
    CONSTRAINT samples_site_fkey FOREIGN KEY (site) REFERENCES antismash.sampling_sites (id)
);
COMMENT ON TABLE antismash.samples IS
  'A biological sample.';
