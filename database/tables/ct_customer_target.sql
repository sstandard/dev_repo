-- filepath: c:\git\oracle_repo\database\tables\ct_customer_target.sql
-- Author: Oracle Development Team
-- Summary: Stores the final curated customer dimension data after ETL validation
--          and transformation.
-- Purpose: Maintains a trusted, deduplicated customer record set for downstream
--          reporting and operational use.
--
-- History:
-- 2026-11-02 - Initial creation for the target customer table.
--
-- Change Log:
-- 2026-11-02 - Added identity primary key, source customer uniqueness, and
--              audit timestamps for target customer records.

CREATE TABLE customer_target (
    customer_id         NUMBER GENERATED ALWAYS AS IDENTITY,
    source_customer_id  NUMBER NOT NULL,
    first_name          VARCHAR2(100),
    surname             VARCHAR2(100),
    date_of_birth       DATE,
    email_address       VARCHAR2(200),
    created_date        TIMESTAMP WITH TIME ZONE,
    updated_date        TIMESTAMP WITH TIME ZONE,
    batch_id            NUMBER,

    CONSTRAINT pk_customer_target
        PRIMARY KEY (customer_id),

    CONSTRAINT uk_customer_source
        UNIQUE (source_customer_id)
);