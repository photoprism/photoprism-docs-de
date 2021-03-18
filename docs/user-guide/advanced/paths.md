Diese Seite beschreibt die von PhotoPrism verwendeten Pfade.

## Originale

Konfigurationsparameter: `PHOTOPRISM_ORIGINALS_PATH`

Dieser Pfad enthält deine gesamte Photogallerie.

## Import

Konfigurationsparameter: `PHOTOPRISM_IMPORT_PATH`

Wenn du dich dafür entscheidest, die [Importfunktion](../library/import-vs-index.md) zu nutzen, kannst du deine Photos hier ablegen, sodass sie von PhotoPrism in deine [Photogallerie](#originale) geladen werden können.

## Speicher

Konfigurationsparameter: `PHOTOPRISM_STORAGE_PATH`

Wenn die Standardkonfiguration verwendet wird, enthält dieser Pfad den Cache, die Sidecar- und Backuppfade, sowie die Datenbankdateien.

### Cache

Konfigurationsparameter: `PHOTOPRISM_CACHE_PATH`

Der Cachepfad beinhaltet den `json`- und `thumbnails`-Pfad.

#### JSON

PhotoPrism erstellt JSON-Dateien, welche mit `exif`-Informationen gefüllt werden und in diesem Verzeichnis abgespeichert werden.
Wenn PhotoPrism diese Dateien nicht erstellen soll, kann diese Funktion in den [Einstellungen](../settings/advanced.md) abgeschaltet werden.

#### Thumbnails

PhotoPrism erstellt Vorschaubilder für jedes Photo in verschiedenen Größen. Diese werden in diesem Pfad abgelegt.
Weitere Informationen zu Thumbnails werden [hier](../settings/advanced.md#images) gegeben.

### Sidecar

Dieser Pfad enthält die [Backup](./backup.md)-Dateien (YAML-Metainformationen) für alle Photos, sowie die JPGs, welche aus RAWs generiert wurden.

### Backup

## Temp

Konfigurationsparameter: `PHOTOPRISM_TEMP_PATH`

In diesem Pfad werden Up- und Downloads vorübergehend abgelegt.

## Asset

Konfigurationsparameter: `PHOTOPRISM_ASSETS_PATH`

Statische Resourcen wie Vorlagen und Modelle werden hier gespeichert.

## Config

Konfigurationsparameter: `PHOTOPRISM_CONFIG_PATH`

Hier werden Konfigurationsdateien hinterlegt.
