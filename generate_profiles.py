#!/usr/bin/env python3
"""Convert the hmmdetails.txt file into an SQL table."""
import argparse
import sys

HEADER = """\
CREATE TABLE antismash.profiles (
    name	text NOT NULL,
    description	text,
    cutoff	int4,
    filename	text,
    CONSTRAINT profiles_pkey PRIMARY KEY (name)
);

COMMENT ON TABLE antismash.profiles IS
  'HMM profiles used during cluster detection';

INSERT INTO antismash.profiles (name, description, cutoff, filename)
VALUES"""


def main():
    """Run the conversion."""
    parser = argparse.ArgumentParser()
    parser.add_argument('hmmdetails', help="hmmdetails.txt file to load")
    args = parser.parse_args()

    print(HEADER)
    print(generate_sql_values(args.hmmdetails))


def generate_sql_values(filename):
    """Generate SQL VALUES lines to insert into the database."""
    lines = []
    for name, desc, cutoff, fname in parse_hmmdetails(filename):
        lines.append("    ('{name}', '{desc}', {cutoff}, '{filename}'),".format(
                     name=name, desc=desc, cutoff=cutoff, filename=fname))
    lines[-1] = lines[-1][:-1] + ';'

    return '\n'.join(lines)


def parse_hmmdetails(filename):
    """Parse the hmmdetails.txt file."""
    with open(filename, 'rt') as handle:
        line = handle.readline().strip()
        while line:
            yield line.split('\t')
            line = handle.readline().strip()


if __name__ == "__main__":
    main()

