CREATE TABLE IF NOT EXISTS antismash.terpene_domains (
    terpene_domain_id serial PRIMARY KEY,
    name text UNIQUE
);

COMMENT ON TABLE antismash.terpene_domains IS
  'Different type of terpene domains predicted by antiSMASH.';

INSERT INTO antismash.terpene_domains (name)
VALUES
    ('Lycopene_cycl'),
    ('TS_Pyr4'),
    ('TS_UbiA'),
    ('T1TS'),
    ('HAD_2'),
    ('T2TS'),
    ('PT_phytoene_like'),
    ('PT_FPPS_like'),
    ('ambiguous')
ON CONFLICT (name) DO NOTHING;


CREATE TABLE IF NOT EXISTS antismash.terpene_hits (
    terpene_hit_id serial PRIMARY KEY,
    terpene_domain_id int4 NOT NULL REFERENCES antismash.terpene_domains ON DELETE CASCADE,
    cds_id int4 NOT NULL REFERENCES antismash.cdss ON DELETE CASCADE,
    location text NOT NULL
);

COMMENT ON TABLE antismash.terpene_hits IS
  'Terpene predictions.';

CREATE INDEX IF NOT EXISTS terpene_hits_cds_id_idx ON antismash.terpene_hits (cds_id);
