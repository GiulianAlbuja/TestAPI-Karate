
# Proyecto TestAPI-Karate

## Descripción
Este proyecto responde a la automatización de pruebas de servicios REST haciendo uso de  **Karate**, aquella herramienta que utiliza un enfoque basado en archivos de características (features) y un lenguaje de guiones similar a Gherkin (usado en Cucumber), que permite escribir escenarios de pruebas en un formato natural y fácil de entender. 

Se trabajó sobre la API documentada en [Swagger PetStore](https://petstore.swagger.io/). La aplicación PetStore simula una tienda de mascotas y permite gestionar información de las mismas. Las pruebas automatizadas cubren los siguientes casos de uso: 

1. **Añadir una mascota a la tienda** (POST): Envía una solicitud para agregar una nueva mascota y valida que la respuesta contenga los datos esperados. 
2. **Consultar la mascota ingresada** (GET): Realiza una búsqueda de la mascota previamente añadida mediante su ID para verificar su existencia y detalles. 
3. **Actualizar la mascota** (POST, PUT): Modifica el nombre y el estado de la mascota, cambiando su estado a "sold", y verifica que el cambio sea reflejado correctamente. 
4. **Consultar por estado** (GET): Recupera la lista de mascotas filtrando por el estado actualizado y asegura que la mascota modificada esté en el resultado. 

Cada caso de uso se realizó utilizando **Scenario Outlines** con dos casos de prueba. Además, se implementó una clase  `Runner` para ejecutar la feature y una clase `ManagementTest`, basada en la [documentación oficial de Karate](https://karatelabs.github.io/karate/), para generar reportes y gestionar la ejecución de pruebas en paralelo. Sin embargo, en este proyecto se eligió trabajar en un solo hilo, ya que las pruebas requerían un flujo secuencial, donde tres casos de uso validan o trabajan sobre la mascota previamente añadida o modificada. En caso de requerir la ejecución en paralelo, en la clase `ManagementTest`, se cambia el número de hilos deseados.

Finalmente, se utilizó **Cucumber** para la [generación de reportes detallados](https://karatelabs.github.io/karate/karate-demo/). Esto permite visualizar los resultados de cada prueba y analizar el estado de las validaciones de la API. Estos reportes muestran información organizada sobre cada prueba ejecutada, lo que facilita la revisión de los resultados y ayuda a identificar rápidamente cualquier problema o éxito en los casos de prueba ejecutados.

---

## Prerequisitos

Para poder ejecutar este proyecto de forma correcta, se debe cumplir con los siguientes prerequisitos en tu máquina local:

- **IDE Recomendado**: [IntelliJ IDEA]
- **JDK**: [[JDK versión](https://docs.aws.amazon.com/corretto/) 11 -17 (configurado en la variable de entorno `JAVA_HOME`)] 
- **Maven**: [[Maven versión](https://maven.apache.org/download.cgi) 3.9.1 o superiores (configurado en la variable de entorno `M2_HOME`)]


---

## Comandos de Instalación


Para instalar este proyecto en tu máquina local, sigue estos pasos: 
1. **Clona el repositorio**: Puedes hacerlo de dos maneras: 
- **Desde Git Bash**: Abre Git Bash en la carpeta donde deseas clonar el proyecto y ejecuta el siguiente comando: ```git clone https://github.com/GiulianAlbuja/TestAPI-Karate.git``` 

- **Desde IntelliJ IDEA**: 
	- Abre IntelliJ IDEA. 
	- Ve a **File > New > Project from Version Control...**. 
	- Ingresa la URL del repositorio (`https://github.com/GiulianAlbuja/TestAPI-Karate.git`) y selecciona la carpeta de destino.
	 - Haz clic en **Clone**. 

2. **Ejecuta el comando de instalación**: Una vez clonado el proyecto y abierto en IntelliJ, las dependencias se descargarán automáticamente, de lo contrario, abre una terminal en la carpeta del proyecto y ejecuta el siguiente comando para limpiar y compilar el proyecto: `mvn clean install`

> **Nota**: Asegúrate de que el JDK esté correctamente configurado en IntelliJ. Para hacerlo, ve a **File > Project Structure**. Ahí encontrarás dos configuraciones: **Project** y **SDKs**. Selecciona la versión del JDK que hayas configurado en `JAVA_HOME`.
>

## Instrucciones para ejecutar las pruebas

Ejecute la clase `ManagementTest`. Ubicada en `src/test/java/pets/ManagementTest.java`.

Solamente con este paso se ejecutarán todos los escenarios a validar. Además, se generará el reporte respectivo en al siguiente ruta:  `target/cucumber-html-reports/report-feature_[id].html`.


![image](https://github.com/user-attachments/assets/b2d03201-393e-44af-aef7-d91312a16cfe)
