FROM jenkins:latest
LABEL maintainer=”cmdevops”

user root
RUN apt-get update
RUN apt-get install -y sudo
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN mv /usr/share/jenkins/jenkins.war /usr/share/jenkins/jenkins.war.bak

RUN wget http://updates.jenkins-ci.org/download/war/2.150.2/jenkins.war
RUN mv ./jenkins.war /usr/share/jenkins
RUN chown jenkins:jenkins /usr/share/jenkins/jenkins.war

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# add the admin user  
COPY /configs/users "$JENKINS_HOME"/users/

RUN ip4=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
RUN echo Localhost IP: $ip4

# add the master node  
COPY /configs/nodes "$JENKINS_HOME"/nodes/

RUN sed -i 's/hostnameip/$ip4/g'  "$JENKINS_HOME"/nodes/MasterNode/config.xml

# Add the main config file to the jenkins path  
COPY /configs/jenkins_home_config.xml "$JENKINS_HOME"/config.xml

COPY /configs/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Add the custom configs to the container  
COPY /configs/jobs/. "$JENKINS_HOME"/jobs/
COPY /configs/jobs/. "$JENKINS_HOME"/workspace/
