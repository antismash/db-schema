CREATE TABLE antismash.as_domains (
    as_domain_id	serial NOT NULL,
    detection	text,
    score	float8,
    evalue	float8,
    translation	text,
    pks_signature	text,
    minowa	text,
    nrps_predictor	text,
    stachelhaus	text,
    phmm	text,
    predicat	text,
    pid	float8,
    snn_score	float8,
    consensus	text,
    kr_activity	bool,
    kr_stereochemistry	text,
    as_domain_profile_id	int4,
    locus_id	int4,
    cds_id	int4,
    CONSTRAINT as_domains_pkey PRIMARY KEY (as_domain_id),
    CONSTRAINT as_domains_as_domain_profile_id_fkey FOREIGN KEY (as_domain_profile_id) REFERENCES antismash.as_domain_profiles (as_domain_profile_id) ON DELETE CASCADE,
    CONSTRAINT as_domains_locus_id_fkey FOREIGN KEY (locus_id) REFERENCES antismash.loci (locus_id) ON DELETE CASCADE,
    CONSTRAINT as_domains_cds_id_fkey FOREIGN KEY (cds_id) REFERENCES antismash.cdss (cds_id) ON DELETE CASCADE
);

COMMENT ON TABLE antismash.as_domains IS
  'A functional domain on a gene as predicted by antiSMASH';

CREATE INDEX as_domains_cds_id_idx ON antismash.as_domains (cds_id);
CREATE INDEX as_domains_locus_id_idx ON antismash.as_domains (locus_id);
