PhotoPrism versucht, so viele Metainformationen aus dem originalen Photo zu extrahieren, wie möglich.

Dies ist ein fortlaufender Prozess.
Falls du bestimmte `exif`- oder `xmp`-Felder verwendest, welche aktuell nicht unterstützt werden, mach uns bitte mittels GitHub-Issue oder Pull-Request darauf aufmerksam.

PhotoPrism schreibt aktuell keine `exif`- oder `xmp`-Änderungen in das Original (siehe [diese Diskussion](https://github.com/photoprism/photoprism/discussions/1092) für weitere Informationen).

Wir möchten dir unabhängig von PhotoPrism oder seiner Datenbank vollen Zugriff auf deine Metainformationen gewähren. Aus diesem Grund erstellen wir [Backups](./backup.md) mit menschlich lesbaren YAML-Dateien.

## Unterstützte Tags für Metainformationen

Diese Tabelle gibt dir eine Übersicht darüber, welche PhotoPrism-Felder mit welchen Metadaten gefüllt werden.

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
Description   | ImageDescription / Description        | RDF.Description.Description.Alt.Li.Text
DocumentID    | ImageUniqueID / OriginalDocumentID / DocumentID|
Duration      | duration / MediaDuration / TrackDuration |
Exposure      | ExposureTime                          |
Flash         | Flash                                  |
FNumber       | FNumber                               |
FocalLength   | FocalLengthIn35mmFilm / FocalLength   |
Height        | PixelYDimension / ImageLength / ImageHeight / ExifImageHeight / SourceImageHeight         |
Iso           | ISOSpeedRatings / ISO                 |
Keywords      | Keywords |
Latitude / Longitude | GPSPosition / GPSLatitude / GPSLongitude |
LensMake      | LensMake                              | 
LensModel     | LensModel / Lens                      | RDF.Description.LensModel  
Orientation   | Orientation                            |
Projection    | ProjectionType                        |
Rotation      | Rotation |
Subject       | Subject / PersonInImage / ObjectName / HierarchicalSubject / CatalogSets |
TakenAt       | DateTimeOriginal / DateTimeDigitized / CreateDate / DateTime / CreationDate / MediaCreateDate / ContentCreateDate / |
Title         |                                       | RDF.Description.Title.Alt.Li.Text
Width         | PixelXDimension / ImageWidth / ExifImageWidth / SourceImageWidth        | 