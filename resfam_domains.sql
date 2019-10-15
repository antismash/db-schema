CREATE TABLE antismash.resfam_domains (
    resfam_domain_id	serial NOT NULL PRIMARY KEY,
    score	float8,
    evalue	float8,
    resfam_id	int4 NOT NULL REFERENCES antismash.resfams ON DELETE CASCADE,
    cds_id	int4 NOT NULL REFERENCES antismash.cdss ON DELETE CASCADE
);

CREATE INDEX resfam_domains_cds_id_idx ON antismash.resfam_domains (cds_id);
