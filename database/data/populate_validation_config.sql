-- filepath: c:\git\oracle_repo\database\data\populate_validate_config.sql
-- Author: Oracle Development Team
-- Summary: Seeds the validation rules used to check inbound customer data before
--          it is accepted into the target data model.
-- Purpose: Provides the default rule set for required-field, date, and regex
--          validation checks during ETL processing.
--
-- History:
-- 2026-11-03 - Initial creation of validation rules for customer data quality checks.
--
-- Change Log:
-- 2026-11-03 - Added required-field, future-date, and email-format validation rules.

INSERT INTO validation_config
(rule_code, column_name, rule_type,
 rule_value, error_message, rule_order)
VALUES
('CUSTOMER_ID_REQ', 'SOURCE_CUSTOMER_ID',
 'REQUIRED', NULL,
 'Customer ID is mandatory', 1);

INSERT INTO validation_config
(rule_code, column_name, rule_type,
 rule_value, error_message, rule_order)
VALUES
('FIRST_NAME_REQ', 'FIRST_NAME',
 'REQUIRED', NULL,
 'First name is mandatory', 2);

INSERT INTO validation_config
(rule_code, column_name, rule_type,
 rule_value, error_message, rule_order)
VALUES
('SURNAME_REQ', 'SURNAME',
 'REQUIRED', NULL,
 'Surname is mandatory', 3);

INSERT INTO validation_config
(rule_code, column_name, rule_type,
 rule_value, error_message, rule_order)
VALUES
('DOB_REQ', 'DATE_OF_BIRTH',
 'REQUIRED', NULL,
 'Date of birth is mandatory', 4);

INSERT INTO validation_config
(rule_code, column_name, rule_type,
 rule_value, error_message, rule_order)
VALUES
('DOB_FUTURE', 'DATE_OF_BIRTH',
 'NOT_FUTURE', NULL,
 'Date of birth cannot be in the future', 5);

INSERT INTO validation_config
(rule_code, column_name, rule_type,
 rule_value, error_message, rule_order)
VALUES
('EMAIL_REGEX', 'EMAIL_ADDRESS',
 'REGEX',
 '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
 'Invalid email address', 6);

COMMIT;