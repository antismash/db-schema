COPY antismash.monomers (monomer_id, substrate_id, name, description) FROM stdin;
1	275	x	unknown amino acid
2	231	ile	isoleucine
3	246	orn	ornithine
4	277	val	valine
5	275	d-x	modified unknown amino acid
6	216	glu	glutamic acid
7	216	d-glu	modified glutamic acid
8	277	d-val	modified valine
9	235	leu	leucine
10	274	tyr	tyrosine
11	20	aad	2-aminoadipic acid
12	276	pk	unknown ketide
13	239	mal	malonyl-CoA
14	259	pro	proline
15	177	ala	alanine
16	274	d-tyr	modified tyrosine
33	273	trp	tryptophan
34	239	redmal	modified malonyl-CoA
35	177	d-ala	modified alanine
36	251	phe	phenylalanine
37	235	d-leu	modified leucine
38	271	thr	threonine
41	259	d-pro	modified proline
42	182	arg	arginine
43	218	gly	glycine
44	182	d-arg	modified arginine
45	254	hpr	pipecolic acid
46	239	ohmal	modified malonyl-CoA
55	202	cys	cysteine
56	273	d-trp	modified tryptophan
57	217	gln	glutamine
58	153	ac-oh-orn	N5-acetyl-N5-hydroxyornithine
64	189	bala	beta-alanine
66	232	ival	isovaline
67	268	ser	serine
68	184	asp	aspartic acid
72	183	asn	asparagine
74	237	lys	lysine
75	21	abu	2-aminobutyric acid
76	271	d-thr	modified threonine
80	202	d-cys	modified cysteine
81	268	d-ser	modified serine
83	231	d-ile	modified isoleucine
87	155	d-fo-oh-orn	modified N5-formyl-N5-hydroxyornithine
88	156	oh-orn	N5-hydroxyornithine
89	14	dab	2,4-diaminobutyric acid
90	239	ccmal	modified malonyl-CoA
91	251	d-phe	modified phenylalanine
92	218	d-gly	modified glycine
93	183	d-asn	modified asparagine
94	246	d-orn	modified ornithine
97	214	redemal	modified ethylmalonyl-CoA
99	184	d-asp	modified aspartic acid
100	156	d-oh-orn	modified N5-hydroxyornithine
103	193	d-boh-tyr	modified beta-hydroxytyrosine
104	237	d-lys	modified lysine
105	242	mxmal	methoxymalonyl-CoA
107	12	dioh-bz	2,3-dihydroxybenzoic acid
108	222	his	histidine
109	14	d-dab	modified 2,4-diaminobutyric acid
110	155	fo-oh-orn	N5-formyl-N5-hydroxyornithine
111	193	boh-tyr	beta-hydroxytyrosine
112	217	d-gln	modified glutamine
113	242	ccmxmal	modified methoxymalonyl-CoA
114	109	hpg	4-hydroxyphenylglycine
115	109	d-hpg	modified 4-hydroxyphenylglycine
116	180	athr	allo-threonine
117	241	met	methionine
119	239	d-mal	modified malonyl-CoA
120	222	d-his	modified histidine
123	239	d-ohmal	modified malonyl-CoA
125	239	d-ccmal	modified malonyl-CoA
126	254	d-hpr	modified pipecolic acid
127	214	ccemal	modified ethylmalonyl-CoA
128	34	d-hiv	2R-hydroxyisovaleric acid
129	48	dhpg	3,5-dihydroxyphenylglycine
131	21	d-abu	modified 2-aminobutyric acid
132	179	aile	allo-isoleucine
133	197	cap	capreomycidine
136	243	me-ccmal	modified methylmalonyl-CoA
137	243	me-mal	modified methylmalonyl-CoA
138	243	me-ohmal	modified methylmalonyl-CoA
141	243	me-redmal	modified methylmalonyl-CoA
142	214	emal	ethylmalonyl-CoA
143	242	ohmxmal	modified methoxymalonyl-CoA
144	242	redmxmal	modified methoxymalonyl-CoA
145	48	d-dhpg	modified 3,5-dihydroxyphenylglycine
146	214	ohemal	modified ethylmalonyl-CoA
147	180	d-athr	modified allo-threonine
148	194	blys	beta-lysine
149	189	d-bala	modified beta-alanine
150	153	d-ac-oh-orn	modified N5-acetyl-N5-hydroxyornithine
151	278	valol	valinol
152	114	bmt	4R-E-butenyl-4R-methylthreonine
153	276	d-pk	modified unknown ketide
\.

SELECT pg_catalog.setval('antismash.monomers_monomer_id_seq', 153, true);
