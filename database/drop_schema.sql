PROMPT ============================
PROMPT Dropping schema objects
PROMPT ============================

PROMPT Deleting jobs data...
DELETE FROM jobs;

PROMPT Dropping jobs table...
DROP TABLE jobs;

PROMPT Dropping working type lookup table...
DROP TABLE job_working_type;

PROMPT Dropping contract type lookup table...
DROP TABLE job_contract_type;

PROMPT Dropping job status lookup table...
DROP TABLE job_status;

PROMPT Schema cleanup complete.
