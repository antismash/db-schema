CREATE TABLE antismash.clusterblast_hits (
    clusterblast_hit_id	serial NOT NULL,
    region_id int4 NOT NULL REFERENCES antismash.regions ON DELETE CASCADE,
    rank	int4,
    acc	text,
    description	text,
    similarity	int4,
    algorithm_id	int4,
    CONSTRAINT clusterblast_hits_pkey PRIMARY KEY (clusterblast_hit_id),
    CONSTRAINT clusterblast_hits_algorithm_id_fkey FOREIGN KEY (algorithm_id) REFERENCES antismash.clusterblast_algorithms (algorithm_id)
);

COMMENT ON TABLE antismash.clusterblast_hits IS
  'ClusterBlast hit storage, also for Sub- and KnownClusterblast.';

CREATE INDEX clusterblast_hits_bgc_id_rank_algorithm_id_idx ON antismash.clusterblast_hits (region_id, rank, algorithm_id);
