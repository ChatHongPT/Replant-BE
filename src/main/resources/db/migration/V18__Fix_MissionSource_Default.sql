-- V18: Fix mission_source column - remove DEFAULT value
-- mission_source should be explicitly set by the application (OFFICIAL or CUSTOM)

ALTER TABLE mission MODIFY COLUMN mission_source VARCHAR(20) NOT NULL;
