# Dateien in das Originals Verzeichnis importieren #

!!! tldr ""
    Die meisten Benutzer mit einer bestehenden Bibliothek werden ihre [Originale](./indexing.md) direkt indexieren wollen, ohne die optionale Importfunktion zu verwenden, wobei die Datei- und Ordnernamen unverändert bleiben. 
    Beim Importieren werden zunächst Kopien oder Verschiebungen aus dem Quellverzeichnis in den *Originals*-Ordner vorgenommen, was optional ist.

## Manueller Import

1. Stelle sicher, dass sich alle Dateien, die du importieren willst, im *Import* Verzeichnis befinden

2. Öffne den Bereich *Dateien*, indem du auf den Link in der Hauptnavigation klickst, dann wechsle zum Tab *Import*

3. Wähle optional einen Unterordner aus

4. Wähle optional *Dateien verschieben*, wenn deine Dateien nach dem Import aus dem Ordner *Import* entfernt werden sollen

5. Klicke *Import*

![Screenshot](img/import-2503-german.jpg){ class="shadow" }

!!! tip ""
    Zum Hinzufügen von Dateien zum *Import* Ordner kann [WebDAV](webdav.md) verwendet werden.
    Das ist besonders hilfreich, wenn PhotoPrism auf einem Remote-Server ausgeführt wird.

!!! danger ""
    Importieren ist im [schreibgeschützten Modus](../settings/library.md) nicht möglich, da er [Schreibrechte](https://docs.photoprism.app/getting-started/troubleshooting/docker/#file-permissions) für den Ordner *originals* benötigt.    

### Option "Dateien Verschieben" ###

Wenn diese Option ausgewählt ist, werden Dateien, die in den Ordner *Originals* verschoben wurden oder dort bereits vorhanden sind,
automatisch aus dem *Import* Verzeichnis gelöscht.
Dadurch wird weniger Speicherplatz benötigt.
Wähle diese Option nur, wenn du die Dateien nicht als Backup oder aus einem anderen Grund in *Import* behalten möchtest.

## Automatisch Importieren ##
Der automatische Import ist standardmäßig deaktiviert, da eine falsche Konfiguration oder eine nicht unterstützte Verwendung dazu führen kann, dass Dateien oder Dateigruppen unvollständig importiert werden, z. B. wenn du eine langsame oder unzuverlässige Internetverbindung verwendest, was besonders bei [großen Video- oder RAW-Dateien](https://github.com/photoprism/photoprism/issues/4310) von Bedeutung ist.

Wenn du den automatischen Import aktivierst, indem du die Konfigurationsoption [`PHOTOPRISM_AUTO_IMPORT`](https://docs.photoprism.app/getting-started/config-options#indexing) auf eine positive Zahl setzt, die die Sicherheitsverzögerung in Sekunden angibt, wird ein Import automatisch nach der Sicherheitsverzögerung ausgelöst, wenn Dateien [über WebDAV](../sync/webdav.md) zum *Import*-Ordner hinzugefügt werden.

[Mehr Erfahren ›](https://docs.photoprism.app/getting-started/config-options#indexing)

## Import Pfad Schema ändern

Seit [Release 250223-b79d21907](https://docs.photoprism.app/release-notes/#february-23-2025) können fortgeschrittene Benutzer das von der Importfunktion verwendete Schema für den Zieldateipfad über die [`settings.yml`](https://docs.photoprism.app/getting-started/config-files/settings/#media-library) anpassen, wie in diesem Beispiel gezeigt:

```yaml
Import:
  Dest: 2006/01/20060102_150405_82F63B78.jpg
```

Die Platzhalter für Datum und Uhrzeit werden in der [Dokumentation zum *time*-Paket beschrieben](https://pkg.go.dev/time#Layout). Die Verwendung einer anderen 8-stelligen Hexadezimalzahl wie „12345678“ für die [CRC32-Prüfsumme](https://en.wikipedia.org/wiki/Cyclic_redundancy_check) und „.ext“ anstelle von „.jpg“ für die Dateierweiterung funktioniert ebenfalls. Ungültige und leere Schemata werden ignoriert und stattdessen wird der Standard verwendet.

[Mehr Erfahren ›](https://docs.photoprism.app/getting-started/config-files/settings/#media-library)

!!! note ""
    Durch das Festlegen eines benutzerdefinierten Importdateipfads **werden bereits importierte Dateien nicht umbenannt**, da dies zu Konflikten mit anderen Tools oder Instanzen führen kann, die möglicherweise auf die Dateien zugreifen. Das Umbenennen vorhandener Dateien kann auch zu Speicher- und/oder Übertragungsaufwand mit Backup-Tools führen, die nicht erkennen, dass Dateien verschoben wurden, d. h. sie können eine neue Sicherungskopie erstellen und/oder übertragen.

## FAQ "Kann ich mit PhotoPrism Dateien in einer konfigurierbaren Ordnerstruktur sortieren?"
Du kannst deine Dateien sortieren, wie du möchtest. Falls dir die Ordner- und Namenskonvention unserer Importfunktion nicht gefällt,
kannst du andere Tools zur Umbenennung verwenden:

* [ExifTool](https://ninedegreesbelow.com/photography/exiftool-commands.html#rename)
* [PhockUp](https://github.com/ivandokov/phockup)
* [Photo Organizer](https://www.systweak.com/photo-organizer)

[Mehr Erfahren >](https://docs.photoprism.app/getting-started/faq/#can-i-use-photoprism-to-sort-files-into-a-configurable-folder-structure)