CREATE TABLE antismash.regulators (
    regulator_id	serial NOT NULL,
    name	text NOT NULL,
    description	text NOT NULL,
    CONSTRAINT regulators_pkey PRIMARY KEY (regulator_id),
    CONSTRAINT regulators_name_unique UNIQUE (name)
);

CREATE TABLE antismash.regulator_confidence (
    confidence_id       serial NOT NULL PRIMARY KEY,
    name        text NOT NULL,
    strength    int2 NOT NULL,
    CONSTRAINT regulator_confidence_name_unique UNIQUE (name)
);

CREATE TABLE antismash.binding_sites (
    binding_site_id     serial NOT NULL PRIMARY KEY,
    regulator_id        int4 NOT NULL REFERENCES antismash.regulators,
    region_id   int4 NOT NULL REFERENCES antismash.regions,
    score       float NOT NULL,
    start       int4 NOT NULL,
    confidence_id       int4 NOT NULL REFERENCES antismash.regulator_confidence
);

INSERT INTO antismash.regulator_confidence (name, strength)
VALUES
    ('weak', 10), 
    ('medium', 20), 
    ('strong', 30); 

INSERT INTO antismash.regulators (name, description)
VALUES
    ('AbrC3', 'Antibiotic production activator'),
    ('AfsQ1', 'Two-component system AfsQ1-Q2, activator of antibiotic production'),
    ('AfsR', 'Pleiotropic regulatory for antibiotic production'),
    ('ArgR', 'Regulator of arginine biosynthesis genes'),
    ('BldD', 'Development and antibiotic global regulator'),
    ('CatR', 'H2O2-responsive repressor'),
    ('CelR', 'Cellobiose uptake repressor'),
    ('CsoR', 'Copper-responsive repressor'),
    ('DasR', 'N-acetylglucosamine dependent repressor'),
    ('DmdR1', 'Iron(II)-dependent repressor'),
    ('HypR', 'L-hydroxyproline utilization repressor'),
    ('LexA_variant_1', 'Repressor of DNA damage response'),
    ('LexA_variant_2', 'Repressor of DNA damage response'),
    ('LexA_variant_3', 'Repressor of DNA damage response'),
    ('NrdR', 'Represses ribonucleotide reductase encoding genes'),
    ('NrtR', 'NAD synthesis repressor'),
    ('NuR', 'Nickel-responsive regulator'),
    ('OsdR', 'Development and stress management regulator'),
    ('ZuR_variant_1', 'Zinc-responsive repressor'),
    ('ZuR_variant_2', 'Zinc-responsive repressor'),
    ('ANR', 'Anaerobic transcriptional regulator'),
    ('ArcA', 'Repressor of carbon oxidation'),
    ('CRP', 'Cyclic AMP receptor protein'),
    ('CcpA', 'Catabolite control protein A'),
    ('ClgR', 'Caseinolytic protease gene regulator'),
    ('CodY', 'Regulator of stationary phase and virulence in Gram-positive bacteria'),
    ('ColR', 'Phenol-responsive regulator'),
    ('CopR', 'Copper-responsive regulator'),
    ('DosR', 'Hypoxia stress response regulator'),
    ('FuR_variant_1', 'Ferric Uptake Regulator'),
    ('FuR_variant_2', 'Ferric Uptake Regulator'),
    ('GnfM', 'Regulator of nitrogen-fixation genes'),
    ('HexR', 'Glucose-responsive regulator'),
    ('HgtR', 'Hydrogen-dependent regulator'),
    ('HipB', 'Bacterial antitoxin HipB'),
    ('IolR', 'Regulator of the inositol catabolism'),
    ('LuxO', 'Repressor of luminescence'),
    ('MatP', 'Cell cycle regulator'),
    ('MexT', 'Global virulence regulator'),
    ('MntR', 'Manganese transport regulator'),
    ('MogR', 'Repressor of flagellar motility genes'),
    ('NtrC', 'Nitrogen regulatory protein C'),
    ('PerR', 'Peroxide regulator'),
    ('PsrA', 'Oleic acid responsive regulator'),
    ('RicR', 'Copper-responsive regulator'),
    ('RpoN', 'Regulator of nitrogen assimilation and virulence'),
    ('RutR', 'Regulator of the pyrimidine and purine metabolism'),
    ('SypG', 'Regulator of biofilm formation and host colonization'),
    ('ToxT', 'Regulator of MSHA biosynthesis'),
    ('VqsM', 'Regulator of quorum-sensing signalling systems');
