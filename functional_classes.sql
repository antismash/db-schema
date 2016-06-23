CREATE TABLE antismash.functional_classes (
    functional_class_id	serial NOT NULL,
    name	text,
    parent	int4,
    CONSTRAINT functional_classes_pkey PRIMARY KEY (functional_class_id),
    CONSTRAINT functional_classes_parent_fkey FOREIGN KEY (parent) REFERENCES antismash.functional_classes (functional_class_id)
);
COMMENT ON TABLE antismash.functional_classes IS
  'An index of possible functional classes';
