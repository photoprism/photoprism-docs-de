Originaldateien und Sidecar-Dateien werden nach Exif- und XMP-Daten sowie nach proprietären Metadaten, einschließlich Google Photos JSON, gescannt. 
Zu diesem Zweck verfügt PhotoPrism über einen [integrierten Exif-Parser](https://docs.photoprism.app/developer-guide/metadata/exif/), einen einfachen [XMP-Leser](https://docs.photoprism.app/developer-guide/metadata/xmp/) und kann auch Exiftool verwenden,
um Metadaten in verschiedenen Formaten wie Exif, XMP und IPTC zu extrahieren:

↪  [Unterstützte Exif, XMP, IPTC und DCMI Tags](https://www.photoprism.app/kb/metadata)

Die kombinierten Informationen werden dann normalisiert, kombiniert und mit [zusätzlichen Informationen angereichert](#anreicherung).

!!! tldr ""
    Falls du bestimmte EXIF oder XMP Felder nutzt, die wir noch nicht unterstützten, erstelle gerne ein [Ticket](https://github.com/photoprism/photoprism/issues) oder einen Pull Request.


### Externe Änderungen
Wenn du eines dieser Tags mit externen Tools wie Exiftool oder Digikam aktualisierst, liest PhotoPrism die Änderungen bei der nächsten Indexierung der Datei, sofern das Änderungsdatum der Datei aktualisiert wurde.

### XMP Sidecar Dateien
Falls ein Feld mit Daten aus einer XMP Datei gefüllt ist, ist diese Datei die einzige Datenquelle für dieses Feld.
Das heißt, dass beispielsweise Keywords aus einer XMP Datei andere Keywords, die von PhotoPrism selbst kommen (z.B. Farben oder Ordnernamen) überschreiben.


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
