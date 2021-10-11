#Verzeichnisse
Hier findest du eine Übersicht über die Verzeichnisse, die PhotoPrism verwendet.

## Originals
Dieser Pfad wird mit `PHOTOPRISM_ORIGINALS_PATH` gesetzt.
Der `originals` Ordner enthält deine  Bildersammlung. PhotoPrism schreibt nicht in dieses Verzeichnis.

## Import
Dieser Pfad wird mit `PHOTOPRISM_IMPORT_PATH` gesetzt.
Falls du die [Import Funktion](../library/import-vs-index.md) verwendest, befindet sich deine Bildersammlung im `import` Ordner. Von hier werden die Dateien von
PhotoPrism nach `originals` verschoben oder kopiert.

## Storage
Dieser Pfad wird mit `PHOTOPRISM_STORAGE_PATH` gesetzt.

Die Ordner: `cache`, `sidecar` und `config` befinden sich innerhalb des `storage` Ordners, falls nicht anders definiert.
Zusätzlich werden [Album Backups](./backups.md#album-backups) und Datenbank-Dateien in `storage` gespeichert

!!! attention ""
    Der `storage` Ordner darf sich nicht innerhalb von `originals` befinden, da sonst auch Thumbnails indexiert werden.

### Cache
Im `cache` Verzeichnis liegen die `json` and `thumbnails` Verzeichnisse.

Dieser Pfad wird mit `PHOTOPRISM_CACHE_PATH` gesetzt.

#### JSON
Hier erstellt PhotoPrism JSON Dateien. Diese Dateien enthalten von Exiftool ausgelesene Metadaten.
Du kannst Exiftool in den [Einstellungen](../settings/advanced.md) deaktivieren.

#### Thumbnails
PhotoPrism erstellt für jedes Bild Thumbnails in unterschiedlichen Größen. Diese werden in `thumbnails` gespeichert.
Mehr Informatione zu Thumbnails findest du [hier](../settings/advanced.md#images).

### Sidecar
Das `sidecar` Verzeichnis enthält [YAML Backups](./backups.md) für jedes Bild, sowie JPEGs, die von PhotoPrism durch Konvertierung erstellt wurden.
Backups und RAW Kovertierung können in den [Einstellungen](../settings/advanced.md) deaktiviert werden.
Dieser Pfad wird mit `PHOTOPRISM_SIDECAR_PATH` gesetzt.

### Config
Im `config` Ordner können Dateien mit Einstellungs-Details gespeichert sein.
Dieser Pfad wird mit `PHOTOPRISM_CONFIG_PATH` gesetzt.

## Backup
[Datenbank Backup Dateien](./backups.md#backup-command) werden in `backup` gespeichert.
Dieser Pfad wird mit `PHOTOPRISM_BACKUP_PATH` gesetzt.

## Temp
In `temp` werden Uploads und Downloads temporär gespeichert.
Dieser Pfad wird mit `PHOTOPRISM_TEMP_PATH` gesetzt.


## Asset
Der Asset Ordner enthält statische Resourcen wie Models und Templates.
Dieser Pfad wird mit `PHOTOPRISM_ASSETS_PATH` gesetzt.

