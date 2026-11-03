-- filepath: c:\git\oracle_repo\database\tables\ct_etl_row_error.sql
-- Author: Oracle Development Team
-- Summary: Stores row-level ETL validation and processing failures for audit,
--          investigation, and remediation workflows.
-- Purpose: Captures detailed error information at the record level so ETL
--          issues can be tracked, corrected, and reported accurately.
--
-- This allows a single customer record to have multiple validation errors.

-- For example:

-- Staging ID	Rule	     Error
-- 101	        SURNAME_REQ	 Missing surname
-- 101	        DOB_REQ	     Missing DOB
-- 102	        EMAIL_REGEX	 Invalid email
-- 103	        DOB_FUTURE	 DOB is in future
--
-- History:
-- 2026-11-02 - Initial creation for row-level ETL error tracking.
--
-- Change Log:
-- 2026-11-02 - Added error logging table for batch and row validation failures
--              with source context and diagnostic fields.

CREATE TABLE etl_row_error (
    error_id        NUMBER GENERATED ALWAYS AS IDENTITY,
    batch_id        NUMBER NOT NULL,
    staging_id      NUMBER NOT NULL,
    rule_code       VARCHAR2(30),
    error_message   VARCHAR2(500),
    created_date    TIMESTAMP WITH TIME ZONE
                    DEFAULT SYSTIMESTAMP,

    CONSTRAINT pk_etl_row_error
        PRIMARY KEY (error_id),

    CONSTRAINT fk_error_batch
        FOREIGN KEY (batch_id)
        REFERENCES etl_batch_control(batch_id),

    CONSTRAINT fk_error_staging
        FOREIGN KEY (staging_id)
        REFERENCES customer_staging(staging_id),

    CONSTRAINT uk_staging_rule
        UNIQUE (staging_id, rule_code)
);