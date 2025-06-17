# Herramienta ARPSPOOF

> Se usa para indicar/engañar a un dispositivo de la red que eres otra dispositivo de dicha red (aunque no lo sea). En este caso lo usaremos para el ataque MITM, donde ejecutaremos en dos terminales distintas. Donde en una le indicaremos al dispositivo a interceptar (víctima) que somos la puerta de enlace, y en la otra indicarla al router que somos la víctima.
> Para realizar lo anterior haremos uso del comando `arpspoof` entre otros.

---

## Ejecución
1. Abrimos una terminal donde pondremos el siguiente comando:
```
arpspoof -i <nomInterfaz> -t <IPVictima> <IPSeñuelo>
```
 - `nomInterfaz` es el nombre de la interfaz de nuestro dispositivo que vamos a usar para el ataque. (Podemos sacar dicho nombre haciendo uso del comando `ifconfig` por ejemplo.)
 - `IPVictima` es la dirección IP del dispositivo el cual vamos a atacar.
 - `IPSeñuelo` es la dirección IP la cual le vamos a indicar a la victima que somos. En el siguiente caso lo haremos con la P.E.
Ejemplo del comando completo:
```
arpspoof -i wlan0 -t 192.168.1.168 192.168.1.1
```
En este caso le estoy indicando al dispositivo con IP acabado en `.168` que yo soy para el la puerta de enlace, la cual en este caso tiene la IP `192.168.1.1`.

2. Una vez ejecutado el comando anterior, abriríamos otra terminal donde ejecutaríamos el mismo comando pero intercambiando las posiciones de las IPs. Es decir:
```
arpspoof -i wlan0 -t 192.168.1.1 192.168.1.168
```

3. **(OPCIONAL)** Seguidamente, tendremos que realizar IP Forwarding para que la víctima pueda seguir navegando por Internet. Ya que mientras hagamos 'arpspoofing', la víctima no tendrá acceso a Internet al menos, tal y como hemos dicho antes; hagamos IP Forwarding. Para la realización del IP Forwarding, ejecutaremos el siguiente comando:
```
echo 1 > /proc/sys/net/ipv4/ip_forward
```
Una vez ejecutado, la víctima ya tendría acceso a Internet. Esto lo que hace realmente es que los puertos puedan 'fluir' por nuestro equipo, dandole a la víctima acceso a Internet.
