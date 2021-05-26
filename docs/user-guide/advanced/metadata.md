Wir haben uns zum Ziel gesetzt, so viele Metadaten wie möglich aus deinen Original Dateien aus zu lesen.

Falls du bestimmte EXIF oder XMP Felder nutzt, die wir noch nicht unterstützten, erstelle gerne ein [Ticket](https://github.com/photoprism/photoprism/issues) oder einen Pull Request.

Änderungen werden noch nicht in EXIF oder XMP zurück geschrieben (siehe [Diskussion](https://github.com/photoprism/photoprism/discussions/1092)). 

Damit Metadaten auch unabhängig von PhotoPrism oder der Datenbank verfügbar sind, erstellt PhotoPrism [YAML Backups](./backups.md).
Diese Dateien enthalten alle Metadaten, die du in PhotoPrism setzt, in menschenlesbarer Form.

##Unterstützte Metadaten Tags

PhotoPrism verwendet  [Exiftool](https://exiftool.org/) um Metadaten aus unterschiedlichen Dateitypen wie EXIF, XMP, IPTC etc. zu extrahieren.
Zusätzlich lesen wir noch einige XMP Felder aus.

Die folgende Tabelle zeigt alle Exiftool bzw. XMP Tags, die von PhotoPrism unterstützt werden.

!!!attention
    Falls ein Feld mit Daten aus einer XMP Datei gefüllt ist, ist diese Datei die einzige Datenquelle für dieses Feld.
    Das heißt, dass beispielsweise Keywords aus einer XMP Datei andere Keywords, die von PhotoPrism selbst kommen (z.B. Farben oder Ordnernamen) überschreiben.

PhotoPrism | [Exiftool](https://exiftool.org/) Tag | XMP Tag
:--------------|----------- |:--------
Altitude      | GlobalAltitude                        |
Aperture      | ApertureValue                         |
Artist        | Artist / OwnerName / Creator          | RDF.Description.Creator.Seq.Li 
CameraMake    | Make / CameraMake                     | RDF.Description.Make
CameraModel   | Model / CameraModel                   | RDF.Description.Model
CameraOwner   | CameraOwnerName / OwnerName           | 
CameraSerial  | BodySerialNumber / SerialNumber       |
Codec         | CompressorID / Compression / FileType |
Copyright     | Copyright / Rights                    | RDF.Description.Rights.Alt.Li.Text
Description   | ImageDescription / Description        | RDF.Description.Description.Alt.Li.Text / RDF.Description.Description.Text
DocumentID    | ImageUniqueID / OriginalDocumentID / DocumentID|
Duration      | duration / MediaDuration / TrackDuration |
Exposure      | ExposureTime                          |
Flash         | Flash                                  |
FNumber       | FNumber                               |
FocalLength   | FocalLengthIn35mmFilm / FocalLength   |
Height        | PixelYDimension / ImageLength / ImageHeight / ExifImageHeight / SourceImageHeight         |
Iso           | ISOSpeedRatings / ISO                 |
Keywords      | Keywords | RDF.Description.Subject.Seq.Li |
Latitude / Longitude | GPSPosition / GPSLatitude / GPSLongitude |
LensMake      | LensMake                              | 
LensModel     | LensModel / Lens                      | RDF.Description.LensModel  
Orientation   | Orientation                            |
Projection    | ProjectionType                        |
Rotation      | Rotation |
Subject       | Subject / PersonInImage / ObjectName / HierarchicalSubject / CatalogSets |
TakenAt       | DateTimeOriginal / DateTimeDigitized / CreateDate / DateTime / CreationDate / MediaCreateDate / ContentCreateDate / | RDF.Description.DateCreated
Title         |                                       | RDF.Description.Title.Alt.Li.Text / RDF.Description.Title.Text
Width         | PixelXDimension / ImageWidth / ExifImageWidth / SourceImageWidth        | 

