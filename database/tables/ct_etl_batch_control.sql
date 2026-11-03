-- filepath: c:\git\oracle_repo\database\tables\ct_etl_batch_control.sql
-- Author: Oracle Development Team
-- Summary: Tracks each ETL batch execution lifecycle, including status,
--          timestamps, row counts, and failure diagnostics.
-- Purpose: Provides operational visibility into ETL job runs and supports
--          monitoring, retry analysis, and audit reporting.
--
-- History:
-- 2026-11-02 - Initial creation for ETL batch monitoring and control.
--
-- Change Log:
-- 2026-11-02 - Added batch tracking table with automatic surrogate key,
--              batch status validation, and operational metrics columns.

CREATE TABLE etl_batch_control (
	batch_id              NUMBER GENERATED ALWAYS AS IDENTITY,
	process_name          VARCHAR2(100) NOT NULL,
	batch_status          VARCHAR2(20) DEFAULT 'NEW',
	start_date            TIMESTAMP WITH TIME ZONE,
	end_date              TIMESTAMP WITH TIME ZONE,
	records_received      NUMBER DEFAULT 0,
	records_valid         NUMBER DEFAULT 0,
	records_rejected      NUMBER DEFAULT 0,
	records_inserted      NUMBER DEFAULT 0,
	records_updated       NUMBER DEFAULT 0,
	error_code            NUMBER,
	error_message         VARCHAR2(4000),
	error_backtrace       VARCHAR2(4000),

	CONSTRAINT pk_etl_batch
		PRIMARY KEY (batch_id),

	CONSTRAINT chk_batch_status
		CHECK (batch_status IN
		('NEW','RUNNING','COMPLETED','FAILED'))
);
