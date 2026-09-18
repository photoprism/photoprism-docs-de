# Verzeichnisse
Hier findest du eine Übersicht über die wichtigsten Verzeichnisse, die PhotoPrism verwendet.

## Originals
Der Ordner `originals` enthält die originalen Foto- und Videodateien deiner Bibliothek. PhotoPrism wird die Dateien in diesem Ordner nicht verschieben oder umbenennen, ohne dass ein Benutzer dies anfordert. Wenn der schreibgeschützte Modus nicht aktiviert ist, können neue Dateien über den [Web-Upload-Dialog](../library/upload.md), die [Importfunktion](../library/import.md) oder durch ["Einbinden des Ordners über WebDAV"](../sync/webdav.md) hinzugefügt werden.

Dieser Pfad kann über die Umgebungsvariable `PHOTOPRISM_ORIGINALS_PATH`, das [entsprechende CLI-Flag](https://docs.photoprism.app/getting-started/config-options/#storage) oder eine [YAML-Konfigurationsdatei](https://docs.photoprism.app/getting-started/config-files/#storage) geändert werden.

[Erfahre mehr ›](https://docs.photoprism.app/getting-started/docker-compose/#photoprismoriginals)

## Storage
Sofern du keine [benutzerdefinierte Konfiguration](../settings/advanced.md) hast, wird der [*storage*-Ordner](https://docs.photoprism.app/getting-started/docker-compose/#photoprismstorage) zum Lesen und Schreiben von [config](#config), [cache](#cache), [backup](#backup), [thumbnail](#thumbnails) und [sidecar](#sidecar) Dateien verwendet.
Wir empfehlen, den *storage*-Ordner [nicht innerhalb des *originals*-Ordners zu konfigurieren](https://docs.photoprism.app/known-issues/#nested-storage-folder), es sei denn, der Name beginnt mit einem `.` als Zeichen dafür, dass er versteckt ist.

Dieser Pfad kann über die Umgebungsvariable `PHOTOPRISM_STORAGE_PATH`, das [entsprechende CLI-Flag](https://docs.photoprism.app/getting-started/config-options/#storage) oder eine [YAML-Konfigurationsdatei](https://docs.photoprism.app/getting-started/config-files/#storage) geändert werden.

[Erfahre mehr ›](https://docs.photoprism.app/getting-started/docker-compose/#photoprismstorage)

### Cache
Im `cache` Verzeichnis liegen die `json` and `thumbnails` Verzeichnisse.

Dieser Pfad kann über die Umgebungsvariable `PHOTOPRISM_CACHE_PATH`, das [entsprechende CLI-Flag](https://docs.photoprism.app/getting-started/config-options/#storage) oder eine [YAML-Konfigurationsdatei](https://docs.photoprism.app/getting-started/config-files/#storage) geändert werden.

[Erfahre mehr ›](https://docs.photoprism.app/getting-started/faq/#why-is-my-storage-folder-so-large-what-is-in-it)

#### JSON
Hier erstellt PhotoPrism JSON Dateien. Diese Dateien enthalten von Exiftool ausgelesene Metadaten.
Du kannst Exiftool in den [Einstellungen](../settings/advanced.md) deaktivieren.

[Erfahre mehr ›](../settings/advanced.md#exiftool-deaktivieren)

#### Thumbnails
PhotoPrism erstellt für jedes Bild Thumbnails in unterschiedlichen Größen. Diese werden in `thumbnails` gespeichert.
Mehr Informationen zu Thumbnails findest du [hier](../settings/advanced.md#vorschaubilder).

[Erfahre mehr ›](../settings/advanced.md#vorschaubilder)

### Sidecar
Der `sidecar` Ordner enthält [YAML-Backup-Dateien](export.md#bild-backups) für jedes Bild sowie automatisch generierte JPEG-Versionen von z.B. RAW-Bildern. Beides kann unter [Einstellungen > Erweitert](../settings/advanced.md) konfiguriert werden.

Dieser Pfad kann über die Umgebungsvariable `PHOTOPRISM_SIDECAR_PATH`, das [entsprechende CLI-Flag](https://docs.photoprism.app/getting-started/config-options/#storage) oder eine [YAML-Konfigurationsdatei](https://docs.photoprism.app/getting-started/config-files/#storage) geändert werden.

[Erfahre mehr ›](../settings/advanced.md#datensicherung)

### Config
Der `config` Ordner enthält Konfigurationsdateien und Zertifikate.

Dieser Pfad kann über die Umgebungsvariable `PHOTOPRISM_CONFIG_PATH`, das [entsprechende CLI-Flag](https://docs.photoprism.app/getting-started/config-options/#storage) oder eine [YAML-Konfigurationsdatei](https://docs.photoprism.app/getting-started/config-files/#storage) geändert werden.

[Erfahre mehr ›](https://docs.photoprism.app/getting-started/config-files/)

### Backup
Der `backup` Ordner enthält sowohl [Datenbank-Dumps als auch Album-Backup-Dateien](index.md#automatische-backups) und befindet sich standardmäßig im `storage` Ordner.

Dieser Pfad kann über die Umgebungsvariable `PHOTOPRISM_BACKUP_PATH`, das [entsprechende CLI-Flag](https://docs.photoprism.app/getting-started/config-options/#backup) oder eine [YAML-Konfigurationsdatei](https://docs.photoprism.app/getting-started/config-files/#backup) geändert werden.

[Erfahre mehr ›](https://docs.photoprism.app/getting-started/config-options/#backup)

## Import
Beim [Importieren](../library/import.md) werden die Dateien aus dem `import` Ordner in den `originals` Ordner kopiert oder verschoben. Dabei werden Duplikate automatisch übersprungen, und die importierten Dateien erhalten einen eindeutigen Dateinamen und werden nach Jahr und Monat sortiert.

Dieser Pfad kann über die Umgebungsvariable `PHOTOPRISM_IMPORT_PATH`, das [entsprechende CLI-Flag](https://docs.photoprism.app/getting-started/config-options/#storage) oder eine [YAML-Konfigurationsdatei](https://docs.photoprism.app/getting-started/config-files/#storage) geändert werden.

[Erfahre mehr ›](https://docs.photoprism.app/getting-started/docker-compose/#photoprismimport)

## Database

Wenn du [MariaDB](https://docs.photoprism.app/getting-started/troubleshooting/mariadb) oder [einen anderen dedizierten Datenbankserver](https://docs.photoprism.app/getting-started/faq/#should-i-use-sqlite-mariadb-or-mysql) anstelle von [SQLite](https://docs.photoprism.app/getting-started/troubleshooting/sqlite) verwendest, werden die Daten in einem separaten *Datenbank*-Ordner gespeichert, dessen Speicherort von [deiner Konfiguration abhängt](https://docs.photoprism.app/getting-started/docker-compose/#database).

[Erfahre mehr ›](https://docs.photoprism.app/getting-started/troubleshooting/mariadb/#server-migration)

## Temp
Uploads, Downloads und andere temporäre Dateien können vorübergehend im `temp` Ordner gespeichert werden.

Dieser Pfad kann über die Umgebungsvariable `PHOTOPRISM_TEMP_PATH`, das [entsprechende CLI-Flag](https://docs.photoprism.app/getting-started/config-options/#storage) oder eine [YAML-Konfigurationsdatei](https://docs.photoprism.app/getting-started/config-files/#storage) geändert werden.

[Erfahre mehr ›](https://docs.photoprism.app/getting-started/config-options/#storage)

## Assets
Der `assets` Ordner enthält statische Resourcen wie Models, Icons und Templates.

Dieser Pfad kann über die Umgebungsvariable `PHOTOPRISM_ASSETS_PATH`, das [entsprechende CLI-Flag](https://docs.photoprism.app/getting-started/config-options/#storage) oder eine [YAML-Konfigurationsdatei](https://docs.photoprism.app/getting-started/config-files/#storage) geändert werden.

[Erfahre mehr ›](https://docs.photoprism.app/getting-started/config-options/#storage)
