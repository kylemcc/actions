FROM alpine:3.8
LABEL com.github.actions.name="Slack Notification"
LABEL com.github.actions.description="Send a slack notification"
LABEL com.github.actions.icon="hash"
LABEL com.github.actions.color="red"
RUN apk add --no-cache curl gettext
ADD entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
