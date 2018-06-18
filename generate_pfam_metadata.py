#!/usr/bin/env python3
"""Create an SQL table from the PFAM database metadata."""
import argparse
import sys

HEADER = """\
CREATE TABLE antismash.pfams (
    pfam_id	text NOT NULL,
    name	text,
    description	text,
    trusted_cutoff	float8,
    version	int4,
    CONSTRAINT pfams_pkey PRIMARY KEY (pfam_id)
);

COMMENT ON TABLE antismash.pfams IS
  'PFAM domain metadata.';

INSERT INTO antismash.pfams (pfam_id, name, description, trusted_cutoff, version)
VALUES"""


class PfamEntry:
    def __init__(self, pfam_id=None, name=None, description=None, cutoff=None, version=None):
        self.pfam_id = pfam_id
        self.name = name
        self.description = description
        self.cutoff = cutoff
        self.version = version

    def sql(self):
        """Get the SQL values line corresponding to this PfamEntry."""
        assert self.pfam_id is not None
        return "({pfam_id}, {name}, {description}, {cutoff}, {version})".format(
            pfam_id=PfamEntry.str_or_null(self.pfam_id),
            name=PfamEntry.str_or_null(self.name),
            description=PfamEntry.str_or_null(self.description),
            cutoff=PfamEntry.num_or_null(self.cutoff),
            version=PfamEntry.num_or_null(self.version))

    @staticmethod
    def str_or_null(value):
        """Get a stringified version of the value or NULL if the value is None."""
        if value is None:
            return "NULL"

        return "'{}'".format(value.replace("'", "''"))

    @staticmethod
    def num_or_null(value):
        """Get the number version of the value or NULL if the value is None."""
        if value is None:
            return "NULL"

        return value

def main():
    """Run the conversion."""
    parser = argparse.ArgumentParser()
    parser.add_argument('pfam', help="Pfam-A.hmm file to load")
    args = parser.parse_args()

    print(HEADER)
    print(generate_sql_values(args.pfam))


def generate_sql_values(filename):
    """Generate SQL VALUES lines to insert into the database."""
    lines = []
    for entry in parse_pfam_entries(filename):
        lines.append("    {},".format(entry.sql()))
    lines[-1] = lines[-1][:-1] + ';'

    return '\n'.join(lines)


def parse_pfam_entries(filename):
    """Parse the Pfam-A.hmm file."""
    with open(filename, 'rt') as handle:
        line = handle.readline().strip()
        pfam_id = None
        name = None
        description = None
        cutoff = None
        version = None

        while line:
            if line.startswith('NAME'):
                name = line.split()[-1].strip()
            elif line.startswith('ACC'):
                acc_ver = line.split()[-1].strip()
                pfam_id, version = acc_ver.split('.')
            elif line.startswith('DESC'):
                description = ' '.join(line.strip().split()[1:])
            elif line.startswith('TC'):
                cutoff = line.split()[1].strip()
            elif line.startswith('//'):
                yield PfamEntry(pfam_id, name, description, cutoff, version)
                pfam_id = None
                name = None
                description = None
                cutoff = None
                version = None

            line = handle.readline().strip()


if __name__ == "__main__":
    main()

