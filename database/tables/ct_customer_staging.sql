-- filepath: c:\git\oracle_repo\database\tables\ct_customer_staging.sql
-- Author: Oracle Development Team
-- Summary: Holds incoming customer records awaiting validation, transformation,
--          and final load into the target customer tables.
-- Purpose: Supports ETL processing by retaining source customer data with
--          batch association and load status tracking.
--
-- History:
-- 2026-11-02 - Initial creation for staging customer data during ETL processing.
--
-- Change Log:
-- 2026-11-02 - Added staging table with identity key, batch foreign key,
--              and load status tracking for inbound customer records.

CREATE TABLE customer_staging (
    staging_id          NUMBER GENERATED ALWAYS AS IDENTITY,
    batch_id            NUMBER NOT NULL,
    source_customer_id  NUMBER,
    first_name          VARCHAR2(100),
    surname             VARCHAR2(100),
    date_of_birth       DATE,
    email_address       VARCHAR2(200),
    source_updated      TIMESTAMP WITH TIME ZONE,
    load_status         VARCHAR2(20) DEFAULT 'RECEIVED',

    CONSTRAINT pk_customer_staging
        PRIMARY KEY (staging_id),

    CONSTRAINT fk_staging_batch
        FOREIGN KEY (batch_id)
        REFERENCES etl_batch_control(batch_id)
);