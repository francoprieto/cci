docker build -t myjenkins-blueocean:2.516.3-1 .

sudo docker run --name jenkins-blueocean --restart=on-failure --detach --publish 8080:8080 --publish 50000:50000 --volume jenkins-data:/var/jenkins_home --volume /var/run/docker.sock:/var/run/docker.sock --group-add $(stat -c '%g' /var/run/docker.sock) myjenkins-blueocean:2.516.3-1