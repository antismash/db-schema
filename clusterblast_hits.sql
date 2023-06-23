CREATE TABLE antismash.clusterblast_hits (
    clusterblast_hit_id	serial PRIMARY KEY,
    region_id int4 REFERENCES antismash.regions ON DELETE CASCADE NOT NULL,
    rank	int4 NOT NULL,
    acc	text NOT NULL,
    description	text NOT NULL,
    similarity	int4 NOT NULL,
    algorithm_id	int4 REFERENCES antismash.clusterblast_algorithms
);

COMMENT ON TABLE antismash.clusterblast_hits IS
  'ClusterBlast hit storage, also for Sub- and KnownClusterblast.';
