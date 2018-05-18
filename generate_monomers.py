#!/usr/bin/env python3
"""Convert a list of monomers into an SQL table."""
import argparse
import sys

HEADER = """\
CREATE TABLE antismash.monomers (
    monomer_id	serial NOT NULL,
    name	text,
    description	text,
    smile	text,
    three_letter_code	char(3),
    single_letter_code	char(1),
    CONSTRAINT monomers_pkey PRIMARY KEY (monomer_id),
    CONSTRAINT monomers_name_unique UNIQUE (name)
);

COMMENT ON TABLE antismash.monomers IS
  'A basic building block of a compound.';

INSERT INTO antismash.monomers (name, description, three_letter_code, single_letter_code)
VALUES"""


def main():
    """Run the conversion."""
    parser = argparse.ArgumentParser()
    parser.add_argument('monomers', help="monomers file to load")
    args = parser.parse_args()

    print(HEADER)
    print(generate_sql_values(args.monomers))


def generate_sql_values(filename):
    """Generate SQL VALUES lines to insert into the database."""
    lines = []
    for name, desc, three, single in parse_monomers(filename):
        if three != 'NULL':
            three = "'{}'".format(three)
        if single != 'NULL':
            single = "'{}'".format(single)
        lines.append("    ('{name}', '{desc}', {three}, {single}),".format(
                     name=name, desc=desc, three=three, single=single))
    lines[-1] = lines[-1][:-1] + ';'

    return '\n'.join(lines)


def parse_monomers(filename):
    """Parse the monomers file."""
    with open(filename, 'rt') as handle:
        line = handle.readline().strip()
        while line:
            if line.startswith('#'):
                line = handle.readline().strip()
                continue

            elements = line.split('\t')
            # Handle lines that don't have a 3- or 1-letter code
            while len(elements) < 4:
                elements.append('NULL')
            yield elements

            line = handle.readline().strip()


if __name__ == "__main__":
    main()

