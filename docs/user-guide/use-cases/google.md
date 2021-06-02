# Wechsel von Google Photos #

Fotosammlungen können problemlos von Google Photos in PhotoPrism übertragen werden.

Um deine Originalbilder mit Metadaten von Google Photos zu bekommen wird [Google Takeout](https://takeout.google.com/) verwendet.

## Dateien übertragen #

1. Gehe zu https://takeout.google.com/
2. Triggere den *Export* deiner Google-Photos Daten
3. Abhängig von der Anzahl/Größe der Fotos kann es einige Tage dauern, bis deine Daten exportiert sind
4. *Lade* deine Daten herunter und fügen sie (einschließlich JSON-Dateien) deinem *Originals* Verzeichnis hinzu
5. [*Indexiere*](../library/indexing.md) die Dateien

## Metadaten

**Google Takeout exportiert folgende Informationen:**

| Typ | Beschreibung | Format |
|:--|:--|:--|
|Fotos|Unbearbeitete sowie bearbeitete Fotos|Original Format z.B. PNG/JPG/WEBP|
|Videos|Videos|Original Format z.B. MP4|
|Album Metadaten|Beispielsweise Album Titel oder Beschreibung|JSON|
|Foto Metadaten|Beispielsweise Erstellungsdatum oder Kommentare|JSON|

**PhotoPrism liest die folgenden Metadaten aus den Foto JSON Dateien aus:**

- Titel
- Beschreibung
- Koordinaten (lat/long)
- Erstellungsdatum

!!! Info
    Google Photos Alben werden noch nicht gänzlich in PhotoPrism übernommen. Wir arbeiten daran.
