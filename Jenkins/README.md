docker run -p 8080:8080 -p 50000:50000 -d --name jenkins -v /var/run/docker.sock:/var/run/docker.sock  -v /etc/sysconfig/docker:/etc/sysconfig/docker -v ~/jenkins_home:/var/jenkins_home myjenkins
