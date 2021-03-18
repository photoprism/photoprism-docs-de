PhotoPrism bietet dir verschiedene Befehle um Ordnung in deiner Instanz zu halten oder Backups zu aktualisieren. Einige werden automatisiert im Hintergrund ausgeführt und Andere müssen manuell ausgelöst werden.

## Aufräumen

### Wozu dient diese Fuktion?

### Wann wird Sie ausgeführt?

## Backup

### Warum brauche ich Backups?

### Wann werden Backups erstellt?

## Optimieren

### Was wird optimiert?

Dieser Befehl prüft alle Dateien die ein `checked = false` haben und prüft, ob zusätzliche Metainformationen ausgelesen bzw. optimiert werden können.

Zum Beispiel:

* Mögliche Orte
* Bearbeitungsdatum als Datum, wenn kein Datum angegeben wurde.
* ...

Abschließend wird das `checked`-Flag auf true gesetzt.

### Wann wird der Befehl ausgeführt?

Standardmäßig wird der Befehl alle 15 Minuten ausgeführt.
Dieses Intervall kann mit `PHOTOPRISM_WAKEUP_INTERVAL` angepasst werden.

Nach 7 Tagen wird das `checked`-Flag wieder auf false gesetzt.

## Reinigen

### Was wird gereinigt?

### Wann wird die Reinigung durchgeführt?
