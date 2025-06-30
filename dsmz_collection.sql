CREATE TABLE IF NOT EXISTS antismash.dsmz_collection (
    genome_id int4 NOT NULL,
    identifier text NOT NULL,
    CONSTRAINT dsmz_collection_pkey PRIMARY KEY (genome_id),
    CONSTRAINT dsmz_collection_identifier_unique UNIQUE (identifier),
    CONSTRAINT dsmz_collection_genome_id_fkey FOREIGN KEY (genome_id) REFERENCES antismash.genomes (genome_id) ON DELETE CASCADE
);

COMMENT ON TABLE antismash.dsmz_collection IS
    'Genomes in the Deutsche Sammlung von Mikroorganismen und Zellkulturen (DSMZ) collection';