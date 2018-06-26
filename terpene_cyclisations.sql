CREATE TABLE antismash.terpene_cyclisations (
    terpene_id	int4,
    cds_id	int4,
    from_carbon	int4,
    to_carbon	int4,
    CONSTRAINT terpene_cyclisations_pkey PRIMARY KEY (terpene_id, cds_id),
    CONSTRAINT terpene_cyclisations_cds_id_fkey FOREIGN KEY (cds_id) REFERENCES antismash.cdss (cds_id) ON DELETE CASCADE,
    CONSTRAINT terpene_cyclisations_terpene_id_fkey FOREIGN KEY (terpene_id) REFERENCES antismash.terpenes (terpene_id)
);
COMMENT ON TABLE antismash.terpene_cyclisations IS
  'Metadata about an terpene cyclisation patterns';

CREATE INDEX terpene_cyclisations_cds_id_idx ON antismash.terpene_cyclisations (cds_id);
