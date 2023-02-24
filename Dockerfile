FROM eclipse-temurin:8-jdk
EXPOSE 8080
COPY dependencies/ ./
COPY snapshot-dependencies/ ./
COPY spring-boot-loader/ ./
COPY application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]