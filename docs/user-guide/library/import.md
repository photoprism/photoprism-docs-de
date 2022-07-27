# Dateien in das Originals Verzeichnis importieren #

!!! tldr ""
    Die meisten Benutzer mit einer bestehenden Bibliothek werden ihre [Originale](./indexing.md) direkt indexieren wollen, ohne die optionale Importfunktion zu verwenden, wobei die Datei- und Ordnernamen unverändert bleiben. 
    Beim Importieren werden zunächst Kopien oder Verschiebungen aus dem Quellverzeichnis in den *Originals*-Ordner vorgenommen, was optional ist.

1. Stelle sicher, dass sich alle Dateien, die du importieren willst, im *Import* Verzeichnis befinden

2. Öffne den Bereich *Dateien*, indem du auf den Link in der Hauptnavigation klickst, dann wechsle zum Tab *Import*

3. Wähle optional einen Unterordner aus

4. Wähle optional *Dateien verschieben*, wenn deine Dateien nach dem Import aus dem Ordner *Import* entfernt werden sollen

5. Klicke *Import*

![Screenshot](img/import.png){ class="shadow" }

!!! tip ""
    Zum Hinzufügen von Dateien zum *Import* Ordner kann [WebDAV](webdav.md) verwendet werden.
    Das ist besonders hilfreich, wenn PhotoPrism auf einem Remote-Server ausgeführt wird.

!!! attention ""
    Importieren ist im [read-only Modus](../settings/advanced.md#schreibgeschutzter-modus) (schreibgeschützt) nicht möglich, da [Schreibrechte](https://docs.photoprism.app/getting-started/troubleshooting/docker/#file-permissions) benötigt werden.
    
#### Option "Dateien Verschieben" ####

Wenn diese Option ausgewählt ist, werden Dateien, die in den Ordner *Originals* verschoben wurden oder dort bereits vorhanden sind,
automatisch aus dem *Import* Verzeichnis gelöscht.
Dadurch wird weniger Speicherplatz benötigt.
Wähle diese Option nur, wenn du die Dateien nicht als Backup oder aus einem anderen Grund in *Import* behalten möchtest.

#### Automatisch Importieren ####
15 Minuten, nachdem Änderungen über WebDAV am Import Verzeichnis vorgnommen wurden, wird der Importer automatisch gestartet.
Die Standardeinstllung von 15 Minuten kann über die [Konfigurations-Parameter](https://docs.photoprism.app/getting-started/config-options#index-workers) angepasst werden.

!!! info "Kann ich mit PhotoPrism Dateien in einer konfigurierbaren Ordnerstruktur sortieren?"
    Du kannst deine Dateien sortieren, wie du möchtest. Falls dir die Ordner- und Namenskonvention unserer Importfunktion nicht gefällt,
    kannst du andere Tools zur Umbenennung verwenden:

    * [ExifTool](https://ninedegreesbelow.com/photography/exiftool-commands.html#rename)
    * [PhockUp](https://github.com/ivandokov/phockup)
    * [Photo Organizer](https://www.systweak.com/photo-organizer)

    Konfigurierbare Importordner werden möglicherweise in einer späteren Version verfügbar sein.