--- First, create a function to count characters in a string
CREATE OR REPLACE FUNCTION antismash.numch(text, text) RETURNS integer AS
$$
SELECT length($2) - length(replace($2, $1, ''))
$$
LANGUAGE SQL;

--- Now use this to create a function to calculate GC content in percent
CREATE OR REPLACE FUNCTION antismash.calc_gc_content(text) RETURNS numeric AS
$$
SELECT ROUND(100.0 * (antismash.numch('G', $1) + antismash.numch('C', $1)) / length($1), 2)
$$
LANGUAGE SQL;

--- Last but not least, create a materialized view to store this for all genomes
CREATE MATERIALIZED VIEW antismash.sequence_gc_content AS
SELECT accession, antismash.calc_gc_content(dna) AS gc_content FROM antismash.dna_sequences;
