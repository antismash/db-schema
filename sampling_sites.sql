--- DROP TABLE antismash.sampling_sites;

CREATE TABLE antismash.sampling_sites (
    site_id	serial NOT NULL,
    CONSTRAINT sampling_sites_pkey PRIMARY KEY (site_id)
);
COMMENT ON TABLE antismash.sampling_sites IS
  'A site where a biological sample was taken';
