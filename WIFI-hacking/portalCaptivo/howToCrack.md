# Como crackear los portales captivos

---

> Los portales captivos son redes WiFi, normalmente de hoteles u organizaciones; cuyos te piden un login de inicio de sesión para poder acceder a la red.

---

1. Lo primero que tendremos que realizar es navegar hasta el portal en sí, en mi caso con Firefox; pulsaremos la tecla `Alt` > File > Save Page As... y guardamos la página en la ruta que mas nos convenga.
2. A continuación con nuestro editor de código favorito, realizamos los cambios pertinentes en el .html que se nos descarga, para que nuestro portal sea lo más parecido al original. Además de ajustar los links de los .css y .js si estos existen claro.
3. Seguidamente moveremos todo el contenido descargado a la ruta `/var/www/html`. Aquí eliminaremos los index por defecto y renombraremos nuestro .html a index.html.
4. Necesitaremos tener ciertos componentes instalados para poder seguir, estos son hostapd y dnsmasq.
   - hostapd: se encarga de emitir señal tal y como si fuera un router.
   - dnsmasq: funcionará tanto como servidor DHCP como servidor DNS.
Procederemos a instalar ambos con el comando `apt-get install hostapd dnsmasq`
5. (OPCIONAL) A continuación una vez tenemoso ya instalado tendremos que ejecutar ciertos comandos por consola para configurar correctamente las iptables. Esto evitara que haya problemas con el flujo de tráfico de la red. Además tendremos que crear 2 archivos de configuración: uno para hostapd y otro para dnsmasq. Podemos encontrar los comandos archivos `.conf` y los comandos a ejecutar como un `.sh` en esta misma ruta del repositorio.
6. Continuaremos ejecutando el servidor apache2 con nuestro certificado SSL ([Como añadir SSL a apache](SSLcertificate.md)).
7. Y una vez arrancado nos iremos a consola para ejecutar el siguiente comando:
```
tshrk -i wlan0 -w portal2.cap
```
- `-i` indica la interfaz por la que queremos escuchar.
- `-w` es la ruta del archivo que se creará, este contendrá todas las credenciales que se irán capturando. IMPORTANTE QUE SU EXTENSIÓN SEA '.cap'
8. Ahora cuando alguien introduzca los datos de inicio de sesión, capturaremos los datos y se irán guardando en el .cap. Una vez tengamos datos capturados procederemos a abrir el wireshark. En el abriremos el archivo .cap que se nos ha creado (en nuestro caso portal2.cap).
9. En el filtraremos por 'HTTP' y buscaremos algún paquete 'POST' y una vez encontrado, lo abriremos. Una vez abierto nos iríamos al HTML form encoded, los desplegaríamos y veríamos las credenciales de inicio de sesión.
