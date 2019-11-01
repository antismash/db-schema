--- Many to many relation for regions and bgc_types
CREATE TABLE antismash.rel_regions_types (
    region_id	int4,
    bgc_type_id	int4,
    CONSTRAINT rel_regions_types_pkey PRIMARY KEY (region_id, bgc_type_id),
    CONSTRAINT rel_regions_types_region_id_fkey FOREIGN KEY (region_id) REFERENCES antismash.regions (region_id) ON DELETE CASCADE,
    CONSTRAINT rel_regions_types_bgc_type_id_fkey FOREIGN KEY (bgc_type_id) REFERENCES antismash.bgc_types (bgc_type_id)
);
