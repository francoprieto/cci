# Clase 6 

## 1. Ejercicio instalando Sonarqube y analizando aplicación con sonarscanner-cli

* Paso 1: Instalar SonarQube en docker:

```bash
docker run -d --name sonarqube \
    -p 9000:9000 \
    -v sonarqube_data:/opt/sonarqube/data \
    -v sonarqube_extensions:/opt/sonarqube/extensions \
    -v sonarqube_logs:/opt/sonarqube/logs \
    sonarqube:community
```

* Paso 2: Ingresar al sonarqube a traves del puerto 9000
> http://localhost:9000

* Paso 3: Utilizar las credenciales Usuario: admin Password: admin y posteriormente cambiarlas

* Paso 4: Usar la opción "Create local project", definir el nombre del proyecto y el key

* Paso 5: En la pantalla "Set up new code for project" seleccionar la opción "Follow the instance's default" y hacer click en "Create project"

* Paso 6: En la pantalla "How do you want to analyze your repository?" seleccionar "Locally"

* Paso 7: En "Provide a token" seleccionar "Generate a project token", poner el nombre del key (paso 4) y en "Expires in" seleccionar "No expiration". Hacer click en "Generate" y va a generar un código parecido al siguiente (se debe copiar y no perder):

> sqp_d466b68afe0c4a6d2d805175cfea1575335cd122

Hacer click en "Continue"

* Paso 8: Descargar e instalar el sonnarscanner-cli de:
> https://docs.sonarsource.com/sonarqube-server/analyzing-source-code/scanners/sonarscanner

Por ejemplo descargar y descomprimir en el directorio "ext" quedando asi:
> /cci/ext/sonar-scanner-7.3.0.5189-linux-x64/bin

* Paso 9: Clonamos y compilamos el ejemplo de proyecto vulnerable en el directorio ext

```bash
cd ../etc
git clone https://github.com/DataDog/vulnerable-java-application.git

# Requiere descargar e instalar Java JDK

# Ejecutar gradlew en Linux, Mac, WSL
./gradlew

# Ejecutar java -version, si el resultado es distinto a 21, por ejemplo 17:
# Editar el archivo build.gradle cambiar la línea:
# sourceCompatibility = '21' por sourceCompatibility = '17'

# Luego ejecutar gradlew build en Linux, Mac, WSL
./gradlew build
```

* Paso 10: reamos un archivo sonar-project.properties en el directorio del proyecto vulnerable-java-application con el siguiente contenido:

```bash
# El valor app y sqp_d466b68afe0c4a6d2d805175cfea1575335cd122 corresponde al projectKey y token configurado en el sonarqube (paso 4 y 7)
sonar.host.url=http://localhost:9000
sonar.projectKey=app
sonar.token=sqp_d466b68afe0c4a6d2d805175cfea1575335cd122
sonar.java.binaries=./build
```

* Paso 11: Ejecutamos el sonar-scanner dentro del directorio del proyecto:

```bash
../sonar-scanner-7.3.0.5189-linux-x64/bin/sonar-scanner 
```

* Paso 12: El resultado se debería de reflejar en el SonarQube


