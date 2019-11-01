CREATE TABLE antismash.clusterblast_hits (
    clusterblast_hit_id	serial NOT NULL,
    region_id int4 REFERENCES antismash.regions ON DELETE CASCADE,
    candidate_id int4 REFERENCES antismash.candidates ON DELETE CASCADE,
    protocluster_id int4 REFERENCES antismash.protoclusters ON DELETE CASCADE,
    rank	int4,
    acc	text,
    description	text,
    similarity	int4,
    algorithm_id	int4,
    CONSTRAINT clusterblast_hits_pkey PRIMARY KEY (clusterblast_hit_id),
    CONSTRAINT clusterblast_hits_algorithm_id_fkey FOREIGN KEY (algorithm_id) REFERENCES antismash.clusterblast_algorithms (algorithm_id),
    CONSTRAINT clusterblast_hits_require_single_reference CHECK (
        (region_id IS NOT NULL)::integer + (candidate_id IS NOT NULL)::integer + (protocluster_id IS NOT NULL)::integer = 1
    )
);

COMMENT ON TABLE antismash.clusterblast_hits IS
  'ClusterBlast hit storage, also for Sub- and KnownClusterblast.';
