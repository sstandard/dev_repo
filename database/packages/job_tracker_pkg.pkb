-- Summary
-- Implementation of the job tracker package containing utility procedures and functions
-- for managing job tracking data, including validation logic for salary ranges and other job attributes.


-- Changed By History
-- Record the person or process responsible for each change below.
-- Date         | Changed by | Description
-- 01/09/2026   | Steve S    | Initial implementation of job tracker package body with salary validation.

CREATE OR REPLACE PACKAGE BODY job_tracker_pkg AS

    FUNCTION validate_salary (
        p_salary_min IN NUMBER,
        p_salary_max IN NUMBER
    ) RETURN BOOLEAN
    IS
    BEGIN

        IF p_salary_min IS NOT NULL
           AND p_salary_max IS NOT NULL
           AND p_salary_min > p_salary_max
        THEN
            RETURN FALSE;
        END IF;

        RETURN TRUE;

    END validate_salary;

FUNCTION validate_dates (
        p_date_found   IN DATE,
        p_closing_date IN DATE
    ) RETURN BOOLEAN
    IS
    BEGIN

        IF p_date_found IS NOT NULL
           AND p_closing_date IS NOT NULL
           AND p_closing_date < p_date_found
        THEN
            RETURN FALSE;
        END IF;

        RETURN TRUE;

    END validate_dates;

FUNCTION validate_application_date (
    p_date_found     IN DATE,
    p_date_applied   IN DATE
) RETURN BOOLEAN
IS
BEGIN

    IF p_date_found IS NOT NULL
       AND p_date_applied IS NOT NULL
       AND p_date_applied < p_date_found
    THEN
        RETURN FALSE;
    END IF;

    RETURN TRUE;

END validate_application_date;

PROCEDURE update_job_status (
    p_job_id    IN NUMBER,
    p_status_id IN NUMBER
)
IS
BEGIN

    UPDATE jobs
       SET status_id = p_status_id
     WHERE job_id = p_job_id;

END update_job_status;

END job_tracker_pkg;