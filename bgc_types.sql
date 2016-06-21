CREATE TABLE antismash.bgc_types (
    bgc_type_id	serial NOT NULL,
    term	text,
    description	text,
    parent	int4,
    CONSTRAINT bgc_types_pkey PRIMARY KEY (bgc_type_id),
    CONSTRAINT bgc_tyoes_term_unique UNIQUE (term),
    CONSTRAINT bgc_types_parent_fkey FOREIGN KEY (parent) REFERENCES antismash.bgc_types (bgc_type_id)
);

COMMENT ON TABLE antismash.bgc_types IS
  'Biosynthetic gene cluster types. Basic types according to MIBiG spec.';

INSERT INTO antismash.bgc_types (term, description, parent)
SELECT val.term, val.description, f.bgc_type_id
FROM (
    VALUES
        --- basic MIBiG types
        ('pks', 'Polyketide', NULL),
        ('nrp', 'Nonribosomal peptide', NULL),
        ('ripp', 'Ribosomally synthesized and post-translationally modified peptide', NULL),
        ('terpene', 'Terpene', NULL),
        ('saccharide', 'Saccharide', NULL),
        ('alkaloid', 'Alkaloid', NULL),
        ('other', 'Other', NULL),
        --- More detailed antiSMASH types
        ('t1pks', 'Type I polyketide', 'pks'),
        ('transatpks', 'Trans-AT polyketide', 'pks'),
        ('lantipeptide', 'Lanthipeptide', 'ripp')
        --- TODO: Add all missing types
    ) val ( term, description, parent_term )
LEFT JOIN antismash.bgc_types f ON val.parent_term = f.term;
