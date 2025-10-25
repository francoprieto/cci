# Clase 6 

## 1. Ejercicio instalando Sonarqube y analizando aplicación con sonar-cli

* Instalar SonarQube en docker:

```bash
docker run -d --name sonarqube \
    -p 9000:9000 \
    -v sonarqube_data:/opt/sonarqube/data \
    -v sonarqube_extensions:/opt/sonarqube/extensions \
    -v sonarqube_logs:/opt/sonarqube/logs \
    sonarqube:community
```

* Ingresar al sonarqube a traves del puerto 9000
> http://localhost:9000

* Utilizar las credenciales Usuario: admin Password: admin y posteriormente cambiarlas

* Usar la opción "Create local project"



