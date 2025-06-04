# Como crackear los portales captivos (redes wifi como la de hoteles)

1. Lo primero que tendremos que realizar es navegar hasta el portal en sí, en mi caso con Firefox; pulsaremos la tecla `Alt` > File > Save Page As... y guardamos la página en la ruta que mas nos convenga.
2. A continuación con nuestro editor de código favorito, realizamos los cambios pertinentes en el .html que se nos descarga, para que nuestro portal sea lo más parecido al original. Además de ajustar los links de los .css y .js si estos existen claro.
3. Seguidamente moveremos todo el contenido descargado a la ruta `/var/www/html`. Aquí eliminaremos los index por defecto y renombraremos nuestro .html a index.html.
4. Necesitaremos tener ciertos componentes instalados para poder seguir, estos son hostapd y dnsmasq.
   - hostapd: se encarga de emitir señal tal y como si fuera un router.
   - dnsmasq: funcionará tanto como servidor DHCP como servidor DNS.
Procederemos a instalar ambos con el comando `apt-get install hostapd dnsmasq`
