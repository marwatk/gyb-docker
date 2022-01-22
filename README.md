# gyb-docker

Docker image for [Got Your Back](https://github.com/GAM-team/got-your-back).

## Note:

This uses a custom fork of GYB that allows for a dynamic config location since the install folder is not writable.

## Usage

```bash
[REBUILD=1] [BACKUPS_DIR=/somepath] ./gyb <gyb arguments>
```

Options:

* `REBUILD`: If set the image will be rebuilt (by default will only rebuild if image is not present)
* `BACKUPS_DIR`: Path to store backups

## Complete backup steps for a Workspaces account:

```bash
export BACKUPS_DIR=/path/to/backups
export EMAIL_ACCOUNT=someuser@example.com
export DOMAIN="$(sed 's/.*@//' <<<"${EMAIL_ACCOUNT}")"

mkdir -p "${BACKUPS_DIR}" "${BACKUPS_DIR}/${DOMAIN}"

# Image uses 1001 userid
chown 1001 "${BACKUPS_DIR}" "${BACKUPS_DIR}/${DOMAIN}"

# Set up account credentials
./gyb --email "${EMAIL_ACCOUNT}" --config-folder "backups/${DOMAIN}" --action create-project
# Follow the prompts

# Fix service account for workspaces
./gyb --email "${EMAIL_ACCOUNT}" --config-folder "backups/${DOMAIN}" --action check-service-account
# Follow the prompts

# Do the backup 
./gyb --email "${EMAIL_ACCOUNT}" --config-folder "backups/${DOMAIN}" --service-account
```

## Backup regular gmail:

Same as above but skip the `--action check-service-account` and don't add `--service-account` to the final step.


