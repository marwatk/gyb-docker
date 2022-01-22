# gyb-docker

Docker image for [Got Your Back](https://github.com/GAM-team/got-your-back).

## Usage

```bash
[REBUILD=1] [BACKUPS_DIR=/somepath] ./gyb <gyb arguments>
```

Options:

* `REBUILD`: If set the image will be rebuilt (by default will only rebuild if image is not present)
* `BACKUPS_DIR`: Path to store backups

## Notes

Because of how GYB stores ~~Apps for Your Domain~~ ~~G Suite~~ Google Workspace credentials, a separate `BACKUPS_DIR` is required for each domain. You'll also need to use the `--service-account` argument for any GYB actions.

## Complete steps for a Workspaces account:

```bash
export BACKUPS_DIR=/path/to/backups
export EMAIL_ACCOUNT=someuser@example.com

# Set up account credentials
./gyb --email "${EMAIL_ACCOUNT}" --create-project
# Follow the prompts

# Fix service account for workspaces
./gyb --email "${EMAIL_ACCOUNT}" --action check-service-account
# Follow the prompts

# Do the backup 
./gyb --email "${EMAIL_ACCOUNT}" --service-account
```

