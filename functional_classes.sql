CREATE TABLE IF NOT EXISTS antismash.functional_classes (
    functional_class_id	serial NOT NULL,
    name	text,
    parent_id	int4,
    CONSTRAINT functional_classes_pkey PRIMARY KEY (functional_class_id),
    CONSTRAINT functional_classes_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES antismash.functional_classes (functional_class_id)
);
COMMENT ON TABLE antismash.functional_classes IS
  'An index of possible functional classes';

--- Basic functional classes
INSERT INTO antismash.functional_classes (name, parent_id)
SELECT val.name, val.parent_id::int4
FROM (
    VALUES
        ('biosynthetic', NULL),
        ('regulator', NULL),
        ('transporter', NULL),
        ('other', NULL)
    ) val ( name, parent_id )
    ON CONFLICT DO NOTHING;


--- Advanced classes
INSERT INTO antismash.functional_classes (name, parent_id)
SELECT val.name, f.functional_class_id
FROM (
    VALUES
        ('bgc_seed', 'biosynthetic'),
        ('biosynthetic_smcog', 'biosynthetic')
    ) val ( name, parent_name )
LEFT JOIN antismash.functional_classes f ON val.parent_name = f.name
ON CONFLICT DO NOTHING;


--- Advanced classes based on EC groups
INSERT INTO antismash.functional_classes (name, parent_id)
SELECT val.name, f.functional_class_id
FROM (
    VALUES
        ('oxidoreductases', 'biosynthetic'),
        ('transferases', 'biosynthetic'),
        ('hydrolases', 'biosynthetic'),
        ('lyases', 'biosynthetic'),
        ('isomerases', 'biosynthetic'),
        ('ligases', 'biosynthetic'),
        ('translocases', 'biosynthetic')
    ) val ( name, parent_name )
LEFT JOIN antismash.functional_classes f ON val.parent_name = f.name
ON CONFLICT DO NOTHING;


--- Subfunctions based on EC groups
INSERT INTO antismash.functional_classes (name, parent_id)
SELECT val.name, f.functional_class_id
FROM (
    VALUES
        ('pptase', 'transferases'),
        ('acetyltransferase', 'transferases'),
        ('acylase', 'transferases'),
        ('acyltransferase', 'transferases'),
        ('aminotransferase', 'transferases'),
        ('carbamoyltransferase', 'transferases'),
        ('carboxylase', 'transferases'),
        ('formyltransferase', 'transferases'),
        ('glycosyltransferase', 'transferases'),
        ('halogenase', 'transferases'),
        ('kinase', 'transferases'),
        ('methyltransferase', 'transferases'),
        ('phosphorylase', 'transferases'),
        ('phosphotransferase', 'transferases'),
        ('sulfhydrylase', 'transferases'),
        ('sulfotransferase', 'transferases'),
        ('transferase', 'transferases'),
        ('transketolase', 'transferases'),
        ('cyclase', 'lyases'),
        ('decarboxylase', 'lyases'),
        ('dehydratase', 'lyases'),
        ('hydratase', 'lyases'),
        ('lyase', 'lyases'),
        ('dehydrogenase', 'oxidoreductases'),
        ('electron transfer', 'oxidoreductases'),
        ('oxidase', 'oxidoreductases'),
        ('oxidoreductase', 'oxidoreductases'),
        ('oxygenase', 'oxidoreductases'),
        ('phosphate reductase', 'oxidoreductases'),
        ('reductase', 'oxidoreductases'),
        ('ligase', 'ligases'),
        ('synthase', 'ligases'),
        ('synthetase', 'ligases'),
        ('amidase', 'hydrolases'),
        ('back_translocase', 'hydrolases'),
        ('deacetylase', 'hydrolases'),
        ('deaminase', 'hydrolases'),
        ('deformylase', 'hydrolases'),
        ('dehalogenase', 'hydrolases'),
        ('esterase', 'hydrolases'),
        ('glucanase', 'hydrolases'),
        ('glucosidase', 'hydrolases'),
        ('hydrolase', 'hydrolases'),
        ('peptidase', 'hydrolases'),
        ('phosphatase', 'hydrolases'),
        ('protease', 'hydrolases'),
        ('isomerase', 'isomerases'),
        ('mutase', 'isomerases'),
        ('racemase', 'isomerases'),
        ('permease', 'translocases'),
        ('transporter', 'translocases')
    ) val ( name, parent_name )
LEFT JOIN antismash.functional_classes f ON val.parent_name = f.name
ON CONFLICT DO NOTHING;
