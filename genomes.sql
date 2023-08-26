CREATE TABLE antismash.genomes (
    genome_id	serial NOT NULL,
    tax_id	int4 NOT NULL,
    bio_project	text,
    bio_sample	text,
    isolate_id	int4,
    assembly_id	text NOT NULL,
    CONSTRAINT genomes_pkey PRIMARY KEY (genome_id),
    CONSTRAINT genomes_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES antismash.taxa (tax_id) ON DELETE CASCADE,
    CONSTRAINT genomes_isolate_id_fkey FOREIGN KEY (isolate_id) REFERENCES antismash.isolates (isolate_id) ON DELETE CASCADE
);
COMMENT ON TABLE antismash.genomes IS
    'Information on a genome';
