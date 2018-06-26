CREATE TABLE antismash.terpenes (
    terpene_id	serial NOT NULL,
    name	text,
    description	text,
    CONSTRAINT terpene_pkey PRIMARY KEY (terpene_id)
);
COMMENT ON TABLE antismash.terpenes IS
  'Terpene synthase types';


INSERT INTO antismash.terpenes (name, description) VALUES
    ( 'STC', 'sesquiterpene synthase' ),
    ( 'MTC', 'monoterpene synthase' ),
    ( 'DTC', 'diterpene synthase' );
