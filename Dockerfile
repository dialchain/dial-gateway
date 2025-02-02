# Enable NewRelic integration - download Java Agent
FROM appropriate/curl as NewRelicInstall
WORKDIR /newrelic
RUN curl -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip  \
    && unzip newrelic-java.zip

# Primary deliverable
FROM adorsys/java:11

WORKDIR /app
ENV APP_PORT=9092

COPY --from=NewRelicInstall /newrelic/newrelic ./newrelic
COPY dial-gateway-app/target/dial-gateway-app-*.jar ./dial-gateway-app.jar

CMD exec java $JAVA_OPTS -javaagent:newrelic/newrelic.jar -jar ./dial-gateway-app.jar --server.port=$APP_PORT