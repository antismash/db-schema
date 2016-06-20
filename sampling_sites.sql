--- DROP TABLE antismash.sampling_sites;

CREATE TABLE antismash.sampling_sites (
    id	serial NOT NULL,
    CONSTRAINT sampling_sites_pkey PRIMARY KEY (id)
);
COMMENT ON TABLE antismash.sampling_sites IS
  'A site where a biological sample was taken';
