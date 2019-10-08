CREATE TABLE antismash.t2pks_products (
    product_type text NOT NULL,
    product_function text,
    CONSTRAINT t2pks_products_pkey PRIMARY KEY (product_type)
);

CREATE TABLE antismash.t2pks_profiles (
    profile_id  serial  NOT NULL PRIMARY KEY,
    name    text    NOT NULL UNIQUE,
    description text    NOT NULL
);

CREATE TABLE antismash.t2pks (
    t2pks_id	serial NOT NULL,
    protocluster_id	int4 NOT NULL REFERENCES antismash.protoclusters ON DELETE CASCADE,
    CONSTRAINT t2pks_pkey PRIMARY KEY (t2pks_id)
);

COMMENT ON TABLE antismash.t2pks IS
  'Predicted compound details for a Type II PKS.';


CREATE TABLE antismash.t2pks_starters (
    domain_id   serial NOT NULL,
    t2pks_id    int4 NOT NULL REFERENCES antismash.t2pks ON DELETE CASCADE,
    name    text NOT NULL,
    evalue  float8  NOT NULL,
    bitscore float8 NOT NULL,
    CONSTRAINT t2pks_domain_pkey PRIMARY KEY (domain_id)
);

COMMENT ON TABLE antismash.t2pks_starters IS
  'A Type II PKS-specific starter domain.';

CREATE TABLE antismash.t2pks_cds_domain (
    domain_id   serial NOT NULL,
    t2pks_id    int4 NOT NULL REFERENCES antismash.t2pks ON DELETE CASCADE,
    cds_id  int4 NOT NULL REFERENCES antismash.cdss ON DELETE CASCADE,
    profile_id  int4 NOT NULL REFERENCES antismash.t2pks_profiles ON DELETE CASCADE,
    protein_type    text NOT NULL,
    protein_function    text,
    evalue  float8  NOT NULL,
    bitscore float8 NOT NULL,
    CONSTRAINT t2pks_cds_domain_pkey PRIMARY KEY (domain_id)
);

CREATE TABLE antismash.t2pks_starter_elongation (
    combo_id serial NOT NULL,
    domain_id int4    NOT NULL REFERENCES antismash.t2pks_starters ON DELETE CASCADE,
    elongation int NOT NULL,
    weight float4 NOT NULL,
    CONSTRAINT t2pks_elongations_pkey PRIMARY KEY (combo_id)
);

CREATE TABLE antismash.t2pks_product_classes (
    t2pks_id int4 NOT NULL REFERENCES antismash.t2pks ON DELETE CASCADE,
    product_class text NOT NULL,
    CONSTRAINT t2pks_product_classes_pkey PRIMARY KEY (t2pks_id, product_class)
);

INSERT INTO antismash.t2pks_profiles (name, description)
VALUES
    ('ACP', 'acetyl carrier protein'),
    ('AMID', 'amidase'),
    ('AMIN', 'aminase'),
    ('AT', 'acyltransferase'),
    ('CLF', 'chain length factor (generic profile)'),
    ('CLF_7', 'chain length factor (extending by 7 units)'),
    ('CLF_8|9', 'chain length factor (extending by 8 or 9 units)'),
    ('CLF_11|12', 'chain length factor (extending by 11 or 12 units)'),
    ('CYC', 'cyclase (generic profile)'),
    ('CYC_C7-C12', 'cyclase, connecting carbon 7 to 12'),
    ('CYC_C5-C14', 'cyclase, connecting carbon 5 to 14'),
    ('CYC_C5-C14|C3-C16', 'cyclase, connecting carbon 5 to 13 or carbon 3 to 16'),
    ('CYC_C1-C18|C2-C19', 'cyclase, connecting carbon 1 to 18 or carbon 2 to 19'),
    ('CYC_C2-C19', 'cyclase, connecting carbon 2 to 19'),
    ('CYC_C5-C18', 'cyclase, connecting carbon 5 to 18'),
    ('CYC_C4-C17|C2-C19', 'cyclase, connecting carbon 4 to 17 or carbon 2 to 19'),
    ('CYC_C4-C21|C2-C23|C2-C19', 'cyclase, connecting carbon 4 to 21, carbon 2 to 23, or carbon 2 to 19'),
    ('CYC_C9-C14', 'cyclase, connecting carbon 9 to 14'),
    ('DIMER', 'dimerase'),
    ('GT', 'glycosyltransferase'),
    ('HAL', 'halogenase'),
    ('KR', 'ketoreductase (generic profile)'),
    ('KR_C9', 'ketoreductase reducing carbon 9'),
    ('KR_C11', 'ketoreductase reducing carbon 11'),
    ('KR_C15', 'ketoreductase reducing carbon 15'),
    ('KR_C17', 'ketoreductase reducing carbon 17'),
    ('KR_C19', 'ketoreductase reducing carbon 19'),
    ('KS', 'ketosynthase'),
    ('KSIII', 'non-acetate starter unit ketosynthase III'),
    ('LIG', 'ligase'),
    ('MET', 'methyltransferase (generic profile)'),
    ('MET_carboxy_O', 'methyltransferase (carboxyl O-)'),
    ('MET_C2O|C2N', 'methyltransferase (acting on carbon 2, O or N variants)'),
    ('MET_C6|C8', 'methyltransferase (acting on carbon 6 or 8)'),
    ('MET_C9O', 'methyltransferase (acting on carbon 9, O variant)'),
    ('MET_C10', 'methyltransferase (acting on carbon 10)'),
    ('MET_C11O', 'methyltransferase (acting on carbon 11, O variant)'),
    ('MET_C13O|C17O', 'methyltransferase (acting on carbon 13 or 17, O variant)'),
    ('MET_C18O', 'methyltransferase (acting on carbon 18)'),
    ('OXY', 'oxygenase');

