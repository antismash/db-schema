CREATE TABLE antismash.bgc_rules (
    bgc_rule_id	serial NOT NULL,
    rule	text,
    bgc_type_id	int4,
    CONSTRAINT bgc_rules_pkey PRIMARY KEY (bgc_rule_id),
    CONSTRAINT bgc_rules_bgc_type_id_fkey FOREIGN KEY (bgc_type_id) REFERENCES antismash.bgc_types (bgc_type_id)
);

COMMENT ON TABLE antismash.bgc_rules IS
  'The detection rule used for a specific BGC type';
