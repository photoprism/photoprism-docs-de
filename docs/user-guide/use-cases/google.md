# Wechsel von Google Photos #

## Dateien übertragen #

1. Gehe zu [Google Takeout](https://takeout.google.com/)
2. Klicke auf `Auswahl aufheben` und wähle dann ausschließlich `Google Fotos` aus
3. Triggere den *Export* deiner Google-Photos Daten
4. Abhängig von der Anzahl/Größe der Bilder kann es einige Tage dauern, bis deine Daten exportiert sind
5. *Lade* deine Daten herunter und entpacke alle Archive in dein *Originals*- oder *Import*-Verzeichnis
    - der Ordner sollte neben den Bildern selbst auch eine JSON-Datei je Bild enthalten
6. [*Indexiere*](../library/originals.md) oder [*Importiere*](../library/import.md) die Dateien

## Metadaten

**PhotoPrism liest die folgenden Metadaten aus den Bild JSON Dateien aus:**

- Titel
- Bildunterschrift
- Koordinaten (lat/long)
- Aufnahmedatum und -zeit
- Erstellungsdatum und -zeit
- Änderungsdatum und -zeit

## Google Photos Alben ##

!!! info ""
    Google Photos Alben werden noch nicht automatisch in PhotoPrism übernommen. Wir arbeiten daran.

Dieses von einem Community-Mitglied erstellte Skript kann Alben aus einem Google Takeout Export in PhotoPrism übertragen:

https://github.com/inthreedee/photoprism-transfer-album

!!! example ""
    **Hilf mit, diese Dokumentation zu verbessern!** Du kannst dazu beitragen, indem du auf :material-pencil: klickst, um einen Pull Request mit deinen Änderungen zu senden.
