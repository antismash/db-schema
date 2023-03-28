#!/usr/bin/env python3
"""Generate substrates.sql"""

from antismash.modules.nrps_pks.name_mappings import KNOWN_SUBSTRATES

HEADER = """CREATE TABLE antismash.substrates (
    substrate_id	serial NOT NULL,
    name	text,
    description	text,
    CONSTRAINT substrate_pkey PRIMARY KEY (substrate_id),
    CONSTRAINT substrate_name_unique UNIQUE (name)
);

INSERT INTO antismash.substrates (name, description)
VALUES"""


def main() -> None:
    """Generate substrates table"""
    print(HEADER)
    for substrate in KNOWN_SUBSTRATES[:-1]:  # all but last one
        print(f"    ('{substrate.short}', '{substrate.long}'),")

    # last one gets a semicolon
    print(f"    ('{KNOWN_SUBSTRATES[-1].short}', '{KNOWN_SUBSTRATES[-1].long}');")


if __name__ == "__main__":
    main()
