# Zenmap tool

> Zenmap a diferencia de `netdiscover`, te permite obtener más información acerca de los dispositivos que se encuentren en tu red. Esta herramienta es nada más y nada menos que la GUI de la conocida herramienta `nmap` que usamos por consola, conocida principalmente para el escaneo de puertos abiertos de un objetivo.

---

## Como usar

1. Lo primero será abrir el programa, por defecto en Kali ya viene instalado así que simplemente buscándo "Zenmap" en la barra de búsqueda, nos aparecería para poder abrirla.
2. Una vez abierto rellenaremos los siguientes campos con lo siguiente:
    - `Target`: Introduciremos la ip de la puerta de enlace junto la máscara en notación CIDR. Por ejemplo: 192.168.1.1/24
    - `Profile`: En este selector podremos apreciar que tenemos diferentes opciones a elegir. En mi caso empezaré con un "Ping scan",el cual devuelve nada más ni nada menos que los dispositivos conectados a la red. Más abajo podrás ver para que sirve cada opción del Profile.
3. Una vez tengamos los campos rellenos con lo que queramos procederemos a pulsar el botón `Scan`, y Zenmap nos devovlerá por la pestaña `Nmap Output` los resultados.

## Diferentes opciones del campo Profile
Como hemos visto anteriormete, el selector `Profile` contiene una gran variedad de opciones. A continuación, se listarán todas las opciones posibles que hay y su función:
- `Intense scan`: Escaneo profundo con detección de servicios y sistema operativo. Usa múltiples técnicas (TCP connect, SYN, etc.)
- `Intense scan plus UDP`: Igual que el anterior, pero añade escaneo de puertos UDP. Más lento, pero útil para descubrir servicios UDP ocultos.
- `Intense scan, all TCP ports`: Escanea todos los puertos TCP (1-65535). Detecta servicios que no están en puertos comunes.
- `Intense scan, no ping`: Igual que el `Intense scan`, pero no hace ping previo. Útil si el host bloquea ICMP (ping).
- `Ping scan`: Solo detecta qué host están activos (vivos). No escanea puertos ni servicios.
- `Quick scan`: Escaneo rápido de puertos comunes. Menor tiempo, resultados básicos.
- `Quick scan plus`: Igual que `Quick scan`, pero añade detección de servicios.
- `Quick traceroute`: Hace traceroute para saber la ruta hasta el host. No escanea puertos.
- `Regular scan`: Escaneo general sin detección de OS ni servicios. Rápido y básico.
- `Slow comprehensive scan`: Escaneo muy detallado y completo. Lento, pero útil para auditorías exhaustivas.
