# Wechsel von Google Photos #

## Dateien übertragen #

1. Gehe zu [Google Takeout](https://takeout.google.com/)
2. Triggere den *Export* deiner Google-Photos Daten
3. Abhängig von der Anzahl/Größe der Bilder kann es einige Tage dauern, bis deine Daten exportiert sind
4. *Lade* deine Daten herunter und fügen sie (einschließlich JSON-Dateien) deinem *Originals* oder *Import* Verzeichnis hinzu
5. [*Indexiere*](../library/indexing.md) oder [*Importiere*](../library/import.md) die Dateien

## Metadaten

**PhotoPrism liest die folgenden Metadaten aus den Bild JSON Dateien aus:**

- Titel
- Beschreibung
- Koordinaten (lat/long)
- Erstellungsdatum

## Google Photos Alben ##

!!! info ""
    Google Photos Alben werden noch nicht automatisch in PhotoPrism übernommen. Wir arbeiten daran.

Dieses von einem Community-Mitglied erstellte Skript kann Alben aus einem Google Takeout Export in PhotoPrism übertragen:

https://github.com/inthreedee/photoprism-transfer-album

!!! example ""
    **Hilf mit, diese Dokumentation zu verbessern!** Du kannst dazu beitragen, indem du auf :material-pencil: klickst, um einen Pull Request mit deinen Änderungen zu senden.