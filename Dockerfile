### Example:
### docker build . --build-arg jar_name=spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar -t petclinic:latest

FROM docker.io/fabric8/java-alpine-openjdk11-jre

ARG jar_name
ENV JAR_NAME=$jar_name
RUN test -n "$JAR_NAME" || (echo "jar_name build-arg must be set."; exit 1)

COPY target/$JAR_NAME .

EXPOSE 8080

ENTRYPOINT "java" "-jar" "${JAR_NAME}"
