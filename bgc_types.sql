
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
        ('t1nrps', 'non-ribosomal peptide synthase', 'nrps'),
        ('cdps', 'tRNA-dependent cyclodipeptide synthases', 'nrps'),
        ('rcdps', 'fungal tRNA-dependent arginine-containing cyclodipeptide synthases', 'nrps'),
        ('thioamide-nrp', 'thioamide-containing non-ribosomal peptides', 'nrps'),
        ('napaa', 'non-alpha poly-amino acids', 'nrps'),
        ('mycosporine-like', 'mycosporine-like amino acid containing molecules', 'nrps'),
        ('lanthipeptide-class-i', 'Class I lanthipeptide', 'ripp'),
        ('lanthipeptide-class-ii', 'Class II lanthipeptide', 'ripp'),
        ('lanthipeptide-class-iii', 'Class III lanthipeptide clusters', 'ripp'),
        ('lanthipeptide-class-iv', 'Class IV lanthipeptide', 'ripp'),
        ('lanthipeptide-class-v', 'Glycosylated lanthipeptide/linaridin hybrids', 'ripp'),
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
        ('nrps-like', 'Catches NRPS-like fragments that are not detected by the NRPS rule', 'nrps'),
        ('pks-like', 'Catches PKS-like fragments that are not detected by another PKS rule', 'pks'),
        ('transat-pks-like', 'Marks partial transAT-PKS clusters , specifically those with an AT-docking domain , but no AT domain .', 'pks'),
        ('ripp-like', 'Fallback rule containing known RiPP-related profiles', 'ripp'),
        ('rre-containing', 'RRE-element containing cluster', 'ripp'),
        ('fungal-ripp-like', 'fungal RiPP-like clusters', 'ripp'),
        ('phosphonate-like', 'Phosphonate-like', 'other')
    ) val ( term, description, parent_term )
LEFT JOIN antismash.bgc_types f ON val.parent_term = f.term;
