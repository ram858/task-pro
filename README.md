steps: setting up bitbucket and mirroring repo in gitlab cicd 
1) create a bitbucket repository, and import the code on bitbucket
2) In GitLab, create a project:
  a) Select Run CI/CD for external repository.
  b) Select Repository by URL.
  c) Fill in the fields with information from the repository in Bitbucket:
  d) For Git repository URL, use the URL from the Clone this repository panel in Bitbucket.
      - create the App passwords from bitbucket and provide it in passwords sections leaving user as blank
3) In GitLab, create a Personal Access Token with api scope. The token is used to authenticate requests from the web hook that is created in Bitbucket to notify GitLab of new commits.
4) In Bitbucket, from Settings > Webhooks, create a new web hook to notify GitLab of new commits.
  provide webhook url as:
    - https://gitlab.com/api/v4/projects/:project_id/mirror/pull?private_token=<your_personal_access_token>
5) In GitLab, from Settings > CI/CD > Variables, add variables to allow communication with Bitbucket via the Bitbucket API:

      - BITBUCKET_ACCESS_TOKEN: The Bitbucket app password created above. This variable should be masked.
      - BITBUCKET_USERNAME: The username of the Bitbucket account.
      - BITBUCKET_NAMESPACE: Set this variable if your GitLab and Bitbucket namespaces differ.
      - BITBUCKET_REPOSITORY: Set this variable if your GitLab and Bitbucket project names differ.

6) check if the mirroring is created or not, if not provide the bitbucket url, username and App password and set-up pull mirroring
  - enable Trigger pipelines for mirror updates
 


