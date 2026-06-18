USE ROLE ACCOUNTADMIN;

SHOW WAREHOUSES;
CREATE WAREHOUSE tasty_bytes_dbt_wh WAREHOUSE_SIZE = LARGE;


CREATE DATABASE tasty_bytes_dbt_db;
CREATE SCHEMA tasty_bytes_dbt_db.dev;
CREATE SCHEMA tasty_bytes_dbt_db.prod;
CREATE SCHEMA tasty_bytes_dbt_db.integrations;


-- Create NETWORK RULE for external access integration

CREATE OR REPLACE NETWORK RULE dbt_network_rule
  MODE = EGRESS
  TYPE = HOST_PORT
  -- Minimal URL allowlist that is required for dbt deps
  VALUE_LIST = (
    'hub.getdbt.com',
    'codeload.github.com'
    );

-- Create EXTERNAL ACCESS INTEGRATION for dbt access to external dbt package locations

CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION dbt_ext_access
  ALLOWED_NETWORK_RULES = (dbt_network_rule)
  ENABLED = TRUE;