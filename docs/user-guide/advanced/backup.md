Falls Backups in den [Einstellungen](../settings/advanced.md) aktiviert sind, legt PhotoPrism verschiedene YAML-Backupdateien für Alben und Photos an.

Das machen wir, damit du die vollständige Kontrolle über deine Daten behälst.

Viele andere Anbieter / Dienstleister von ähnlichen Lösungen speichern das Ergebnis deiner Arbeit (z.B. erstellte Tags, Beschreibungen, erstellte Alben, Favoriten, etc.) in nicht leicht einsehbaren Arten und Weisen. Außerdem bieten nur wenige eine vollumfängliche Exportfunktion.

Wir haben uns aus den folgenden Gründen für YAML-Dateien entschieden:

* Menschlich lesbar
* ...

## Album Backups

Es werden Backups für die folgenden Albumtypen erstellt: Album, Ordner, Bundesland, Moment and Monat.
Du kannst diese Backups in deinem `Speicherpfad` in `/albums` finden.

### Album

Für jedes Album werden die folgenden Metainformationen in der YAML-Datei gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Sort Order, Country, CreatedAt, UpdatedAt, Photos (UID + date the photo was added to the album)

### Ordner

Für alle Ordner werden die folgenden Metainformationen in der YAML-Datei festgehalten:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort order, Country, Year, Month, Day, CreatedAt, UpdatedAt

### Monat

Für jeden Monat werden die folgenden Metainformationen in der YAML-Datei gespeichert:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort Order, Country, Year, Month, CreatedAt, UpdatedAt

### Bundesland

Für jedes Bundesland exportieren wir die folgenden Metainformationen in die YAML-Datei:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort Order, Country, CreatedAt, UpdatedAt

### Moment

Für jeden deiner Momente erstellen wir eine YAML-Datei mit den folgenden Metainformationen:

* UID, Slug, Type, Title, Location, Category, Description, Filter, Sort Order, Country, Year, CreatedAt, UpdatedAt

## Photo Backups

Für jedes deiner Photos wird eine YAML-Datei in deinem `Sidecarpfad` abgelegt.

Die folgenden Metainformationen werden dargestellt:

* TakenAt + Source
* UID
* Type
* Title + Source
* Description + Source
* OriginalName
* TimeZone
* PlaceSrc
* Altitude
* Lat
* Lng
* Year
* Month
* Day
* Iso
* Exposure
* FNumber
* FocalLength
* Quality
* Favorite
* Private
* Keywords + Source
* Notes + Source
* Subject + Source
* Artist + Source
* Copyright + Source
* License + Source
* CreatedAt
* UpdatedAt
* EditedAt
* DeletedAt (Archived)