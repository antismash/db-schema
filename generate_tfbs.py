#!/usr/bin/env python3
"""Generate tfbs.sql"""

from antismash.modules.tfbs_finder.tfbs_finder import PWM_PATH, load_matrices


HEADER = """CREATE TABLE antismash.regulators (
    regulator_id	serial NOT NULL,
    name	text,
    description	text,
    CONSTRAINT regulators_pkey PRIMARY KEY (regulator_id),
    CONSTRAINT regulators_name_unique UNIQUE (name)
);

CREATE TABLE antismash.regulator_confidence (
    confidence_id       serial NOT NULL PRIMARY KEY,
    name        text NOT NULL,
    strength    int2 NOT NULL,
    CONSTRAINT regulator_confidence_name_unique UNIQUE (name)
);

CREATE TABLE antismash.binding_sites (
    binding_site_id     serial NOT NULL PRIMARY KEY,
    regulator_id        int4 NOT NULL REFERENCES antismash.regulators,
    region_id   int4 NOT NULL REFERENCES antismash.regions,
    score       float NOT NULL,
    start       int4 NOT NULL,
    confidence_id       int4 NOT NULL REFERENCES antismash.regulator_confidence
);

INSERT INTO antismash.regulator_confidence (name, strength)
VALUES
    ('weak', 10), 
    ('medium', 20), 
    ('strong', 30); 

INSERT INTO antismash.regulators (name, description)
VALUES"""


def main() -> None:
    """Generate binding site tables"""
    print(HEADER)
    matrices = load_matrices(PWM_PATH)
    for matrix in matrices[:-1]:
        print(f"    ('{matrix.name}', '{matrix.description}'),")

    # use a semicolon for the last
    print(f"    ('{matrices[-1].name}', '{matrices[-1].description}');")


if __name__ == "__main__":
    main()
