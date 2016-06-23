CREATE TABLE antismash.genomes (
    genome_id	serial NOT NULL,
    taxon	int4,
    bio_project	text,
    bio_sample	text,
    isolate	int4,
    CONSTRAINT genomes_pkey PRIMARY KEY (genome_id),
    CONSTRAINT genomes_isolate_fkey FOREIGN KEY (isolate) REFERENCES antismash.isolates (isolate_id)
);
COMMENT ON TABLE antismash.genomes IS
    'Information on a genome';
