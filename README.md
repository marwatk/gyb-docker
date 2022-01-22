# gyb-docker

Docker image for [Got Your Back](https://github.com/GAM-team/got-your-back).

## Usage

```bash
[REBUILD=1] [BACKUPS_DIR=/somepath] ./gyb <gyb arguments>
```

Options:

* `REBUILD`: If set the image will be rebuilt (by default will only rebuild if image is not present)
* `BACKUPS_DIR`: Path to store backups

## Complete backup steps for a Workspaces account:

**Note** It's easiest to paste the links GYB generates into an incognito window logged into only 1 google account, otherwise it'll default to your first logged in account.

Change the first two values to match your use:

```bash
export BACKUPS_DIR=/path/to/backups
export EMAIL_ACCOUNT=user@example.com

# Set up account credentials
./gyb --email "${EMAIL_ACCOUNT}" --action create-project
# Follow the prompts

# Fix service account for workspaces
./gyb --email "${EMAIL_ACCOUNT}" --action check-service-account
# Follow the prompts

# Do the backup
./gyb --email "${EMAIL_ACCOUNT}" --service-account
```

## Backup regular gmail:

**Note** It's easiest to paste the links GYB generates into an incognito window logged into only 1 google account, otherwise it'll default to your first logged in account.

Change the first two values to match your use:

```bash
export BACKUPS_DIR=/path/to/backups
export EMAIL_ACCOUNT=user@gmail.com

# Set up account credentials
./gyb --email "${EMAIL_ACCOUNT}" --action create-project
# Follow the prompts

# Do the backup
./gyb --email "${EMAIL_ACCOUNT}"
```

