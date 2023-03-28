#!/usr/bin/env python3
"""Create an SQL table from the PFAM database metadata."""
import argparse

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
    """Representation of a Pfam DB entry"""
    def __init__(self, pfam_id=None, name=None, description=None, cutoff=None, version=None):
        self.pfam_id = pfam_id
        self.name = name
        self.description = description
        self.cutoff = cutoff
        self.version = version

    def sql(self):
        """Get the SQL values line corresponding to this PfamEntry."""
        assert self.pfam_id is not None
        return (f"({PfamEntry.str_or_null(self.pfam_id)}, "
                f"{PfamEntry.str_or_null(self.name)}, "
                f"{PfamEntry.str_or_null(self.description)}, "
                f"{PfamEntry.num_or_null(self.cutoff)}, "
                f"{PfamEntry.num_or_null(self.version)})")

    @staticmethod
    def str_or_null(value):
        """Get a stringified version of the value or NULL if the value is None."""
        if value is None:
            return "NULL"

        ret = value.replace("'", "''")
        return f"'{ret}'"

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
        lines.append(f"    {entry.sql()},")
    lines[-1] = lines[-1][:-1] + ';'

    return '\n'.join(lines)


def parse_pfam_entries(filename):
    """Parse the Pfam-A.hmm file."""
    with open(filename, 'r', encoding="utf-8") as handle:
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
