CREATE TABLE antismash.monomers (
    monomer_id	serial NOT NULL PRIMARY KEY,
    substrate_id int4 NOT NULL REFERENCES antismash.substrates,
    name text NOT NULL,
    description text,
    CONSTRAINT monomer_name_unique UNIQUE (name)
);
