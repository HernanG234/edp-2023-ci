# Trabajo Práctico EDP CI - 2023

En este trabajo práctico se desarrollarán las siguientes funcionalidades:
* Generador de archivos: Podrá generar archivos de texto, imágenes y sonidos.
* Clasificador de archivos: Ordenará los archivos según su tipo.
* Monitor del sistema: Reportará variables del uso del sistema (espacio libre en disco, uso de RAM, uso de CPU, número de procesos corriendo en el sistema)
* Servidor FTP: Expondrá los archivos para poder descargarlos remotamente.

A su vez, estas funcionalidades se dividirán en tres módulos:
* Módulo Generador: Genera periódicamente archivos en los distintos formatos.
* Módulo Servidor: Corre el servidor FTP exponiendo los archivos generados en el Módulo Generador.
* Módulo Usuario: Accede a los archivos mediante FTP y se encarga de clasificarlos. También monitorea la información de sistema del container.

## Módulo Generador

### Generador de archivos

El generador de archivos deberá ser capaz de generar a pedido distintos tipo de archivos:

#### Texto:
```
base64 /dev/urandom | head -c 500 > file.txt
```

#### Sonidos:
```
ffmpeg -f lavfi -i "sine=frequency=1000:duration=5" out.wav
```

#### Imágenes:
```
convert -size 100x100 xc: +noise Random noise.png
```

### Timer/cron

Definir una tarea recurrente (cada 1 min) que genere un archivo aleatorio con el generador de archivos (no sabemos que tipo de archivo se va a generar).

> Nota: Es complejo configurar systemd en un docker ya que el kernel es compartido entre host y contenedor. Usar **crond** en este caso.

A su vez, deberá calcular el hash del archivo generado y renombrarlo con el mismo. Los archivos generados deberán ser guardados en un volumen de docker compartido con el Módulo servidor.

## Módulo servidor

### Servidor FTP

Se deberá configurar un servidor FTP para poder descargar los archivos producidos por el generador:

https://www.digitalocean.com/community/tutorials/how-to-set-up-vsftpd-for-a-user-s-directory-on-ubuntu-20-04

Definir autenticación para poder descargar (usuario y contraseña).

## Módulo Usuario

### Downloader

Pedirle al usuario que indique cuántos archivos quiere descargar.

Luego descargará del servidor FTP esta cantidad de archivos aleatorios y se los pasará al clasificador.

> Nota: Para descargar un archivo aleatorio podemos hacer un pedido al raíz del FTP y nos devolverá la lista de archivos. De esa lista elegir uno al azar.

Antes de descargar, verificar que ese archivo no exista ya (sugerencia: utilizar `md5sum`).

> Nota 2: Usar **curl** para descargar archivos del servidor ftp.

### Clasificador de archivos

Recibe un archivo aleatorio del `Downloader` y lo clasifica de acuerdo a la siguiente estructura de archivos:
```
outputs/
├── img
│   └── imagen1.png
├── snd
│   └── sonido1.wav
└── txt
    └── texto1.txt
```
Para ello deberá verificar que tipo de archivo recibe usando el comando `file` y moverlo a la carpeta que corresponda. También deberá renombrarlo como`<tipodearchivo><N>.<extension>` como se ve en la estructura más arriba.

### Compresor

Una vez que todos los archivos están clasificados, generar un `.tar` del directorio outputs para compartirlo luego y poder ser accedido desde afuera del contenedor.

### Monitor

Deberá reportar datos de:
* Uso de CPU
* Uso de RAM
* Nro de procesos corriendo en el sistema
* Espacio libre en el disco (o porcentaje de uso)

Guardar este reporte en `outputs/report_<DD_MM_YY:HH_MM_SS>.txt`

### Menú

Consultar al usuario que quiere hacer:
* Procesar archivos: Descarga, clasificación, archivo comprimido.
* Monitoreo del sistema: Generar reporte del sistema.

## Dockers

Todos los módulos pueden y **deben** ser dockerizados sin problemas.

```
FIN DEL ENUNCIADO
```

# Propuesta de etapas de desarrollo

1. Implementar el generador de archivos
2. Implementar el clasificador de archivos
3. Implementar el cron para generar archivos aleatorios cada minuto
4. Implementar el monitor del sistema
5. Implementar el servidor FTP
6. Implementar el downloader
7. Dockerizar todo

# Opcionales!

1. El generador de archivos puede generar muchas cosas, por ejemplo podríamos cambiar los tipos de onda que se usan para generar los sonidos o los tipos de ruido que usamos para generar las imágenes. Experimentar con los distintos tipos, extender los scripts para poder indicarle estas opciones.
2. Como optimización, podemos mantener una lista de los archivos ya descargados *en el downloader* para no tener que recalcular el hash de todos los archivos ya descargados para no bajar duplicados.
3. Agregar otras stats del sistema de interés (temperatura de los procesadores, uso de memoria swap, cantidad de procesos del usuario, etc).

