#!/bin/sh

if [ ! -z "$SLACK_PAYLOAD" ]; then
	# https://api.slack.com/docs/messages/builder
	payload=$SLACK_PAYLOAD
elif [ ! -z "$SLACK_MESSAGE" ]; then
	payload="{\"username\": \"Github Actions\", \"text\": \"$SLACK_MESSAGE\"}"
fi

if [ -z "$payload" ]; then
	echo "SLACK_PAYLOAD or SLACK_MESSAGE must be defined"
	exit 1
fi

payload=$(echo $payload | envsubst)
curl -s -XPOST -d"payload=$payload" $SLACK_WEBHOOK_URL
