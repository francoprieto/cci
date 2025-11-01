# Clase 8

## Actividad 2

![Ejercicio](./res/actividad2.png)

### Antes de continuar, **si no se tiene instalado y configurado Jenkins** ejecutar los pasos 1 al 4 de la clase anterior  (clase7)

* **Paso 1:** Crear el pipeline en Jenkins: 
    * En la pantalla principal hacer click en "+ New Item"
    * Poner nombre del pipeline, seleccionar el tipo "Pipeline" y hacer click en "Ok"
    * En la siguiente pantalla seleccionamos "GitHub project", allì debemos determinar el URL del repositorio, para este caso https://github.com/francoprieto/cci.git
    * Abajo, en el apartado "Pipeline", el campo "Definition" seleccionamos la opción "Pipeline script from SCM"
    * En "SCM" seleccionamos "Git"
    * En "Repository URL" ponemos: https://github.com/francoprieto/cci.git
    * En "Branches to build" -> "Branch Specifier" poner: */main
    * En "Script Path" completar con: clase8/JenkinsSemgrep
    * Finalmente hacer click en "Apply" y luego "Save"

* **Paso 2:** Ejecutar y verificar pipeline
    * En la pantalla principal hacemos click sobre nuestro pipeline
    * Luego hacemos click en la opción "Build Now". Aparecerá un número de ejecución abajo.
    * Hacer click sobre el número de ejecucón 
    * Luego click sobre "Console Output" para visualizar el proceso
    * Deberia de poder descargarse el archivo "semgrep.json"

## Actividad 3

![Ejercicio](./res/actividad3.png)

### Antes de continuar, **si no se tiene instalado y configurado Jenkins** ejecutar los pasos 1 al 4 de la clase anterior (clase7)

* **Paso 1:** Ejecutamos un contenedor con SonarQube

```bash
docker run -d --name sonarqube \
    -p 9000:9000 \
    -v sonarqube_data:/opt/sonarqube/data \
    -v sonarqube_extensions:/opt/sonarqube/extensions \
    -v sonarqube_logs:/opt/sonarqube/logs \
    sonarqube:25.10.0.114319-community
```

* **Paso 2**: Configurar sonarqube
> http://localhost:9000

* Ingresar el usuario y password admin
* Cambiar el password de admin
* En la pantalla principal hacer click en "Create a local project"
* En "Project display name" poner un nombre como "clase8-actividad3"

```bash
sudo cat /var/lib/docker/volumes/jenkins-data/_data/secrets/initialAdminPassword
# Este comando dara un código de resultado
```
Luego ingresamos a la siguiente dirección:
> http://localhost:8080

Pegamos el código del comando anterior en el campo "Administrator password" de la pantalla "Unlock Jenkins", y posteriormente damos click en "Continue"

* Paso 4: Configurar Jenkins
    * En la pantalla "Customize Jenkins" seleccionar "Install suggested plugins"
    * En la siguiente pantalla definimos un usuario admin
    * En la pantalla "Instance Configuration" dejamos la configuracion actual http://localhost:8080
     

* Paso 5: Crear el pipeline
    * En la pantalla principal hacer click en "+ New Item"
    * Poner nombre del pipeline, seleccionar el tipo "Pipeline" y hacer click en "Ok"
    * En la siguiente pantalla seleccionamos "GitHub project", allì debemos determinar el URL del repositorio, para este caso https://github.com/francoprieto/cci.git
    * Abajo, en el apartado "Pipeline", el campo "Definition" seleccionamos la opción "Pipeline script from SCM"
    * En "SCM" seleccionamos "Git"
    * En "Repository URL" ponemos: https://github.com/francoprieto/cci.git
    * En "Branches to build", "Branch Specifier" poner: */main
    * Finalmente hacer click en "Apply" y luego "Save"

* Paso 6: Ejecutar y verificar pipeline
    * En la pantalla principal hacemos click sobre nuestro pipeline
    * Luego hacemos click en la opción "Build Now". Aparecerá un número de ejecución abajo.
    * Hacer click sobre el número de ejecucón 
    * Luego click sobre "Console Output" para visualizar el proceso

* Paso 7: Verificar despliegue
Ingrese a la siguiente dirección:
> http://localhost:9090

