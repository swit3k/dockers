FROM jboss/wildfly:10.1.0.Final

ENV DEPLOYMENT_DIR /opt/jboss/wildfly/standalone/deployments
ENV JAVA_OPTS '-Xms64M -Xmx1G -XX:MetaspaceSize=256M -XX:MaxMetaspaceSize=1G'

WORKDIR /opt/jboss/wildfly
RUN ./bin/add-user.sh admin admin --silent

USER root
RUN chmod 775 ${DEPLOYMENT_DIR}
RUN chown jboss:jboss ${DEPLOYMENT_DIR}

RUN mkdir ./scripts
ENV SCRIPTS ./scripts

COPY entrypoint.sh .
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ./entrypoint.sh

EXPOSE 9990
