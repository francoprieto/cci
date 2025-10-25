# Clase 7

## Actividad 3

* Paso 1: Construir una imagen llamada "myjenkins-blueocean:2.516.3-1" a partir del Dockerfile

```bash
docker build -t myjenkins-blueocean:2.516.3-1 .
```

* Paso 2: Ejecutamos el contenedor jenkins

```bash
docker run --name jenkins-blueocean --restart=on-failure --detach --publish 8080:8080 --publish 50000:50000 --volume jenkins-data:/var/jenkins_home --volume /var/run/docker.sock:/var/run/docker.sock --group-add $(stat -c '%g' /var/run/docker.sock) myjenkins-blueocean:2.516.3-1

```

* Paso 3: Desbloqueamos jenkins

```bash
sudo cat /var/lib/docker/volumes/jenkins-data/_data/secrets/initialAdminPassword
```