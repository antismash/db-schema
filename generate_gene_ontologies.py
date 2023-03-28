#!/usr/bin/env python3
"""Generate gene_ontologies.sql"""

import sys

ENTRY_TABLE = """
CREATE TABLE antismash.gene_ontologies (
    go_id serial NOT NULL PRIMARY KEY,
    identifier text NOT NULL UNIQUE,
    description text NOT NULL
);"""

INSERT = """
INSERT INTO antismash.gene_ontologies (identifier, description)
VALUES
    %s;"""

results: dict[str, str] = {}

if len(sys.argv) < 2:
    print(f"Usage: {sys.argv[0]} path/to/antismash/pfam2go/data/file/pfam2go.txt")
    sys.exit(2)

with open(sys.argv[1], "r", encoding="utf-8") as pfam_map:
    for line in pfam_map:
        if line.startswith("!"):
            continue
        description, go_id = line.split(" > ")[1].strip().split(" ; ")
        description = description.replace("GO:", "").replace("'", "''")
        results[go_id] = description

print(ENTRY_TABLE)
print(INSERT % ",\n    ".join(
    sorted(f"('{go_id}', '{description}')" for go_id, description in results.items())))
