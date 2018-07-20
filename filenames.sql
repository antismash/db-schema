CREATE TABLE antismash.filenames (
    assembly_id	text,
    base_filename	text,
    CONSTRAINT filenames_pkey PRIMARY KEY (assembly_id)
);
COMMENT ON TABLE antismash.filenames IS
    'Tracking a number of interesting filenames for an assembly id';
