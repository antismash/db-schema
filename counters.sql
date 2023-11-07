CREATE TABLE IF NOT EXISTS asdb_jobs.counters (
    name TEXT PRIMARY KEY,
    value BIGINT NOT NULL DEFAULT 0 CHECK (value >= 0)
);

COMMENT ON TABLE asdb_jobs.counters IS 'Statistics on antiSMASH DB jobs';

INSERT INTO asdb_jobs.counters (name) VALUES ('total_jobs');
