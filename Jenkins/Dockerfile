FROM jenkins:latest
LABEL maintainer=”cmdevops”

user root
RUN apt-get update
RUN apt-get install -y sudo
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN mv /usr/share/jenkins/jenkins.war /usr/share/jenkins/jenkins.war.bak

RUN wget http://updates.jenkins-ci.org/download/war/2.138.3/jenkins.war
RUN mv ./jenkins.war /usr/share/jenkins
RUN chown jenkins:jenkins /usr/share/jenkins/jenkins.war


# Name the jobs  
ARG job_name_1="EASDeployLinux"  

# Create the job workspaces  
RUN mkdir -p "$JENKINS_HOME"/workspace/${job_name_1}  

# Create the jobs folder recursively  
RUN mkdir -p "$JENKINS_HOME"/jobs/${job_name_1}  

# Add the custom configs to the container  
COPY /configs/${job_name_1}_config.xml "$JENKINS_HOME"/jobs/${job_name_1}/config.xml  

ENV JAVA_OPTS}                                   \
 -Dhudson.udp=-1                                 \
 -Xmx2048m                                       \
 -Djava.awt.headless=true                        \
 -Dhudson.DNSMultiCast.disabled=true             \
 -Djenkins.install.runSetupWizard=false          \
 -jar ${JENKINS_FOLDER}/jenkins.war              \
 ${JENKINS_OPTS}                                 \
 --httpPort=8080                             \
 --webroot=${JENKINS_FOLDER}/war                 \
 --ajp13Port=-1                                  \
 --httpListenAddress=0.0.0.0                     \
 --ajp13ListenAddress=0.0.0.0                    \
 --argumentsRealm.passwd.admin=admin             \
 --argumentsRealm.roles.user=admin               \
 --argumentsRealm.roles.admin=admin              \
 --prefix=${JENKINS_CONTEXT}