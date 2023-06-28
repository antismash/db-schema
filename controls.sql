CREATE TABLE IF NOT EXISTS asdb_jobs.controls (
  name TEXT PRIMARY KEY,
  status TEXT NOT NULL,
  stop_scheduled BOOLEAN NOT NULL,
  version TEXT NOT NULL
);

COMMENT ON TABLE asdb_jobs.controls IS
  'Give control signals to ASDB background job runners';
