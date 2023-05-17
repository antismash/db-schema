#!/usr/bin/env python3
"""Create an SQL table from the HMM database metadata."""
import argparse

HAS_VERSIONS = {
    "pfam": True,
    "tigrfam": False,
}

VERSION = """,
    version	int4
"""
HEADER = """\
CREATE TABLE antismash.{family}s (
    {family}_id	text PRIMARY KEY,
    name	text,
    description	text,
    trusted_cutoff	float8{version}
);

COMMENT ON TABLE antismash.{family}s IS
  '{family} domain metadata.';

INSERT INTO antismash.{family}s ({family}_id, name, description, trusted_cutoff{version_key})
VALUES"""


class Entry:
    """Representation of a DB family entry"""
    def __init__(self, fam_id=None, name=None, description=None, cutoff=None, version=None,
                 include_version: bool = True):
        self.id = fam_id
        self.name = name
        self.description = description
        self.cutoff = cutoff
        self.version = version
        self._include_version = include_version

    def sql(self):
        """Get the SQL values line corresponding to this Entry."""
        assert self.id is not None
        version_line = f", {Entry.num_or_null(self.version)}" if self._include_version else ""
        return (f"({Entry.str_or_null(self.id)}, "
                f"{Entry.str_or_null(self.name)}, "
                f"{Entry.str_or_null(self.description)}, "
                f"{Entry.num_or_null(self.cutoff)}"
                f"{version_line})")

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
    parser.add_argument('family', choices=list(HAS_VERSIONS), help="Which family to process as")
    parser.add_argument('hmm', help="HMM file to use")
    args = parser.parse_args()

    has_version = HAS_VERSIONS[args.family.lower()]

    print(HEADER.format(family=args.family, version=VERSION if has_version else "",
                        version_key= ", version" if has_version else ""))
    print(generate_sql_values(args.hmm, include_version=has_version))


def generate_sql_values(filename: str, include_version: bool = True):
    """Generate SQL VALUES lines to insert into the database."""
    lines = []
    for entry in parse_entries(filename, include_version=include_version):
        lines.append(f"    {entry.sql()},")
    lines[-1] = lines[-1][:-1] + ';'

    return '\n'.join(lines)


def parse_entries(filename, include_version: bool = True):
    """Parse the hmm file."""
    with open(filename, 'r', encoding="utf-8") as handle:
        line = handle.readline().strip()
        fam_id = None
        name = None
        description = None
        cutoff = None
        version = None

        while line:
            if line.startswith('NAME'):
                name = line.split()[-1].strip()
            elif line.startswith('ACC'):
                acc_ver = line.split()[-1].strip()
                if "." in acc_ver:
                    fam_id, version = acc_ver.split('.')
                else:
                    fam_id = acc_ver
            elif line.startswith('DESC'):
                description = ' '.join(line.strip().split()[1:])
            elif line.startswith('TC'):
                cutoff = line.split()[1].strip()
            elif line.startswith('//'):
                yield Entry(fam_id, name, description, cutoff, version, include_version=include_version)
                fam_id = None
                name = None
                description = None
                cutoff = None
                version = None

            line = handle.readline().strip()


if __name__ == "__main__":
    main()
