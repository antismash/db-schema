CREATE TABLE antismash.bgc_types (
    bgc_type_id	serial NOT NULL,
    term	text,
    description	text,
    parent	int4,
    CONSTRAINT bgc_types_pkey PRIMARY KEY (bgc_type_id),
    CONSTRAINT bgc_types_term_unique UNIQUE (term),
    CONSTRAINT bgc_types_parent_fkey FOREIGN KEY (parent) REFERENCES antismash.bgc_types (bgc_type_id)
);

COMMENT ON TABLE antismash.bgc_types IS
  'Biosynthetic gene cluster types. Basic types according to MIBiG spec.';

--- basic MIBiG types
INSERT INTO antismash.bgc_types (term, description, parent)
SELECT val.term, val.description, val.parent::int4
FROM (
    VALUES
        ('pks', 'Polyketide', NULL),
        ('nrps', 'Nonribosomal peptide', NULL),
        ('ripp', 'Ribosomally synthesized and post-translationally modified peptide', NULL),
        ('terpene', 'Terpene', NULL),
        ('saccharide', 'Saccharide', NULL),
        ('alkaloid', 'Alkaloid', NULL),
        ('other', 'Other', NULL)
    ) val ( term, description, parent );


--- More detailed antiSMASH types
INSERT INTO antismash.bgc_types (term, description, parent)
SELECT val.term, val.description, f.bgc_type_id
FROM (
    VALUES
        ('t1pks', 'Type I polyketide', 'pks'),
        ('transatpks', 'Trans-AT polyketide', 'pks'),
        ('t2pks', 'Type II polyketide', 'pks'),
        ('t3pks', 'Type III polyketide', 'pks'),
        ('otherks', 'Other types of polyketides', 'pks'),
        ('arylpolyene', 'Aryl polyene', 'other'),
        ('resorcinol', 'Resorcinol', 'other'),
        ('ladderane', 'Ladderane', 'other'),
        ('pufa', 'Polyunsaturated fatty acid', 'other'),
        ('lantipeptide', 'Lanthipeptide', 'ripp'),
        ('bacteriocin', 'Bacteriocin or other unspecified RiPP', 'ripp'),
        ('thiopeptide', 'Thipeptide', 'ripp'),
        ('linaridin', 'Linaridin', 'other'),
        ('cyanobactin', 'Cyanobactin', 'ripp'),
        ('glycocin', 'Glycocin', 'other'),
        ('lap', 'Goadsporin-like', 'other'),
        ('lassopeptide', 'Lasso peptode', 'ripp'),
        ('sactipeptide', 'Sactipeptide', 'ripp'),
        ('bottromycin', 'Bottromycin-like', 'ripp'),
        ('head_to_tail', 'Head-to-tail cyclised (subtilosin-like)', 'ripp'),
        ('microcin', 'Microcin', 'ripp'),
        ('microviridin', 'Microviridin', 'ripp'),
        ('proteusin', 'Proteusin', 'ripp'),
        ('blactam', 'beta-lactam', 'other'),
        ('amglyccycl', 'Aminoglycoside/aminocyclitol', 'other'),
        ('aminocoumarin', 'Aminocoumarin', 'other'),
        ('siderophore', 'Siderophore', 'other'),
        ('ectoine', 'Ectoine', 'other'),
        ('butyrolactone', 'Butyrolactone', 'other'),
        ('indole', 'Indole', 'other'),
        ('nucleoside', 'Nucleoside', 'other'),
        ('phosphoglycolipid', 'Phosphoglycolipid', 'other'),
        ('melanin', 'Melanin', 'other'),
        ('oligosaccharide', 'Oligosaccharide', 'saccharide'),
        ('furan', 'Furan', 'other'),
        ('hserlactone', 'Homoserine lactone', 'other'),
        ('phenazine', 'Phenazine', 'other'),
        ('phosphonate', 'Phosphonate', 'other')
    ) val ( term, description, parent_term )
LEFT JOIN antismash.bgc_types f ON val.parent_term = f.term;
