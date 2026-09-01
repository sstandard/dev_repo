-- Summary
    -- Populates the jobs table with initial job data.


-- Changed By History
-- Record the person or process responsible for each change below.
-- Date         | Changed by | Description
-- 27/08/2026   | Steve S    | Initial creation of job data

INSERT INTO jobs (
    job_title,
    company_name,
    location,
    salary_min,
    salary_max,
    contract_type_id,
    working_type_id,
    status_id,
    date_found,
    date_applied,
    notes
)
VALUES (
    'Oracle / Database Developer',
    'Leeds Building Society',
    'Leeds',
    60000,
    60000,
    2,
    2,
    3,
    DATE '2026-08-27',
    DATE '2026-08-27',
    '12 month FTC. Travel from Liverpool to Leeds 2 days per week is required.'
);
