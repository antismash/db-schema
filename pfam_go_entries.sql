
CREATE TABLE antismash.pfam_go_entries (
    pfam_domain_id int4 NOT NULL REFERENCES antismash.pfam_domains ON DELETE CASCADE,
    go_id int4 NOT NULL REFERENCES antismash.gene_ontologies ON DELETE CASCADE,
    CONSTRAINT pfam_go_entries_pkey PRIMARY KEY (pfam_domain_id, go_id)
);
