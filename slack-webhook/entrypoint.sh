#!/bin/sh

if [ ! -z "$SLACK_PAYLOAD" ]; then
	payload=$SLACK_PAYLOAD
elif [ ! -z "$SLACK_MESSAGE" ]; then
	payload="{\"username\": \"github-actions\", \"text\": \"$SLACK_MESSAGE\"}"
fi

if [ -z "$payload" ]; then
	echo "SLACK_PAYLOAD or SLACK_MESSAGE must be defined"
	exit 1
else
	curl -XPOST -d"payload=$payload" $SLACK_WEBHOOK_URL
fi
