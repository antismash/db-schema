--- Many to many relation for compounds to monomers
CREATE TABLE antismash.rel_compounds_monomers (
    compound_id	int4,
    monomer_id	int4,
    position	int4,
    CONSTRAINT rel_compounds_monomers_pkey PRIMARY KEY (compound_id, monomer_id, position),
    CONSTRAINT rel_compounds_monomers_compound_id_fkey FOREIGN KEY (compound_id) REFERENCES antismash.compounds (compound_id),
    CONSTRAINT rel_compounds_monomers_monomer_id_fkey FOREIGN KEY (monomer_id) REFERENCES antismash.monomers (monomer_id)
);
