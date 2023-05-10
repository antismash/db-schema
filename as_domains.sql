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
    consensus	text,
    kr_activity	bool,
    kr_stereochemistry	text,
    as_domain_profile_id	int4,
    location text NOT NULL,
    cds_id	int4,
    module_id int4 REFERENCES antismash.modules ON DELETE SET NULL,
    function_id int4 REFERENCES antismash.module_domain_functions ON DELETE SET NULL,
    follows int4 REFERENCES antismash.as_domains ON DELETE SET NULL,
    CONSTRAINT as_domains_pkey PRIMARY KEY (as_domain_id),
    CONSTRAINT as_domains_as_domain_profile_id_fkey FOREIGN KEY (as_domain_profile_id) REFERENCES antismash.as_domain_profiles (as_domain_profile_id) ON DELETE CASCADE,
    CONSTRAINT as_domains_cds_id_fkey FOREIGN KEY (cds_id) REFERENCES antismash.cdss (cds_id) ON DELETE CASCADE
);

COMMENT ON TABLE antismash.as_domains IS
  'A functional domain on a gene as predicted by antiSMASH';

CREATE INDEX as_domains_cds_id_idx ON antismash.as_domains (cds_id);


CREATE TABLE antismash.as_domain_subtypes (
    subtype	text	PRIMARY KEY,
    description	text
);

COMMENT ON TABLE antismash.as_domain_subtypes IS
  'Possible subtypes of domains predicted by antiSMASH, e.g. TransAT-KS';


CREATE TABLE antismash.rel_as_domain_to_subtype (
    as_domain_id	int4	NOT NULL REFERENCES antismash.as_domains,
    subtype	text	NOT NULL REFERENCES antismash.as_domain_subtypes,
    CONSTRAINT rel_as_domain_to_subtype_pkey PRIMARY KEY (as_domain_id, subtype)
);

COMMENT ON TABLE antismash.as_domain_subtypes IS
  'Relationships between a specific aSDomain and subtypes';
