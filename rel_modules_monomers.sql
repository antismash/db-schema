--- Many to many relation for modules to substrates and monomers
CREATE TABLE antismash.rel_modules_monomers (
    module_id	int4 REFERENCES antismash.modules ON DELETE CASCADE,
    substrate	int4 REFERENCES antismash.substrates (substrate_id),
    monomer		int4 REFERENCES antismash.monomers (monomer_id),
    CONSTRAINT rel_modules_monomers_pkey PRIMARY KEY (module_id, substrate, monomer)
);
