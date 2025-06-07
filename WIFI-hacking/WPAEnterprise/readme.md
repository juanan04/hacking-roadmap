# Cracking a WPAEnterprise network
> La autentificación WPA Enterprise consiste a diferencia de la WPA normal, en que cada usuario tiene su propia clave y nombre de usuario.
> Además esta se diferencia en que la autentificación está controlada en un servidor radius.

---

## Pasos a seguir para el crackeo
1. Lo primero será instalar el programa `hostapd-wpe`. Este nos permitirá convertir nuestra tarjeta inhalámbrica con _access point_ en un router con WPA Enterprise.
2. A continuación, procederemos a configurar el archivo de configuración del programa que recién hemos descargado. Dicho archivo lo encontraremos en la ruta `/etc/hostapd-wpe/hostapd-wpe.conf`.
3. Una vez dentro del archivo nos fijaremos en las siguientes configuraciones:
   - `interface`: el nombre de la interfaz que actuará como "router".
   - `ssid`: es el nombre que tendrá la red.
   - `channel`: por el canal que funcionará la red.
4. Seguidamente después de configurar lo necesario, procederemos a arrancar el archivo con el siguiente comando:
```
hostapd-wpe /etc/hostapd-wpe/hostapd-wpe.conf
```
5. Ahora, cuando un usuario intente conectarse recibiremos por consola la siguiente información: un **username**, un **challenge** y un **response**. Estos 2 últimos nos ayudará a descifrar la password.
6. Para crackear la password haciendo uso del challenge y el response, haremos uso del programa llamado `asleap` mas un diccionario. Para saber más sobre el uso de diccionarios hecha un vistazo al directorio de [wordlists](../../../wordlists).
7. Una vez ya con nuestro diccionario, challenge y response; procederemos a ejecutar el siguinte comando para realizar el ataque de fuerza bruta.
```
asleap -C <challenge> -R <response> -W <diccionario>
```
8. Finalmente, según lo bueno que sea el diccionario y la complejidad de la password, obtendremos la password exacta para la autentificación WPA Enterprise. Lo que nos quedaría simplemente es probarlo junto al nombre del usuario que recibimos al principio.

---

## Bibliografía
> Información sacada y basada del o de los siguiente/s medio/s:
- [Hacking Redes WiFi y Comunicaciones](https://youtu.be/ae7IsG7v9nY?t=7994)
