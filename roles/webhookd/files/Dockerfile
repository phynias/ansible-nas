#########################################
# Build stage
#########################################
FROM ncarlier/webhookd:latest
USER root
COPY ./requirements.txt /requirements.txt

# Install deps
RUN apk update && apk add -U --no-cache bind-tools docker git openssh-client jq bash curl python3 py3-pip findutils perl libxml2-dev libxslt-dev python3-dev musl-dev gcc && pip3 install youtube-dl && \
	pip3 install -r /requirements.txt && \
	apk del gcc

