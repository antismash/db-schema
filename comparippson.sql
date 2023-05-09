CREATE TABLE antismash.comparippson_mibig_references (
    comparippson_mibig_id	serial	NOT NULL PRIMARY KEY,
    accession	text	NOT NULL,
    name	text	NOT NULL,
    product	text	NOT NULL,
    compound	text	NOT NULL
);

CREATE TABLE antismash.comparippson_asdb_references (
    comparippson_asdb_id	serial	NOT NULL PRIMARY KEY,
    cds_id	int4	NOT NULL REFERENCES antismash.cdss ON DELETE CASCADE,
    product	text	NOT NULL
);

CREATE TABLE antismash.comparippson_hits (
    comparippson_hit_id	serial	NOT NULL PRIMARY KEY,
    cds_id	int4	REFERENCES antismash.cdss ON DELETE CASCADE,
    similarity	float4	NOT NULL,
    region_id	int4	REFERENCES antismash.regions ON DELETE CASCADE,
    comparippson_mibig_id	int4	REFERENCES antismash.comparippson_mibig_references ON DELETE CASCADE,
    comparippson_asdb_id	int4	REFERENCES antismash.comparippson_asdb_references ON DELETE CASCADE,
    
    CONSTRAINT comparippson_hits_require_single_reference CHECK (
        (comparippson_asdb_id IS NOT NULL)::integer + (comparippson_mibig_id IS NOT NULL)::integer = 1
    )
);

COMMENT ON TABLE antismash.comparippson_hits IS
  'CompaRiPPson hits storage for both MIBiG and aS-DB.';
