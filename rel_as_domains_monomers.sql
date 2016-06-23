--- Many to many relation for as_domains to monomers
CREATE TABLE antismash.rel_as_domains_monomers (
    as_domain_id	int4,
    monomer_id	int4,
    position_in_domain	int4,
    CONSTRAINT rel_as_domains_monomers_pkey PRIMARY KEY (as_domain_id, monomer_id),
    CONSTRAINT rel_as_domains_monomers_domain_id_fkey FOREIGN KEY (as_domain_id) REFERENCES antismash.as_domains (as_domain_id),
    CONSTRAINT rel_as_domains_monomers_monomer_id_fkey FOREIGN KEY (monomer_id) REFERENCES antismash.monomers (monomer_id)
);

