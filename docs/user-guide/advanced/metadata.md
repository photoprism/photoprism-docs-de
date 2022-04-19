## Auslesen
Wir haben uns zum Ziel gesetzt, so viele Metadaten wie möglich aus deinen Original Dateien auszulesen.

Falls du bestimmte EXIF oder XMP Felder nutzt, die wir noch nicht unterstützten, erstelle gerne ein [Ticket](https://github.com/photoprism/photoprism/issues) oder einen Pull Request.


### Unterstützte Exiftool & XMP Tags

PhotoPrism verwendet  [Exiftool](https://exiftool.org/) um Metadaten aus unterschiedlichen Dateitypen wie EXIF, XMP, IPTC etc. zu extrahieren.
Zusätzlich lesen wir noch einige XMP Felder aus.

Die folgende Tabelle zeigt alle Exiftool bzw. XMP Tags, die von PhotoPrism unterstützt werden.

!!!attention ""
    Falls ein Feld mit Daten aus einer XMP Datei gefüllt ist, ist diese Datei die einzige Datenquelle für dieses Feld.
    Das heißt, dass beispielsweise Keywords aus einer XMP Datei andere Keywords, die von PhotoPrism selbst kommen (z.B. Farben oder Ordnernamen) überschreiben.

|    PhotoPrism     |   Type    |                                                                       Exiftool                                                                        |          Adobe XMP           |       DCMI       |
|--------------|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------|------------------|
| Aperture     | decimal   | ApertureValue, Aperture                                                                                                                               |                              |                  |
| FNumber      | decimal   | FNumber                                                                                                                                               |                              |                  |
| FPS          | decimal   | VideoFrameRate, VideoAvgFrameRate                                                                                                                     |                              |                  |
| Duration     | duration  | Duration, MediaDuration, TrackDuration                                                                                                                |                              |                  |
| Flash        | flag      | FlashFired                                                                                                                                            |                              |                  |
| Keywords     | list      | Keywords                                                                                                                                              |                              |                  |
| Altitude     | number    | GlobalAltitude, GPSAltitude                                                                                                                           |                              |                  |
| FocalLength  | number    | FocalLength                                                                                                                                           |                              |                  |
| Frames       | number    | FrameCount                                                                                                                                            |                              |                  |
| Height       | number    | PixelYDimension, ImageHeight, ImageLength, ExifImageHeight, SourceImageHeight                                                                         |                              |                  |
| ImageType    | number    | HDRImageType                                                                                                                                          |                              |                  |
| Iso          | number    | ISO                                                                                                                                                   |                              |                  |
| Rotation     | number    | Rotation                                                                                                                                              |                              |                  |
| Width        | number    | PixelXDimension, ImageWidth, ExifImageWidth, SourceImageWidth                                                                                         |                              |                  |
| Artist       | text      | Artist, Creator, OwnerName, Owner                                                                                                                     | Creator                      |                  |
| CameraMake   | text      | CameraMake, Make                                                                                                                                      | Make                         |                  |
| CameraModel  | text      | CameraModel, Model                                                                                                                                    | Model                        |                  |
| CameraOwner  | text      | OwnerName                                                                                                                                             |                              |                  |
| CameraSerial | text      | SerialNumber                                                                                                                                          |                              |                  |
| Codec        | text      | CompressorID, FileType                                                                                                                                |                              |                  |
| ColorProfile | text      | ICCProfileName, ProfileDescription                                                                                                                    |                              |                  |
| Copyright    | text      | Rights, Copyright, WebStatement                                                                                                                       | Rights, Rights.Alt           |                  |
| Description  | text      | Description                                                                                                                                           | Description, Description.Alt |                  |
| DocumentID   | text      | BurstUUID, MediaGroupUUID, ImageUniqueID, OriginalDocumentID, DocumentID                                                                              |                              |                  |
| Exposure     | text      | ExposureTime, ShutterSpeedValue, ShutterSpeed, TargetExposureTime                                                                                     |                              |                  |
| FileName     | text      | FileName                                                                                                                                              |                              |                  |
| GPSLatitude  | text      | GPSLatitude                                                                                                                                           |                              |                  |
| GPSLongitude | text      | GPSLongitude                                                                                                                                          |                              |                  |
| GPSPosition  | text      | GPSPosition                                                                                                                                           |                              |                  |
| InstanceID   | text      | InstanceID, DocumentID                                                                                                                                |                              |                  |
| LensMake     | text      | LensMake                                                                                                                                              |                              |                  |
| LensModel    | text      | Lens, LensModel                                                                                                                                       | LensModel                    |                  |
| License      | text      | UsageTerms, License                                                                                                                                   |                              |                  |
| Notes        | text      | Comment                                                                                                                                               |                              |                  |
| Projection   | text      | ProjectionType                                                                                                                                        |                              |                  |
| Software     | text      | Software, HistorySoftwareAgent, ProcessingSoftware                                                                                                    |                              |                  |
| Subject      | text      | Subject, PersonInImage, ObjectName, HierarchicalSubject, CatalogSets                                                                                  | Subject                      |                  |
| Title        | text      | Title                                                                                                                                                 | dc:title                     | title, title.Alt |
| TakenAt      | timestamp | DateTimeOriginal, CreationDate, CreateDate, MediaCreateDate, ContentCreateDate, DateTimeDigitized, DateTime, SubSecDateTimeOriginal, SubSecCreateDate | DateCreated                  |                  |
| TakenAtLocal | timestamp | DateTimeOriginal, CreationDate, CreateDate, MediaCreateDate, ContentCreateDate, DateTimeDigitized, DateTime, SubSecDateTimeOriginal, SubSecCreateDate |                              |                  |
| TakenGps     | timestamp | GPSDateTime, GPSDateStamp                                                                                                                             |                              |                  |

### Migration von anderen Anwendungen
PhotoPrism liest auch Metadaten aus Google Photo's JSON und Apple's XMP Dateien.

- [Google Photos](../use-cases/google.md)
- [Apple Photos](../use-cases/apple.md)


## Anreichern
PhotoPrism liest nicht nur Metadaten aus Original- und Sidecar-Dateien, sondern reichert die Metadaten mit zusätzlichen Informationen an:

- Datum/Zeit oder Keywords aus Ordner und Dateinamen
- Keywords generiert durch Objekterkennung, Farberkennung und Gesichtserkennung
- GPS Informationen von Ortsschätzungen
- Keywords aus Ortsdetails

## Export
Änderungen werden noch nicht in EXIF oder XMP zurück geschrieben (siehe [Diskussion](https://github.com/photoprism/photoprism/discussions/1092)).

Damit Metadaten auch unabhängig von PhotoPrism oder der Datenbank verfügbar sind, erstellt PhotoPrism [YAML Backups](./backups.md).
Diese Dateien enthalten alle Metadaten, die du in PhotoPrism setzt, in menschenlesbarer Form.