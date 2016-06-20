-- Table: antismash.isolates

DROP TABLE antismash.isolates;

CREATE TABLE antismash.isolates
(
  id	serial NOT NULL,
  sample	int4,
  CONSTRAINT isolates_pkey PRIMARY KEY (id),
  CONSTRAINT isolates_sample_fkey FOREIGN KEY (sample) REFERENCES antismash.samples (id)
);
COMMENT ON TABLE antismash.isolates
  IS 'A single biological isolate, sample or strain';
