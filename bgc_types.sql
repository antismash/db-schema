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
        ('t1pks', 'Type I polyketide', 'pks'),
        ('transat-pks', 'Trans-AT polyketide', 'pks'),
        ('t2pks', 'Type II polyketide', 'pks'),
        ('t3pks', 'Type III polyketide', 'pks'),
        ('ppys-ks', 'PPY-like pyrone', 'pks'),
        ('arylpolyene', 'Aryl polyene', 'other'),
        ('resorcinol', 'Resorcinol', 'other'),
        ('ladderane', 'Ladderane', 'other'),
        ('pufa', 'Polyunsaturated fatty acid', 'other'),
        ('lanthipeptide', 'Lanthipeptide', 'ripp'),
        ('lanthidin', 'Lanthidin', 'ripp'),
        ('bacteriocin', 'Bacteriocin or other unspecified RiPP', 'ripp'),
        ('thiopeptide', 'Thiopeptide', 'ripp'),
        ('tfua-related', 'TfuA-related RiPP', 'ripp'),
        ('linaridin', 'Linaridin', 'other'),
        ('cyanobactin', 'Cyanobactin', 'ripp'),
        ('lipolanthine', 'Lipolanthine', 'ripp'),
        ('glycocin', 'Glycocin', 'other'),
        ('lap', 'Linear azol(in)e-containing peptides', 'other'),
        ('lassopeptide', 'Lasso peptide', 'ripp'),
        ('sactipeptide', 'Sactipeptide', 'ripp'),
        ('bottromycin', 'Bottromycin-like', 'ripp'),
        ('head_to_tail', 'Head-to-tail cyclised (subtilosin-like)', 'ripp'),
        ('microviridin', 'Microviridin', 'ripp'),
        ('proteusin', 'Proteusin', 'ripp'),
        ('ras-ripp', 'Streptide-like thioether-bond RiPPs', 'ripp'),
        ('fungal-ripp', 'Fungal RiPP with POP or UstH peptidase types and a modification', 'ripp'),
        ('blactam', 'Beta-lactam', 'other'),
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
        ('phosphonate', 'Phosphonate', 'other'),
        ('fused', 'Pheganomycin-like ligase', 'other'),
        ('pbde', 'Polybrominated diphenyl ether', 'other'),
        ('acyl_amino_acids', 'N-acyl amino acid cluster', 'other'),
        ('hgle-ks', 'hglE-type polyketide', 'other'),
        ('nrps-like', 'Nonribosomal peptide fragment', 'nrps'),
        ('thioamide-nrp', 'Thioamide-containing non-ribosomal peptide', 'nrps'),
        ('pks-like', 'Polyketide fragment', 'pks'),
        ('transat-pks-like', 'TransAT Polyketide fragment', 'pks'),
        ('cdps', 'RNA-dependent cyclodipeptide synthase', 'other'),
        ('betalactone', 'Beta-lactone containing protease inhibitor', 'other'),
        ('naggn', 'N-acetylglutaminylglutamine amide', 'other'),
        ('tropodithietic-acid', 'Tropodithietic acid', 'other')
    ) val ( term, description, parent_term )
LEFT JOIN antismash.bgc_types f ON val.parent_term = f.term;
