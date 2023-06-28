CREATE TABLE IF NOT EXISTS asdb_jobs.jobs (
  id TEXT PRIMARY KEY,
  jobtype TEXT NOT NULL,
  status TEXT NOT NULL,
  runner TEXT,
  data JSONB NOT NULL,
  results JSONB NOT NULL,
  version INT NOT NULL
);

COMMENT ON TABLE asdb_jobs.jobs IS
  'Background jobs for ASDB';
