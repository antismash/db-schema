#!/usr/bin/env python

from __future__ import print_function

from collections import defaultdict
import sys

entry_table = """
CREATE TABLE antismash.gene_ontologies (
    go_id serial NOT NULL PRIMARY KEY,
    identifier text NOT NULL UNIQUE,
    description text NOT NULL
);"""

insert = """
INSERT INTO antismash.gene_ontologies (identifier, description)
VALUES
    %s;"""

results = {}
with open(sys.argv[1]) as pfam_map:
    for line in pfam_map:
        if line.startswith("!"):
            continue
        description, go_id = line.split(" > ")[1].strip().split(" ; ")
        description = description.replace("GO:", "").replace("'", "''")
        results[go_id] = description

print(entry_table)
print(insert % ",\n    ".join(sorted("('%s', '%s')" % pair for pair in results.items())))

