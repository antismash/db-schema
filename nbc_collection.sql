CREATE TABLE IF NOT EXISTS antismash.nbc_collection (
    genome_id int4 NOT NULL,
    identifier text NOT NULL,
    CONSTRAINT nbc_collection_pkey PRIMARY KEY (genome_id),
    CONSTRAINT nbc_collection_identifier_unique UNIQUE (identifier),
    CONSTRAINT nbc_collection_genome_id_fkey FOREIGN KEY (genome_id) REFERENCES antismash.genomes (genome_id) ON DELETE CASCADE
);

COMMENT ON TABLE antismash.nbc_collection IS
    'Genomes in the DTU Biosustain New Bioactive Compounds group collection';