CREATE TABLE antismash.clusterblast_hits (
    clusterblast_hit_id	serial NOT NULL,
    rank	int4,
    acc	text,
    description	text,
    similarity	int4,
    algorithm_id	int4,
    bgc_id	int4,
    CONSTRAINT clusterblast_hits_pkey PRIMARY KEY (clusterblast_hit_id),
    CONSTRAINT clusterblast_hits_algorithm_id_fkey FOREIGN KEY (algorithm_id) REFERENCES antismash.clusterblast_algorithms (algorithm_id),
    CONSTRAINT clusterblast_hits_bgc_id_fkey FOREIGN KEY (bgc_id) REFERENCES antismash.biosynthetic_gene_clusters (bgc_id)
);

COMMENT ON TABLE antismash.clusterblast_hits IS
  'ClusterBlast hit storage, also for Sub- and KnownClusterblast.';
