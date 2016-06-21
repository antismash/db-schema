--- Many to many relation for biosynthetic_gene_clusters and bgc_types
CREATE TABLE antismash.rel_clusters_types (
    bgc_id	int4,
    bgc_type_id	int4,
    CONSTRAINT rel_clusters_types_pkey PRIMARY KEY (bgc_id, bgc_type_id),
    CONSTRAINT rel_clusters_types_bgc_id_fkey FOREIGN KEY (bgc_id) REFERENCES antismash.biosynthetic_gene_clusters (bgc_id),
    CONSTRAINT rel_clusters_types_bgc_type_id_fkey FOREIGN KEY (bgc_type_id) REFERENCES antismash.bgc_types (bgc_type_id)
);
