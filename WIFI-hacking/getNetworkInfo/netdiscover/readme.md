# Netdiscover
> `netdiscover` es una herramienta que nos permite obtener información de todos los dispositivos que se encuentren conectados a nuestra red-

---

## Comandos
```
netdiscover -r <puertaEnlace>/<mascaraNotaciónCIDR>

Ejemplo:

netdiscover -r 192.168.1.1/24
```
Nos devolvería una tabla con todos los dispositivos escaneados. En esta tabla se podría apreciar la IP de cada dispositivo, su dirección MAC, el nombre del vendedor MAC, entre otros.
netdiscover nos ayuda de manera rápida y sencilla de entender los dispositivos y los datos que se nos devuelve al escanear una red por dentro. Pero indagar mas en el tema ya pasaríamos al uso de la herramienta `Zenmap`
