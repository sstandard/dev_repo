PROMPT ================================
PROMPT Creating schema and seed data
PROMPT ================================

PROMPT Creating job status lookup table...
@tables/ct_job_status.sql

PROMPT Creating contract type lookup table...
@tables/ct_contract_type.sql

PROMPT Creating working type lookup table...
@tables/ct_working_type.sql

PROMPT Creating jobs table...
@tables/ct_jobs.sql

PROMPT Loading lookup seed data...
@data/create_lookup_data.sql

PROMPT Loading sample job data...
@data/create_job_data.sql

PROMPT Schema and seed data setup complete.
