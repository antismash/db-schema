CREATE TABLE antismash.modules (
    module_id	serial NOT NULL,
    location	text NOT NULL,
    type		text NOT NULL,
    trans_at     bool NOT NULL,
    complete    bool NOT NULL,
    iterative   bool NOT NULL,
    region_id int4 REFERENCES antismash.regions ON DELETE CASCADE,
    CONSTRAINT modules_pkey PRIMARY KEY (module_id)
);

COMMENT ON TABLE antismash.modules IS
  'An NRPS/PKS module with multiple child domains, the loaded substrate and resulting modified monomer';


CREATE TABLE antismash.module_domain_functions (
    function_id serial NOT NULL PRIMARY KEY,
    function text NOT NULL
);

INSERT INTO antismash.module_domain_functions (function)
VALUES
    ('starter'),
    ('loader'),
    ('carrier_protein'),
    ('modification'),
    ('finalisation'),
    ('other');
