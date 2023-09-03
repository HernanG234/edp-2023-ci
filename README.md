Entorno de Programación CI - 2023
===

## Metodología:

Cada estudiante deberá agregar un directorio con su apellido y nombre en este repositorio en `estudiantes/`. Luego, cada estudiante tendrá dos directorios raíces `ejercicios/` y `tp/`. En `ejercicios/` estarán las resoluciones de los problemas de las guía de bash que se encuentra en el raíz de este repositorio (`bash_guide.md`). A medida que van resolviendo los ejercicios y el Trabajo Práctico deberán realizar sucesivas PRs, quienes serán aprobadas por los docentes de la cátedra y finalmente mergeadas a la rama `main`. Si sus resoluciones están mergeadas significa que están aprobadas.

### Preparando la primer PR
0. Hacer un fork del repositorio

1. Clonar el repo forkeado (el de su cuenta de github)
```
git clone <url_a_este_repo>
```

2. Crear una nueva rama. Tomaremos de convencion empezar la rama con el apellido, seguido de `ej` o `tp` dependiendo de lo que estén resolviendo y el ejercicio o feature que estén implementando, por ejemplo:
```
git checkout -b gonzalez-ej-s1e0
```

3. Resolver/implementar el ejercicio/feature

4. Crear una PR con la solución

5. Corregir hasta que la PR esté mergeada a main

6. Si fue mergeada, festejar!

7. Volver a la rama main para crear la nueva rama con la nueva solución

### Flujo de trabajo con PRs
![git flow tp](./gitflowtp.svg)
