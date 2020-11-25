### Example:
### mvn package && docker build . -t petclinic:latest

FROM docker.io/fabric8/java-alpine-openjdk11-jre

WORKDIR home

EXPOSE 8080

COPY target/spring-petclinic*.jar .

ENTRYPOINT java -jar spring-petclinic*.jar
