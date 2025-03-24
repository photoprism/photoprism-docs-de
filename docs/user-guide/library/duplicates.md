Doppelte Dateien werden erkannt und bei der [Indexierung](./indexing.md) automatisch übersprungen, so dass sie in den Suchergebnissen und Alben nur einmal erscheinen. 
Ihre SHA1-Prüfsummen und Größen werden zum Vergleich herangezogen.

!!! tldr ""
    Das Durchsuchen, Analysieren und Löschen von Duplikaten über das Web UI ist für eine zukünftige Version [geplant](https://github.com/photoprism/photoprism/issues/1308).

## Datei Import
Beim [Importieren](./import.md) werden die Dateien zunächst aus einem temporären Ordner in das Originals Verzeichnis kopiert oder verschoben. Dabei werden Duplikate automatisch übersprungen. 
Beim "Verschieben" werden sie auch im Quellverzeichnis gelöscht, als wären sie erfolgreich verschoben worden.

## Zusammengehörige Dateien ##
Neben Duplikaten, kann es weitere zusammengehörige Dateien in deiner Sammlung geben: 

- raw + jpg + xmp
- jpg  + json
- Original + bearbeitete Version
- Original + komprimierte Version
- Zeitraffer Aufnahmen

Je nach den Dateieinstellungen können solche Dateien automatisch in Stapeln gruppiert werden

↪ [Funktionen > Bildstapel](../organize/stacks.md)

↪ [Einstellungen > Inhalte](../settings/library.md)