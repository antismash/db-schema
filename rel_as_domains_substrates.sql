--- Many to many relation for as_domains to substrate
CREATE TABLE antismash.rel_as_domains_substrates (
    as_domain_id	int4,
    substrate_id	int4,
    position_in_domain	int4,
    CONSTRAINT rel_as_domains_substrates_pkey PRIMARY KEY (as_domain_id, substrate_id),
    CONSTRAINT rel_as_domains_substrates_domain_id_fkey FOREIGN KEY (as_domain_id) REFERENCES antismash.as_domains (as_domain_id) ON DELETE CASCADE,
    CONSTRAINT rel_as_domains_substrates_substrate_id_fkey FOREIGN KEY (substrate_id) REFERENCES antismash.substrates (substrate_id)
);

