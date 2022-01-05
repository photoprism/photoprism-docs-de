# Wechsel von Google Photos #

Bildsammlungen können problemlos von Google Photos in PhotoPrism übertragen werden.

Um deine Originalbilder mit Metadaten von Google Photos zu bekommen wird [Google Takeout](https://takeout.google.com/) verwendet.

## Dateien übertragen #

1. Gehe zu https://takeout.google.com/
2. Triggere den *Export* deiner Google-Photos Daten
3. Abhängig von der Anzahl/Größe der Bilder kann es einige Tage dauern, bis deine Daten exportiert sind
4. *Lade* deine Daten herunter und fügen sie (einschließlich JSON-Dateien) deinem *Originals* Verzeichnis hinzu
5. [*Indexiere*](../library/indexing.md) die Dateien

## Metadaten

**Google Takeout exportiert folgende Informationen:**

| Typ | Beschreibung | Format |
|:--|:--|:--|
|Bilder|Unbearbeitete sowie bearbeitete Bilder|Original Format z.B. PNG/JPG/WEBP|
|Videos|Videos|Original Format z.B. MP4|
|Album Metadaten|Beispielsweise Album Titel oder Beschreibung|JSON|
|Bild Metadaten|Beispielsweise Erstellungsdatum oder Kommentare|JSON|

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
