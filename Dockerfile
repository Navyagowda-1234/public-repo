FROM openjdk:11

ADD target/jenkins-webapp.jar jenkins-webapp.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","jenkins-webapp.jar"]
