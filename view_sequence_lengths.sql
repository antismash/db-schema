CREATE MATERIALIZED VIEW antismash.sequence_lengths AS SELECT sequence_id, length(dna) AS seq_length FROM antismash.dna_sequences;
