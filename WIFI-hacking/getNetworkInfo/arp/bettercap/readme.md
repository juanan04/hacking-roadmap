# Usando bettercap

> Bettercap es un programa de ARP spoofing que nos permite correr ataques como: ARP Spoof, olfatear datos, transpasar HTTPS/HSTS, DNS spoof, JS inyecction entre otros.

---

## Como usar
1.  Lo primero de todo será instalar la herramienta bettercap (o comprobar que esté instalada en su defecto) haciendo uso del comando `apt-get install`.
2.  Una vez instalado, empezaremos ejecutando el siguiente comando (se recomienda siempre para saber sobre el comando, ejecutar `bettercap --help`):
```
bettercap -iface <nomInterfaz>
```
3. Una vez ejecutado, pondremos `help` donde se nos mostrarán todos los módulos (entre otras cosas) que poder utilizar.
4. Para saber de un módulo en concreto, tendremos que ejecutar `help <nomModulo>` donde `nomModulo` es el nombre del módulo del cual queremos informarnos.
