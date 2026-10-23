FROM maven:3.9.9-eclipse-temurin-21-alpine AS build

WORKDIR /app

COPY .mvn .mvn
COPY mvnw mvnw
COPY pom.xml pom.xml
COPY src src

RUN chmod +x mvnw && ./mvnw -q -DskipTests package

FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

RUN addgroup -S spring && adduser -S spring -G spring
RUN mkdir -p /app/storage/transaction-receipts && chown -R spring:spring /app/storage

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

USER spring

RUN test -w /app/storage/transaction-receipts

ENTRYPOINT ["java", "-Duser.timezone=UTC", "-jar", "app.jar"]
