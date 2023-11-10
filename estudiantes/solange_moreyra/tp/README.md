# Trabajo Práctico EDP CI - 2023

## Generador de Imágenes Docker y Servidor FTP

Este repositorio contiene un conjunto de instrucciones para crear una imagen Docker, ejecutar un generador de imágenes y configurar un servidor FTP para compartir archivos generados.

## Crear Imagen del Generador

Para crear la imagen del generador, utiliza el siguiente comando:

```bash
  docker build -t img-gen .

```
  
## Ejecutar el Generador con Volumen

Puedes ejecutar el generador(posicionarse en directorio `generador`) de imágenes Docker con la siguiente línea de comandos, asegurándote de ajustar las rutas según tu configuración:

```bash
  docker run -it -v /ruta/local/outputs/:/tmp/outputs/ img-gen

```

#### Ejemplo

```bash
	docker run -it -v /home/soly/Desktop/TUIA/edp-2023-ci/estudiantes/solange_moreyra/tp/generador/outputs/:/tmp/outputs/ img-gen

```

## Detener la Imagen del Generador

Para detener la imagen del generador, puedes utilizar el siguiente comando, reemplazando `$img-gen` por el identificador de la instancia en ejecución:

```bash
  docker stop $img-gen

```

## Configurar un Servidor FTP

Para configurar un servidor FTP y compartir los archivos generados, puedes ejecutar el siguiente comando:

```bash
  docker run -p 21:21 -p 21000-21010:21000-21010 -e USERS="tuiaedpuser|tuiaedpuser" -v /ruta/local/outputs/:/ftp/tuiaedpuser delfer/alpine-ftp-server

```

#### Ejemplo

```bash
        docker run -p 21:21 -p 21000-21010:21000-21010 -e USERS="tuiaedpuser|tuiaedpuser" -v /home/soly/Desktop/TUIA/edp-2023-ci/estudiantes/solange_moreyra/tp/generador/outputs/:/ftp/tuiaedpuser delfer/alpine-ftp-server

```

## Crear Imagen de Usuario

Para crear la imagen del usuario, ejecuta el siguiente comando:

```bash
  docker build -t img-usuario .

```

## Ejecutar la Imagen del Usuario

Puedes ejecutar la imagen del usuario (posicionarse en directorio `usuario`) con el siguiente comando, asegurándote de ajustar las rutas según tu configuración:

```bash
  docker run -it -v /ruta/local/outputs/:/opt/tmp/outputs/ --network="host" img-usuario

```

#### Ejemplo

```bash
        docker run -it -v /home/soly/Desktop/TUIA/edp-2023-ci/estudiantes/solange_moreyra/tp/usuario/outputs/:/opt/tmp/outputs/ --network="host" img-usuario

```

### Alumna

[@solangeramona](https://github.com/solangeramona)
