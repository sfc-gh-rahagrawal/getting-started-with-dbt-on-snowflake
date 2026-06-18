CREATE NETWORK POLICY github_actions_policy
  ALLOWED_NETWORK_RULE_LIST = ('SNOWFLAKE.NETWORK_SECURITY.GITHUBACTIONS_GLOBAL')
  BLOCKED_NETWORK_RULE_LIST = ();

ALTER USER GitHub_Actions_Service_User
  SET NETWORK_POLICY = github_actions_policy;

-- Check the user's current network policy:
SHOW PARAMETERS LIKE 'NETWORK_POLICY' FOR USER github_actions_service_user;