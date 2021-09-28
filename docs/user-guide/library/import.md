# Dateien nach Originals Importieren #

1. Stelle sicher, dass sich alle Dateien, die du importieren willst, im *Import* Verzeichnis befinden

2. Öffne den Bereich *Dateien*, indem du auf den Link in der Hauptnavigation klickst, dann wechsle zum Tab *Import*

3. Wähle optional einen Unterordner aus

4. Wähle optional *Dateien verschieben*, wenn deine Dateien nach dem Import aus dem Ordner *Import* entfernt werden sollen

5. Klicke *Import*

![Screenshot](img/import.png)

!!! Info
    Zum Hinzufügen von Dateien zum *Import* Ordner kann [WebDAV](webdav.md) verwendet werden.
    Das ist besonders hilfreich, wenn PhotoPrism auf einem Remote-Server ausgeführt wird.

!!! Info
    Importieren ist im [read-only Modus](../settings/advanced.md#schreibgeschutzter-modus) (schreibgeschützt) nicht möglich, da Schreibrechte benötigt werden.
    
#### Option "Dateien Verschieben" ####

Wenn diese Option ausgewählt ist, werden Dateien, die in den Ordner *Originals* verschoben wurden oder dort bereits vorhanden sind,
automatisch aus dem *Import* Verzeichnis gelöscht.
Dadurch wird weniger Speicherplatz benötigt.
Wähle diese Option nur, wenn du die Dateien nicht als Backup oder aus einem anderen Grund in *Import* behalten möchtest.

#### Automatisch Importieren ####
15 Minuten, nachdem Änderungen über WebDAV am Import Verzeichnis vorgnommen wurden, wird der Importer automatisch gestartet.
Die Standardeinstllung von 15 Minuten kann über die [Konfigurations-Parameter](https://docs.photoprism.org/getting-started/config-options/) angepasst werden.

