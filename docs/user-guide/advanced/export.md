# Daten exportieren

PhotoPrism sorgt dafür, dass du immer die volle Kontrolle über deine Daten hast.

Kontrolle bezieht sich hierbei nicht nur auf die Möglichkeit, deine Daten durch ein Datenbank-Backup wieder herzustellen, sondern auch darauf, 
dir eine Möglichkeit zu bieten, auf deine Metadaten zuzugreifen, die unabhängig von PhotoPrism ist.

Deshalb legt PhotoPrism neben einem Datenbank-Backup zusätzlich YAML-Backupdateien für Alben und Bilder an.

Backups können in den [Einstellungen](../settings/advanced.md) deaktiviert werden. 

## Album Backups
Backups werden für alle Albentypen erstellt: Album, Ordner, Bundesland, Erlebnis und Monat.

Du findest sie in deinem `storage path` in `/albums`.

### Alben
Für Alben werden folgende Metadaten in den YAML Dateien gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Sort Order, Country, CreatedAt, UpdatedAt, Photos (UID + date the photo was added to the album)

### Ordner-Alben
Für Ordner-Alben werden folgende Metadaten in den YAML Dateien gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort order, Country, Year, Month, Day, CreatedAt, UpdatedAt

### Monats-Alben
Für Monats-Alben werden folgende Metadaten in den YAML Dateien gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort Order, Country, Year, Month, CreatedAt, UpdatedAt

### Bundesland-Alben
Für Bundesland-Alben werden folgende Metadaten in den YAML Dateien gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort Order, Country, CreatedAt, UpdatedAt

### Erlebnis-Alben
Für Erlebnis-Alben werden folgende Metadaten in den YAML Dateien gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort Order, Country, Year, CreatedAt, UpdatedAt

## Bild Backups
PhotoPrism erstellt für jedes Bild/Video eine YAML Datei in deinem `sidecar path`.

Folgende Metadaten werden für Bilder gespeichert:

* TakenAt + Source, UID, Type, Title + Source, Description + Source, OriginalName, TimeZone, PlaceSrc, Altitude, 
  Lat, Lng, Year, Month, Day, Iso, Exposure, FNumber, FocalLength, Quality, Favorite, Private, Keywords + Source, 
  Notes + Source, Subject + Source, Artist + Source, Copyright + Source, License + Source, CreatedAt, UpdatedAt, EditedAt, DeletedAt (Archived)


