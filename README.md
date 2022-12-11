<h1 align="center">SySPer</h2>

<h4 align="center"><strong>Systemd (Daemon) Persistence</strong></h4>

<p align="center">
  <img border="0" src="./sysper" alt="sysper example">
</p>

<hr>

## - Instalation <br>
```console
$ wget -q "https://raw.githubusercontent.com/RodricBr/sysper/main/sysper" && chmod +x sysper
$ sudo ./sysper
```

## - Reseting <br>
```console
$ sudo rm /etc/systemd/system/sysper.service
$ sudo systemctl daemon-reload

$ systemctl status sysper.service
```

<br>

> Inspiration: https://pberba.github.io/security/2022/01/30/linux-threat-hunting-for-persistence-systemd-timers-cron/
