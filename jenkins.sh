#!/bin/bash

### Exit immediately on any non-zero return code
set -e

### Export options - adding to JAVA_OPTS so that users can pass additions ones
### to the command line used to start the Docker container...
### e.g. via --env JAVA_OPTS="-Xmx2048m -XX:MaxPermSize=512m"
export JAVA_OPTS="${JAVA_OPTS} -Dhudson.model.DownloadService.noSignatureCheck=true"
export JAVA_OPTS="${JAVA_OPTS} -Djava.awt.headless=true"
export JAVA_OPTS="${JAVA_OPTS} -Djenkins.install.runSetupWizard=false"
# export JENKINS_UC="http://<SERVER>/update-center.json"

#
#
# /usr/bin/mv /tmp/UpdateCenter.xml /var/jenkins_home/hudson.model.UpdateCenter.xml


### Allow the user to specify -- launcher args as first arg to docker run
if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
#  echo "JAVA_OPTS are $JAVA_OPTS" > /javaopts.txt
  eval "exec java ${JAVA_OPTS} -jar /usr/share/jenkins/jenkins.war $JENKINS_OPTS \"\$@\""
fi

# Allow other commands to be passed through, e.g. runing bash
exec "$@"
