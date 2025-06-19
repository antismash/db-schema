CREATE TABLE antismash.dna_sequences (
    accession	text PRIMARY KEY,
    definition	text,
    contig_type	int4,
    chromosome_type	int4,
    record_number	int4 NOT NULL,
    version	int4,
    genome_id	int4,
    length	int4,
    gc_content numeric,
    CONSTRAINT dna_sequences_genome_id_fkey FOREIGN KEY (genome_id) REFERENCES antismash.genomes (genome_id) ON DELETE CASCADE
);

