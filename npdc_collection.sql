CREATE TABLE IF NOT EXISTS antismash.npdc_collection (
    genome_id int4 NOT NULL,
    identifier text NOT NULL,
    CONSTRAINT npdc_collection_pkey PRIMARY KEY (genome_id),
    CONSTRAINT npdc_collection_identifier_unique UNIQUE (identifier),
    CONSTRAINT npdc_collection_genome_id_fkey FOREIGN KEY (genome_id) REFERENCES antismash.genomes (genome_id) ON DELETE CASCADE
);

COMMENT ON TABLE antismash.npdc_collection IS
    'Genomes in the Natural Product Discovery Center collection';