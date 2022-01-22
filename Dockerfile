# syntax=docker/dockerfile:1.3-labs
FROM python:3.10.2

ENV HOME=/backups
ENV GYB_INSTALL=/opt/gyb
ENV GYB_VERSION=1.54

RUN <<EOF
#!/bin/bash -ex
  mkdir -p "${HOME}" "${GYB_INSTALL}"
  chown 1001 "${HOME}"
  curl -s -S --fail -L https://github.com/GAM-team/got-your-back/archive/refs/tags/v${GYB_VERSION}.tar.gz \
    | tar -xzv --strip-components=1 -C "${GYB_INSTALL}"
  pip install -r "${GYB_INSTALL}/requirements.txt"
  ln -s /backups/oauth2service.json /opt/gyb/oauth2service.json
  ln -s /backups/client_secrets.json /opt/gyb/client_secrets.json
EOF

USER 1001

WORKDIR /backups
VOLUME /backups

ENTRYPOINT ["/opt/gyb/gyb.py"]
