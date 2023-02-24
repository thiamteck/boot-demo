FROM eclipse-temurin:8-jdk
EXPOSE 8080
COPY target/dependencies/ ./
COPY target/snapshot-dependencies/ ./
COPY target/spring-boot-loader/ ./
COPY target/application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]