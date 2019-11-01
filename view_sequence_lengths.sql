CREATE MATERIALIZED VIEW antismash.sequence_lengths AS SELECT accession, length(dna) AS seq_length FROM antismash.dna_sequences;
