CREATE TABLE antismash.monomers (
    monomer_id	serial NOT NULL,
    name	text,
    smile	text,
    three_letter_code	char(3),
    single_letter_code	char(1),
    CONSTRAINT monomers_pkey PRIMARY KEY (monomer_id)
);

COMMENT ON TABLE antismash.monomers IS
  'A basic building block of a compound.';
