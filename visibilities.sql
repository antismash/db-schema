CREATE TABLE antismash.visibilities (
    visibility_id	serial NOT NULL,
    name	text,
    description	text,
    CONSTRAINT visibilities_pkey PRIMARY KEY (visibility_id),
    CONSTRAINT visibilities_name_unique UNIQUE (name)
);
COMMENT ON TABLE antismash.visibilities
  IS 'A description of the visibility of a gene cluster.';

INSERT INTO antismash.visibilities (name, description) VALUES
    ( 'public', 'Public record' );
