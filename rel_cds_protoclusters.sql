--- Many to many relation for CDSs to protoclusters
CREATE TABLE antismash.rel_cds_protoclusters (
    protocluster_id	int4,
    cds_id	int4,
    CONSTRAINT rel_cds_protoclusters_pkey PRIMARY KEY (protocluster_id, cds_id),
    CONSTRAINT rel_cds_protoclusters_protocluster_id_fkey FOREIGN KEY (protocluster_id) REFERENCES antismash.protoclusters (protocluster_id),
    CONSTRAINT rel_cds_protoclusters_cds_id_fkey FOREIGN KEY (cds_id) REFERENCES antismash.cdss (cds_id)
);
