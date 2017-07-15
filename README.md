# dockerjenkins
UPDATED to wget the latest available war file at build time.

This image is available via an automated build on the Docker Hub:

https://hub.docker.com/r/donaldsimpson/dockerjenkins/

I'm using this to test dockerised jenkins swarm nodes

With docker-latest installed and running you can build it like this:

docker build -t donaldsimpson/dockerjenkins .

or pull it from docker hub like this:

docker pull donaldsimpson/dockerjenkins

and run it with these args:

docker run -d -p 8080:8080 -v /some/LOCALANDEXISTING/dir/:/var/jenkins_home:Z donaldsimpson/dockerjenkins
 
where:
 
 -p 8080:8080 maps the host to container port 8080. 

 (You can add 5000 for slave nodes too)
 
 -v /some/local/dir:/var/jenkins_home:Z maps some local host dir to the containers JENKINS_HOME in /var/jenkins_home

TODO:

sort out running as the jenkins user and mapping the data volume at the same time
