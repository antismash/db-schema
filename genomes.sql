DROP TABLE antismash.genomes;

CREATE TABLE antismash.genomes (
    id serial NOT NULL,
    taxon	int4,
    bio_project	text,
    bio_sample	text,
    isolate	int4,
    CONSTRAINT genomes_pkey PRIMARY KEY (id),
    CONSTRAINT genomes_isolate_fkey FOREIGN KEY (isolate) REFERENCES antismash.isolates (id)
);
COMMENT ON TABLE antismash.genomes IS
    'Information on a genome';
