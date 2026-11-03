-- Summary
-- Contains utility procedures and functions for managing job tracking data,
-- including validation logic for salary ranges and other job attributes.


-- Changed By History
-- Record the person or process responsible for each change below.
-- Date         | Changed by | Description
-- 01/09/2026   | Steve S    | Initial creation of job tracker package with salary validation function.

CREATE OR REPLACE PACKAGE job_tracker_pkg AS

    FUNCTION validate_salary (
        p_salary_min IN NUMBER,
        p_salary_max IN NUMBER
    ) RETURN BOOLEAN;

FUNCTION validate_dates (
        p_date_found   IN DATE,
        p_closing_date IN DATE
    ) RETURN BOOLEAN;

FUNCTION validate_application_date (
        p_date_found   IN DATE,
        p_date_applied IN DATE
    ) RETURN BOOLEAN;

PROCEDURE update_job_status (
    p_job_id     IN NUMBER,
    p_status_id  IN NUMBER
);

FUNCTION validate_status_change (
    p_current_status_id IN NUMBER,
    p_new_status_id     IN NUMBER
) RETURN BOOLEAN;


END job_tracker_pkg;