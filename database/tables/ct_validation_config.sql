-- filepath: c:\git\oracle_repo\database\tables\ct_validation_config.sql
-- Author: Oracle Development Team
-- Summary: Defines validation rules used to assess incoming data quality and
--          data integrity conditions during ETL processing.
-- Purpose: Centralizes reusable business validation logic for fields such as
--          required values, regex checks, minimum length, and date constraints.
--
-- History:
-- 2026-11-02 - Initial creation for validation rule configuration.
--
-- Change Log:
-- 2026-11-02 - Added identity key, validation metadata, and constraint checks
--              for supported rule types and enabled status.

CREATE TABLE validation_config (
    rule_id          NUMBER GENERATED ALWAYS AS IDENTITY,
    rule_code        VARCHAR2(30) NOT NULL,
    column_name      VARCHAR2(50) NOT NULL,
    rule_type        VARCHAR2(30) NOT NULL,
    rule_value       VARCHAR2(4000),
    error_message    VARCHAR2(500),
    rule_order       NUMBER,
    enabled          CHAR(1) DEFAULT 'Y',

    CONSTRAINT pk_validation_config
        PRIMARY KEY (rule_id),

    CONSTRAINT uk_validation_code
        UNIQUE (rule_code),

    CONSTRAINT chk_validation_enabled
        CHECK (enabled IN ('Y','N')),

    CONSTRAINT chk_validation_type
        CHECK (rule_type IN
        ('REQUIRED','REGEX','MIN_LENGTH','NOT_FUTURE'))
);