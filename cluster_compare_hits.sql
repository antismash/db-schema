CREATE TABLE antismash.cluster_compare_hits (
    hit_id	serial PRIMARY KEY,
    region_id int4 REFERENCES antismash.regions ON DELETE CASCADE,
    protocluster_id int4 REFERENCES antismash.protoclusters ON DELETE CASCADE,
    reference_accession	text NOT NULL,
    description	text,
    score	float4 NOT NULL,
    identity_metric	float4 NOT NULL,
    order_metric	float4,
    components_metric	float4,
    
    CONSTRAINT comparison_hits_require_single_reference CHECK (
        (region_id IS NOT NULL)::integer + (protocluster_id IS NOT NULL)::integer = 1
    )
);

CREATE INDEX cluster_compare_ref_idx ON antismash.cluster_compare_hits (reference_accession);

COMMENT ON TABLE antismash.cluster_compare_hits IS
  'ClusterCompare hit storage.';
