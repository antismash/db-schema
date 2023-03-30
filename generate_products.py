#!/usr/bin/env python3

from antismash.detection import hmm_detection

STATEMENT = """
CREATE TABLE antismash.bgc_types (
    bgc_type_id	serial NOT NULL,
    term	text,
    description	text,
    parent_id	int4,
    CONSTRAINT bgc_types_pkey PRIMARY KEY (bgc_type_id),
    CONSTRAINT bgc_types_term_unique UNIQUE (term),
    CONSTRAINT bgc_types_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES antismash.bgc_types (bgc_type_id)
);

COMMENT ON TABLE antismash.bgc_types IS
  'Biosynthetic gene cluster types. Basic types according to MIBiG spec.';

--- basic MIBiG types
INSERT INTO antismash.bgc_types (term, description, parent_id)
SELECT val.term, val.description, val.parent_id::int4
FROM (
    VALUES
        ('pks', 'Polyketide', NULL),
        ('nrps', 'Nonribosomal peptide', NULL),
        ('ripp', 'Ribosomally synthesized and post-translationally modified peptide', NULL),
        ('terpene', 'Terpene', NULL),
        ('saccharide', 'Saccharide', NULL),
        ('alkaloid', 'Alkaloid', NULL),
        ('other', 'Other', NULL)
    ) val ( term, description, parent_id );


--- More detailed antiSMASH types
INSERT INTO antismash.bgc_types (term, description, parent_id)
SELECT val.term, val.description, f.bgc_type_id
FROM (
    VALUES
        {0}
    ) val ( term, description, parent_term )
LEFT JOIN antismash.bgc_types f ON val.parent_term = f.term;"""

rules = hmm_detection._get_rules("relaxed")

lines = []

for rule in rules:
    if rule.name in ["terpene", "other"]:
        continue
    name = rule.name
    if rule.name == "NRPS":
        name = "t1nrps"
    lines.append((name.lower(), rule.description, rule.category.lower()))  # TODO remove lowering

print(STATEMENT.format(",\n        ".join(map(str, lines))))
