CREATE TABLE antismash.functional_classes (
    functional_class_id	serial NOT NULL,
    name	text,
    parent	int4,
    CONSTRAINT functional_classes_pkey PRIMARY KEY (functional_class_id),
    CONSTRAINT functional_classes_parent_fkey FOREIGN KEY (parent) REFERENCES antismash.functional_classes (functional_class_id)
);
COMMENT ON TABLE antismash.functional_classes IS
  'An index of possible functional classes';

--- Basic functional classes
INSERT INTO antismash.functional_classes (name, parent)
SELECT val.name, val.parent::int4
FROM (
    VALUES
        ('biosynthetic', NULL),
        ('regulator', NULL),
        ('transporter', NULL),
        ('other', NULL)
    ) val ( name, parent );


--- Advanced classes
INSERT INTO antismash.functional_classes (name, parent)
SELECT val.name, f.functional_class_id
FROM (
    VALUES
        ('bgc_seed', 'biosynthetic'),
        ('smcog_derived', 'biosynthetic')
    ) val ( name, parent_name )
LEFT JOIN antismash.functional_classes f ON val.parent_name = f.name;
