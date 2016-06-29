CREATE TABLE antismash.taxa (
    tax_id	int4 NOT NULL,
    superkingdom	text,
    phylum	text,
    class	text,
    taxonomic_order	text,
    family	text,
    genus	text,
    species	text,
    CONSTRAINT taxa_pkey PRIMARY KEY (tax_id)
);
