PhotoPrism legt automatisch YAML-Backupdateien für Alben und Fotos an, damit du die volle Kontrolle 
über deine Daten und Metadaten erhälst.

Backups können in den [Einstellungen](../settings/advanced.md) deaktiviert werden. 

## Album Backups
Backups werden für alle Albentypen erstellt: Album, Ordner, Bundesland, Erlebnis and Monat.

Du findest sie in deinem `storage path` in `/albums`.

### Alben
Für Alben werden folgende Metadaten in dem YAML Dateien gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Sort Order, Country, CreatedAt, UpdatedAt, Photos (UID + date the photo was added to the album)

### Ordner-Alben
Für Ordner-Alben werden folgende Metadaten in dem YAML Dateien gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort order, Country, Year, Month, Day, CreatedAt, UpdatedAt

### Monats-Alben
Für Monats-Alben werden folgende Metadaten in dem YAML Dateien gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort Order, Country, Year, Month, CreatedAt, UpdatedAt

### Bundesland-Alben
Für Bundesland-Alben werden folgende Metadaten in dem YAML Dateien gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort Order, Country, CreatedAt, UpdatedAt

### Erlebnis-Alben
Für Erlebnis-Alben werden folgende Metadaten in dem YAML Dateien gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort Order, Country, Year, CreatedAt, UpdatedAt

## Foto Backups
PhotoPrism erstellt für jedes Foto/Video eine YAML datei in deinem `sidecar path`.

Folgende Metadaten werden für Fotos gespeichert:

* TakenAt + Source, UID, Type, Title + Source, Description + Source, OriginalName, TimeZone, PlaceSrc, Altitude, 
  Lat, Lng, Year, Month, Day, Iso, Exposure, FNumber, FocalLength, Quality, Favorite, Private, Keywords + Source, 
  Notes + Source, Subject + Source, Artist + Source, Copyright + Source, License + Source, CreatedAt, UpdatedAt, EditedAt, DeletedAt (Archived)

## Backup Befehl
PhotoPrism erstellt die Album und Foto YAML Backups automatisch.
Falls du die Album Backups updaten, oder eine Datenbank Backup erstellen möchtest, kannst du den Backup Befehl verwenden.

`docker-compose exec photoprism photoprism backup -a --albums-path PATH -i --index-path PATH [FILENAME]`

* -a = create album backups
* --albums-path = optional, path where album backups will be stored
* -i = create database backup
* --index-path = optional, path for the database backup
* -f = overwrite existing backup files
* A custom index sql backup FILENAME may be passed as first argument. Use - for stdout.

