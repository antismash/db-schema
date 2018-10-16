CREATE TABLE antismash.dna_sequences (
    sequence_id	serial NOT NULL,
    dna	text,
    md5	text,
    acc	text,
    definition	text,
    contig_type	int4,
    chromosome_type	int4,
    version	int4,
    genome_id	int4,
    CONSTRAINT dna_sequences_pkey PRIMARY KEY (sequence_id),
    CONSTRAINT dna_sequences_genome_id_fkey FOREIGN KEY (genome_id) REFERENCES antismash.genomes (genome_id) ON DELETE CASCADE
);

