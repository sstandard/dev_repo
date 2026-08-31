-- Summary
-- Populates the lookup tables used by the jobs application with initial values
-- for job statuses, contract types, and working types.


-- Changed By History
-- Record the person or process responsible for each change below.
-- Date         | Changed by | Description
-- 27/08/2026   | Steve S    | Initial creation of lookup data for job statuses, contract types, and working types.

-- Delete from the lookup tables to ensure a clean slate before inserting new data
DELETE FROM job_status;
DELETE FROM job_contract_type;
DELETE FROM job_working_type;

-- Job Statuses
INSERT INTO job_status (status_name, display_order)
VALUES ('Found', 1);

INSERT INTO job_status (status_name, display_order)
VALUES ('Considering', 2);

INSERT INTO job_status (status_name, display_order)
VALUES ('Applied', 3);

INSERT INTO job_status (status_name, display_order)
VALUES ('Interview', 4);

INSERT INTO job_status (status_name, display_order)
VALUES ('Offer', 5);

INSERT INTO job_status (status_name, display_order)
VALUES ('Rejected', 6);

INSERT INTO job_status (status_name, display_order)
VALUES ('Withdrawn', 7);

-- Contract Types
INSERT INTO job_contract_type (contract_type)
VALUES ('Permanent');

INSERT INTO job_contract_type (contract_type)
VALUES ('FTC');

INSERT INTO job_contract_type (contract_type)
VALUES ('Contract');

INSERT INTO job_contract_type (contract_type)
VALUES ('Temporary');

-- Working Types
INSERT INTO job_working_type (working_type)
VALUES ('Office');

INSERT INTO job_working_type (working_type)
VALUES ('Hybrid');

INSERT INTO job_working_type (working_type)
VALUES ('Remote');
