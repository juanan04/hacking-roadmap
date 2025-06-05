# Como generar un certificado SSL
> Veremos como generar un certificado SSL para hacer nuestra web donde se ubica el portal captivo, una web HTTPS.

---

1. Empezaremos generando el certificado con el siguiente comando ejecutado en consola:
```
openssl req --new -x509 -days 365 -out /root/cert.pem -keyout /root/cert.key
```
- El `-x509` se pone porque es la estructura que sigue la solicitud del certificado SSL
- `-out` indicamos la ruta donde queremos que se genere, en nuestro caso ponemos `/root` que es el home del root.
- `-keyout` indica donde se generará la clave del certificado.
2. Nos pedirá la clave y un par de datos.
3. Lo siguiente será activar el ssl en nuestro apache. Haremos uso de los siguientes comandos:
```
a2enmod ssl

leafpad /etc/apache2/sites-enabled/000-default.conf

leafpad /etc/apache2/ports.conf

service apache2 restart
```
4. Una vez reiniciamos el servicio apache nos pedirá la clave del certificado que asignamos en su creación.
5. Nos iremos a la configuración del sitio de apache y añadiremos lo siguiente: `ErrorDocument 404 /`
