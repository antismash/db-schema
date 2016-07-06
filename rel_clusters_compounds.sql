--- Many to many relation for clusters to compounds
CREATE TABLE antismash.rel_clusters_compounds (
    bgc_id	int4,
    compound_id	int4,
    CONSTRAINT rel_clusters_compounds_pkey PRIMARY KEY (bgc_id, compound_id),
    CONSTRAINT rel_clusters_compounds_bgc_id_fkey FOREIGN KEY (bgc_id) REFERENCES antismash.biosynthetic_gene_clusters (bgc_id) ON DELETE CASCADE,
    CONSTRAINT rel_clusters_compounds_compound_id_fkey FOREIGN KEY (compound_id) REFERENCES antismash.compounds (compound_id)
);
