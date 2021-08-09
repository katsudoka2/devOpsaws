from narjess6/devops:7.01

LABEL name="Java app on centos" \    
      maintainer="narjess" \
      vendor="narjess" \
     # release="7.04" \
      summary="A Java image based on CentOS" 

# Change to user root to install jdk, cant install it with any other user
USER root 
RUN yum update -y && \
    yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
    yum clean all

ENV JAVA_HOME /usr/lib/jvm/java



# copy WAR into image
COPY --from=build-env microcommerce-0.0.1-SNAPSHOT.jar /microcommerce.jar 

EXPOSE 9090

# run application with this command line 
CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "microcommerce.jar"]
