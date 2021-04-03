#
# stage-1
# checkout and compile the latest version
#

FROM openjdk:11 AS builder

RUN apt-get update -qq && apt-get install -y wget git

RUN git clone https://github.com/apache/fineract.git
WORKDIR /fineract

RUN ./gradlew -Dorg.gradle.daemon=false -Dorg.gradle.jvmargs=-Xmx1024m --no-daemon bootJar

WORKDIR /fineract/libs
RUN wget -q https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.23/mysql-connector-java-8.0.23.jar

#
# stage-2: build the container
#

FROM openjdk:11-jdk-slim as fineract

COPY --from=builder /fineract/fineract-provider/build/libs /app
COPY --from=builder /fineract/libs /app/libs

WORKDIR /app

ENTRYPOINT ["java", "-Dloader.path=/app/libs/", "-jar", "/app/fineract-provider.jar"]
