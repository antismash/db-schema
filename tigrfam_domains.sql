CREATE TABLE antismash.tigrfam_domains (
    tigrfam_domain_id	serial	PRIMARY KEY,
    database	text,
    detection	text,
    score	float8,
    evalue	float8,
    translation	text,
    tigrfam_id	text	REFERENCES antismash.tigrfams (tigrfam_id) ON DELETE CASCADE,
    location	text,
    cds_id	int4	REFERENCES antismash.cdss (cds_id) ON DELETE CASCADE
);

COMMENT ON TABLE antismash.pfam_domains IS
  'A TIGRFAM domain prediction';

CREATE INDEX tigrfam_domains_cds_id_idx ON antismash.tigrfam_domains (cds_id);
