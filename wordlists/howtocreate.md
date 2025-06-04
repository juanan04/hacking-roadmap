# Crear tu propio diccionario (usando espacio en el disco)

---

## Como se hace

Para ello haremos uso en este caso del comando `crunch`, haciendo uso del siguiente formato:
```
crunch [min] [max] [caracteres] -t [patron] -o [nombrearchivo]
```
- [min] y [max] indican el número mínimo y máximo de caracteres que tiene la palabra.
- [caracteres] indica que caracteres contendrá, puedes poner todo el abecedarios, solo numéricos, símbolos, etc.
- [patron] aquí puedes poner el patron de dicha palabra si tienes alguna idea, por ejemplo que empieza con a y termina con s.
- [nombrearchivo] es el nombre que le quieres dar a tu diccionario.

---

## Ejemplo

```
crunch 6 6 abc123 -t a@@@@c -o diccionario01
```
---

# Crear tu propio diccionario (sin usar espacio en el disco)

Haremos uso nuevamente del comando `crunch`.
```
crunch 8 8 | aircrack-ng -w - -b <bssidRouter> <nombreArchivo>.cap
```

---

# Como guardar progreso de un ataque de diccionario

Vamos a utilizar una mezcla de todo lo visto anteriormente para poder llevar a cabo dicho cometido. Empezamos con el comando `crunch`
El comando completo sería el siguiente:
```
crunch 8 8 | john --stdin --session=<nombreSession> --stdout | aircrack-ng -w - -b <bssidRouter> <nombreArchivo>.cap
```

Una vez ejecutado podremos pausarlo cuando querramos con `Ctrl+C`. Y para resumirlo tendremos que ejecutar lo siguiente en consola:
```
crunch 8 8 | john --restore=<nombreSession> | aircrack-ng -w - -b <bssidRouter> <nombreArchivo>.cap
```
