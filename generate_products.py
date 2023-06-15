#!/usr/bin/env python3

from antismash.detection import hmm_detection

STATEMENT = """
CREATE TABLE antismash.bgc_categories (
    category	text	PRIMARY KEY,
    description	text	UNIQUE NOT NULL
);

COMMENT ON TABLE antismash.bgc_categories IS
  'Biosynthetic gene cluster categories according to MIBiG spec.';

--- basic MIBiG types
INSERT INTO antismash.bgc_categories (category, description)
VALUES
    ('pks', 'Polyketide'),
    ('nrps', 'Nonribosomal peptide'),
    ('ripp', 'Ribosomally synthesized and post-translationally modified peptide'),
    ('terpene', 'Terpene'),
    ('saccharide', 'Saccharide'),
    ('alkaloid', 'Alkaloid'),
    ('other', 'Other');


CREATE TABLE antismash.bgc_types (
    bgc_type_id	serial NOT NULL,
    term	text	NOT NULL,
    description	text	NOT NULL,
    category	text	NOT NULL,
    CONSTRAINT bgc_types_pkey PRIMARY KEY (bgc_type_id),
    CONSTRAINT bgc_types_term_unique UNIQUE (term),
    CONSTRAINT bgc_types_category_fkey FOREIGN KEY (category) REFERENCES antismash.bgc_categories (category)
);

COMMENT ON TABLE antismash.bgc_types IS
  'Biosynthetic gene cluster types.';

--- More detailed antiSMASH types
INSERT INTO antismash.bgc_types (term, description, category)
SELECT val.term, val.description, val.parent_term
FROM (
    VALUES
        {0}
    ) val ( term, description, parent_term );"""

rules = hmm_detection._get_rules("relaxed")

lines = []

for rule in rules:
    name = rule.name
    lines.append((name.lower(), rule.description, rule.category.lower()))  # TODO remove lowering

print(STATEMENT.format(",\n        ".join(map(str, lines))))
