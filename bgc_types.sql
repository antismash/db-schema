
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
        ('t1pks', 'Type I polyketide', 'pks'),
        ('t2pks', 'Type II polyketide', 'pks'),
        ('t3pks', 'Type III polyketide', 'pks'),
        ('transat-pks', 'Trans-AT polyketide', 'pks'),
        ('hgle-ks', 'heterocyst glycolipid synthase like PKS', 'pks'),
        ('prodigiosin', 'Serratia-type nontraditional PKS prodigiosin biosynthesis pathway', 'pks'),
        ('ppys-ks', 'PPY-like specific ketosynthases ( PPYSKS )', 'pks'),
        ('arylpolyene', 'Aryl polyene', 'other'),
        ('resorcinol', 'Resorcinol', 'other'),
        ('ladderane', 'Ladderane', 'other'),
        ('pufa', 'PolyUnsaturated Fatty Acid', 'other'),
        ('nrps', 'non-ribosomal peptide synthase', 'nrps'),
        ('cdps', 'tRNA-dependent cyclodipeptide synthases', 'nrps'),
        ('rcdps', 'fungal tRNA-dependent arginine-containing cyclodipeptide synthases', 'nrps'),
        ('thioamide-nrp', 'thioamide-containing non-ribosomal peptides', 'nrps'),
        ('napaa', 'non-alpha poly-amino acids', 'nrps'),
        ('mycosporine-like', 'mycosporine-like amino acid containing molecules', 'nrps'),
        ('terpene', 'Terpene', 'terpene'),
        ('lanthipeptide-class-i', 'Class I Lanthipeptide', 'ripp'),
        ('lanthipeptide-class-ii', 'Class II Lanthipeptide', 'ripp'),
        ('lanthipeptide-class-iii', 'Class III Lanthipeptide', 'ripp'),
        ('lanthipeptide-class-iv', 'Class IV Lanthipeptide', 'ripp'),
        ('lanthipeptide-class-v', 'Class V Lanthipeptide', 'ripp'),
        ('lipolanthine', 'Lanthipeptide class containing N-terminal fatty acids', 'ripp'),
        ('thiopeptide', 'Thio-linked RiPPs', 'ripp'),
        ('thioamitides', 'Thioamitide RiPPs', 'ripp'),
        ('linaridin', 'Linear arid peptides', 'ripp'),
        ('cyanobactin', 'Cyanobactins', 'ripp'),
        ('glycocin', 'Glycocin', 'ripp'),
        ('lap', 'Linear azol ( in ) e-containing peptides', 'ripp'),
        ('lassopeptide', 'Lasso peptide', 'ripp'),
        ('sactipeptide', 'Sactipeptide', 'ripp'),
        ('bottromycin', 'Bottromycin-like RiPPs', 'ripp'),
        ('microviridin', 'Microviridins', 'ripp'),
        ('proteusin', 'Highly modified large leader peptide RiPPs', 'ripp'),
        ('ranthipeptide', 'Cys-rich peptides ( aka . SCIFF: six Cys in fourty-five )', 'ripp'),
        ('redox-cofactor', 'Redox-cofactors', 'ripp'),
        ('epipeptide', 'D-amino-acid containing RiPPs', 'ripp'),
        ('cyclic-lactone-autoinducer', 'agrD-like cyclic lactone autoinducer peptides', 'ripp'),
        ('spliceotide', 'RiPPs containing plpX type spliceases', 'ripp'),
        ('ras-ripp', 'streptide-like thioether-bond RiPPs', 'ripp'),
        ('fungal-ripp', 'fungal RiPP with POP or UstH peptidase types and a modification', 'ripp'),
        ('blactam', 'beta-lactam', 'other'),
        ('2dos', '2-deoxy-streptamine aminoglycoside', 'other'),
        ('amglyccycl', 'Aminoglycoside/aminocyclitol', 'other'),
        ('aminocoumarin', 'Aminocoumarin', 'other'),
        ('ni-siderophore', 'NRPS-independent IucA/IucC-like siderophores', 'other'),
        ('ectoine', 'Ectoine', 'other'),
        ('naggn', 'N-acetylglutaminylglutamine amide', 'other'),
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
        ('guanidinotides', 'RiPP fused with a non-ribosomal peptide', 'ripp'),
        ('other', 'Other, non-categorised secondary metabolites', 'other'),
        ('acyl_amino_acids', 'N-acyl amino acids', 'other'),
        ('pbde', 'polybrominated diphenyl ethers ( PBDEs )', 'other'),
        ('betalactone', 'beta-lactone containing protease inhibitor', 'other'),
        ('tropodithietic-acid', 'tropodithietic acid like cluster', 'other'),
        ('pyrrolidine', 'Pyrrolidines', 'other'),
        ('crocagin', 'Crocagin-like cluster', 'ripp'),
        ('nrp-metallophore', 'Non-ribosomal peptide metallophores', 'nrps'),
        ('methanobactin', 'Copper-chelating/transporting peptides', 'ripp'),
        ('opine-like-metallophore', 'Opine-like zincophores', 'other'),
        ('aminopolycarboxylic-acid', 'Aminopolycarboxylic acid metallophores', 'other'),
        ('nrps-like', 'NRPS-like fragments', 'nrps'),
        ('pks-like', 'PKS-like fragments', 'pks'),
        ('transat-pks-like', 'transAT-PKS-like fragments', 'pks'),
        ('ripp-like', 'Fallback rule containing known RiPP-related profiles', 'ripp'),
        ('rre-containing', 'RRE-element containing cluster', 'ripp'),
        ('fungal-ripp-like', 'fungal RiPP-like clusters', 'ripp'),
        ('phosphonate-like', 'Phosphonate-like', 'other')
    ) val ( term, description, parent_term );
