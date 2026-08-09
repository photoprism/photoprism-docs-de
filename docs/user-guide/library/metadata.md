# Unterstützung von Metadaten #

Originaldateien und Sidecar-Dateien werden nach Exif- und XMP-Daten sowie nach proprietären Metadaten, einschließlich Google Photos JSON, gescannt.
Zu diesem Zweck verfügt PhotoPrism über einen [integrierten Exif-Parser](https://docs.photoprism.app/developer-guide/metadata/exif/), einen einfachen [XMP-Leser](https://docs.photoprism.app/developer-guide/metadata/xmp/) für eigenständige `.xmp`-Sidecar-Dateien und kann auch Exiftool verwenden,
um Metadaten in verschiedenen Formaten wie Exif, XMP und IPTC direkt aus den Mediendateien zu extrahieren:

↪  [Unterstützte Exif, XMP, IPTC und DCMI Tags](https://www.photoprism.app/kb/metadata/)

Die kombinierten Informationen werden dann normalisiert, kombiniert und mit [zusätzlichen Informationen angereichert](#anreicherung).

!!! tldr ""
    Falls du bestimmte EXIF oder XMP Felder nutzt, die wir noch nicht unterstützten, erstelle gerne ein [Ticket](https://github.com/photoprism/photoprism/issues) oder einen Pull Request.

### Externe Änderungen
Wenn du eines dieser Tags mit externen Tools wie Exiftool oder Digikam aktualisierst, liest PhotoPrism die Änderungen bei der nächsten Indexierung der Datei, sofern das Änderungsdatum der Datei aktualisiert wurde.

### XMP Sidecar Dateien

Viele Bildbearbeitungsprogramme schreiben ihre Metadaten in eine eigenständige `.xmp`-Datei neben dem Original statt in das Original selbst. PhotoPrism liest diese Sidecar-Dateien beim Indexieren und gibt ihren Werten Vorrang: Ist ein Feld mit Daten aus einer XMP-Datei gefüllt, ist diese Datei die einzige Datenquelle für dieses Feld.

Neben Titel, Beschreibung, Copyright, Kamera, Objektiv und Belichtungsdetails werden auch die folgenden Angaben aus Sidecar-Dateien gelesen:

#### :material-map-marker: Ort ####

GPS-Koordinaten und Höhe werden aus einer Sidecar-Datei gelesen und haben Vorrang vor der im Bild eingebetteten Position. Wenn du ein Foto also in Darktable, digiKam oder Lightroom mit Geodaten versiehst, wird sein Ort bei der nächsten Indexierung in [*Karten*](../organize/places.md) aktualisiert. Koordinaten werden als einfache Dezimalzahlen, in Grad/Minuten/Sekunden sowie in Adobes Schreibweise aus Grad und Dezimalminuten verstanden.

#### :material-account-box: Gesichtsbereiche ####

Namen, die du Gesichtern in Adobe Bridge, Lightroom, digiKam, ACDSee oder Windows zugewiesen hast, können als [Personen](../organize/people.md)-Markierungen übernommen werden, statt sie in PhotoPrism erneut einzugeben. Das funktioniert sowohl mit eigenständigen Sidecar-Dateien als auch mit XMP-Daten im Original und muss zuvor über [*Gesichter aus XMP importieren*](../settings/advanced.md#gesichter-aus-xmp-importieren) aktiviert werden.

#### :material-tag-multiple: Bildinhalt ####

Die Begriffe aus der Liste `dc:subject` einer Sidecar-Datei – in Adobe-Anwendungen das Feld "Keywords" – füllen das Feld *Bildinhalt*, wobei mehrteilige Begriffe so erhalten bleiben, wie sie geschrieben wurden. Sie bleiben durchsuchbar und werden mit deinen vorhandenen [Kategorien](../organize/labels.md) abgeglichen.

↪  [Unterstützte Exif, XMP, IPTC und DCMI Tags](https://www.photoprism.app/kb/metadata/)

### Migration von Clouddiensten
PhotoPrism liest auch Metadaten aus Google Photo's JSON und Apple's XMP Dateien.

- [Von Google Photos migrieren](../use-cases/google.md)
- [Von Apple Photos migrieren](../use-cases/apple.md)

## Anreicherung
PhotoPrism liest nicht nur Metadaten aus Original- und Sidecar-Dateien, sondern reichert die Metadaten mit zusätzlichen Informationen an:

- Datum/Zeit oder Keywords aus Ordner und Dateinamen
- Keywords generiert durch Objekterkennung, Farberkennung und Gesichtserkennung
- GPS Informationen von Ortsschätzungen
- Keywords aus Ortsdetails

## Export
Wir möchten, dass du unabhängig von PhotoPrism und dessen Datenbank auf deine Metadaten zugreifen kannst.
Deshalb erstellt der Indexer zusätzlich menschenlesbare [YAML-Sidecar-Dateien](../backups/export.md), die du bei Bedarf mit einem Texteditor oder anderen Tools öffnen kannst.

!!! tldr ""
    Abgesehen von der [Bildorientierung](../organize/rotate.md) bietet PhotoPrism noch nicht die Möglichkeit, geänderte Metadaten in die Originaldateien zurückzuschreiben, um eventuelle Datenverluste und Konflikte mit Drittanbieter-Apps zu vermeiden.
    Siehe [GitHub-Diskussionen](https://github.com/photoprism/photoprism/discussions/1092).
