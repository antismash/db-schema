#!/usr/bin/env python3
"""Convert the hmmdetails.txt file into an SQL table."""
import argparse
import glob
import os

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
    parser.add_argument("dynamic_profile_dir", help="directory containing dynamic profiles")
    args = parser.parse_args()

    lines = []
    lines.extend(generate_sql_values(args.hmmdetails))
    lines.extend(convert_dynamic_profiles(args.dynamic_profile_dir))

    print(HEADER)
    print(",\n".join(lines), end="")
    print(";")


def build_value(name, description, cutoff, filename):
    return f"    ('{name}', '{description}', {cutoff}, '{filename}')"


def generate_sql_values(filename) -> list[str]:
    """Generate SQL VALUES lines to insert into the database."""
    lines = []
    for profile in parse_hmmdetails(filename):
        yield build_value(*profile)


def parse_hmmdetails(filename):
    """Parse the hmmdetails.txt file."""
    with open(filename, 'r', encoding="utf-8") as handle:
        line = handle.readline().strip()
        while line:
            yield line.split('\t')
            line = handle.readline().strip()


def convert_dynamic_profiles(directory):
    for filename in glob.glob(os.path.join(directory, "*.py")):
        if filename.endswith("__init__.py"):
            continue
        name = None
        description = None
        with open(filename, "r", encoding="utf-8") as handle:
            lines = [line.strip() for line in handle if line.startswith("PROFILE")]
        for line in lines:
            if line.startswith("PROFILE_NAME"):
                name = line.split("=")[-1].strip().strip('"')
            elif line.startswith("PROFILE_DESCRIPTION"):
                description = line.split("=")[-1].strip().strip('"')
            else:
                raise ValueError(f"Unhandled line type in {filename}: {line}")

        if name is None or description is None:
            raise ValueError(f"Unhandled file {filename}")
        yield build_value(name, description, "NULL", os.path.basename(filename))


if __name__ == "__main__":
    main()
