CREATE TABLE antismash.dna_sequences (
    dna	text,
    md5	text,
    accession	text NOT NULL,
    definition	text,
    contig_type	int4,
    chromosome_type	int4,
    version	int4,
    genome_id	int4,
    CONSTRAINT dna_sequences_pkey PRIMARY KEY (accession),
    CONSTRAINT dna_sequences_genome_id_fkey FOREIGN KEY (genome_id) REFERENCES antismash.genomes (genome_id) ON DELETE CASCADE
);

