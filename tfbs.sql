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
    ('LexA', 'Repressor of DNA damage response'),
    ('NrdR', 'Represses ribonucleotide reductase encoding genes'),
    ('NrtR', 'NAD synthesis repressor'),
    ('NuR', 'Nickel-responsive regulator'),
    ('OsdR', 'Development and stress management regulator'),
    ('ZuR', 'Zinc-responsive repressor');
