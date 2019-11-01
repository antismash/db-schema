CREATE TABLE antismash.protoclusters (
    protocluster_id	serial NOT NULL,
    region_id	int4 NOT NULL REFERENCES antismash.regions ON DELETE CASCADE,
    location	text NOT NULL,
    bgc_type_id	int4 NOT NULL,
    CONSTRAINT protoclusters_pkey PRIMARY KEY (protocluster_id),
    CONSTRAINT protoclusters_bgc_type_id_fkey FOREIGN KEY (bgc_type_id) REFERENCES antismash.bgc_types (bgc_type_id)
);

COMMENT ON TABLE antismash.protoclusters IS
  'A protocluster as predicted by antiSMASH.';
