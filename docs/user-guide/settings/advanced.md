# Erweiterte Einstellungen #
Diese Seite ermöglicht dir erweiterte Einstellungen an deiner PhotoPrism Instanz vorzunehmen, sowie die Vorschaubild-Erstellung zu konfigurieren.

![](img/advanced-settings.jpg)

Alle Optionen können alternativ über die 
[Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) gesetzt werden.

!!! note
    Wenn du PhotoPrism im public Modus betreibst, sind die erweiterten Einstellungen nicht verfügbar.

## Optionen ##

### Debug Logs ###
Debug Logs unter *Dateien>Logs* anzeigen.
Änderungen erfordern einen Neustart.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_DEBUG`.

### Schreibgeschützter Modus ###
Ist diese Option gewählt können Dateien nicht importiert, über die Benutzeroberfläche hochgeladen oder gelöscht werden.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_READONLY`.

### Expermientelle Funktionen ###
Aktiviert neue Funktionen, an denen derzeit noch entwickelt wird.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_EXPERIMENTAL`.

### Keine Sicherungskopien anlegen ###
Keine YAML-Sicherungskopien für Metadaten von Bildern und Alben erstellen.

Ist diese Option aktiviert werden die folgenden Backups nicht erstellt:

- Metadaten-Backup für Fotos in `storage/sidecar`
- Backups für Alben, Monate, Staaten und Ordner in `storage/albums`

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_DISABLE_BACKUPS`.

### WebDAV deaktivieren###
Deaktiviert den eingebauten WebDAV-Server. Änderungen erfordern einen Neustart.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_DISABLE_WEBDAV`.

### Karten deaktivieren ###
Wenn Karten deaktiviert sind, liest PhotoPrism trotzdem noch Geo-Informationen (Längen- und Breitengrad) aus den Metadaten deiner Dateien aus.
Es wird allerding kein Reverse Lookup mehr gemacht, um Informationen über die Orte, der Koordinaten, abzufragen.

Die Karten Ansicht ist nicht sichtbar.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_DISABLE_PLACES`.

### ExifTool deaktivieren ###
Keine JSON-Dateien  in `storage/sidecar` mit ExifTool erstellen. Diese werden für die Indexierung zusätzlicher Metadaten, z.B. von Videos, benötigt.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_DISABLE_EXIFTOOL`.

### TensorFlow deaktivieren###
TensorFlow nicht zur automatischen Bild-Kategorisierung verwenden.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_DISABLE_TENSORFLOW`.

## Bilder##
Mit folgenden Einstellungen kannst du die Generierung von Vorschaubildern kontrollieren.

### Skalierungsfilter
Du kannst den Algorithmus wählen, der verwendet werden soll, um JPEG Vorschaubilder ('Thumbnails') zu erstellen.

Der *Lanczos* Filter erstellt die qualitativ hochwertigsten Thumbnails, ist aber etwas langsamer, als die anderen. 
Der *Cubic* Filter ist ca 30% schneller.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_THUMB_FILTER`.

#### Beispiele ####

Originalbild:

![](img/branches.png)

Dieses Bild wurde unter der Verwendung von verschiedenen Filtern von 600x400 Pixeln auf 150x100 Pixel skaliert.
Die Liste ist sortiert nach Rechengeschwindigkeit.

An erster Stelle steht der schnellste Filter mit der niedgrigsten Qualität, an letzer Stelle der langsamste Filter mit der besten Qualität.

Filter                    | Ergebnis
--------------------------|---------------------------------------------
Nächster Nachbar          | ![](img/out_resize_nearest.png)
Bilinear                  | ![](img/out_resize_linear.png)
Bikubisch (Scharf)        | ![](img/out_resize_catrom.png)
Lanczos                   | ![](img/out_resize_lanczos.png)

Source: [A Comparative Analysis of Image Interpolation Algorithms](https://ijarcce.com/wp-content/uploads/2016/02/IJARCCE-7.pdf)

### Dynamische Vorschaubilder
Vorschaubilder können on-demand erstellt werden, also erst, wenn sie gebraucht werden. Dies ist beispielsweise beim Betrachten der Fotos der Fall.
Diese Einstellung spart Speicherplatz (da die Thumbnails nicht gespeichert werden), aber braucht viel Rechenleistung.
Wir empfehlen diese Einstellung nicht, wenn PhotoPrism auf einem nicht leistungsstarken Gerät betrieben wird.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_THUMB_UNCACHED`.

### JPG Qualität

Um Thumbnails in best möglicher Qualität zu erhalten, solltest du die *JPEG*-Qualität auf ein Minimum von 90 einstellen und den *Lanczos*-Filter verwenden. 
Generell gilt: je höher die Qualität, desto mehr Speicherplatz brauchen die Thumbnails und desto länger dauert die Generierung.

Qualitäts-Level von >90% werden als hoch eingestuft.
80%-90% gilt als mittlere und 70-80% als niedrige Qualität (z.B. stark komprimierte Fotos auf Social Media). 
Alles mit einer Qualität von unter 70% gilt als sehr niedrig.

Bei einer JPEG-Qualität von 95 sind die Vorschaubilder ca 500kB groß. Bei einer Qualität von 80 ist die Größe auf ca 100kB reduziert.

Die Objekterkennung funktioniert mit scharfen Bildern besser, mit hoher Kompression werden also auch die Kategorien ungenauer.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_JPEG_QUALITY`.

### Dynamic and Static Size Limits

**Dynamische Maximalgröße**: 
Maximalgröße, für Thumbnails, die on demand erstellt werden.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_THUMB_SIZE_UNCACHED`.

**Statische Maximalgröße**:
Maximalgröße, für Thumbnails, die während des Import- bzw Indexiervorgangs erstellt werden.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_THUMB_SIZE`.

!!! warning
    Wenn die eingestellte Maximalgröße überschritten wird (z.B. wenn Nutzer einen großen Bildschirm verwenden),
    ist kein Thumbnail in der angefragten Größe vorhanden und das Originalbild muss angezeigt werden. Dies kann dazu führen, dass Bilder in der falschen Orientierung dargestellt werden.

Die Maximalgröße muss mindestens 720px sein, um zu gewährleisten, dass Thumbnails für die Fotoansichten und die Objekterkennung vorhanden sind.

Wir empfehlen eine hohe Maximalgröße, für die beste Nutzererfahrung beim Bilder betrachten.
Sollte der von Thumbnails belegte Speicherplatz allerdings ein Problem darstellen, kannst du eine niedrigere statische Maximalgröße einstellen.
Setze in diesem Fall eine hohe dynamische Maximalgröße, damit dein Server bei Bedarf Vorschaubilder erstellen kann.
Beachte, dass dies eine hohe Rechenleistung erfordert und es zu einer Verzögerung kommen kann, wenn du Bilder im Vollbildmodus betrachten willst.

!!! tip
    Falls du im Vollbildmodus deine Originalbilder angezeigt bekommen möchtest, aktiviere *Dynamische Vorschaubilder*,
    und setze niedrige dynamische und statische Maximalgrößen (z.B. 720).

## Welche Dateien werden von PhotoPrism erstellt? ##
Die Minimalgröße für statische Thumbnails ist 720px. Wenn diese gesetzt ist, werden alle Bilder bis zu `720x720` erstellt.
Wenn höhere statische Maximalgrößen gesetzt sind, werden zusätzlich Vorschaubilder bis zur eingestellten Größe erstellt.

Die Bilder werden in `storage/cache/thumbnails`gespeichert. Der genaue Pfad ist abhängig von Thumbnail-Größe und Hash der Originaldatei z.B. 
`storage/cache/thumbnails/1/a/3/1a30c1f...9_100x100_center.jpg`

Folgende Tabelle listet die verschiedenen Thumbnailgrößen sowie ihre Anwendung:

Name      | Breite  | Höhe  | Anwendung                     |
:---------|:------:|:-------:|:-------------------------|
colors    | 3      | 3       | Color Detection          |
tile_50   | 50     | 50      | List Preview             |
tile_100  | 100    | 100     | Maps Preview             |
tile_224  | 224    | 224     | Mosaic Preview           |
left_224  | 224    | 224     | TensorFlow               |
right_224 | 224    | 224     | TensorFlow               |
tile_500  | 500    | 500     | Cards Preview            |
fit_720   | 720    | 720     | Mobile, TV               |
fit_1280  | 1280   | 1024    | Mobile, HD Ready TV      |
fit_1920  | 1920   | 1200    | Mobile, Full HD TV       |
fit_2048  | 2048   | 2048    | Tablets, Cinema 2K       |
fit_2560  | 2560   | 1600    | Quad HD, Retina Display  |
fit_3840  | 3840   | 2400    | Ultra HD                 |
fit_4096  | 4096   | 4096    | Ultra HD, Retina 4K      |
fit_7680  | 7680   | 4320    | 8K Ultra HD 2, Retina 6K |

## Umwandlung von RAW zu JPEG ##
Viele Fotografen, insbeondere Nutzer einer digitalen SLR, verwenden ein verlustfreies RAW-Format anstelle des verlustbehafteten JPEG-Formats. Es gibt auch [Handies](https://www.fredericpaulussen.be/how-to-raw-photos-huawei-p30-pro/) die RAW-Daten abspeichern können oder das Format HEIC/HEIF nutzen.
Das Ziel von PhotoPrism ist eine umfangreiche Unterstützung für alle [RAW-Formate](https://en.wikipedia.org/wiki/Raw_image_format), unabhängig vom verwendeten Kameramodell. Deshalb bitten wir dich uns eine Nachricht zu schicken, falls du ein Problem mit den Dateien von einem deiner Geräte hast.

Webbrowser können keine RAW-Formate anzeigen. Deshalb muss PhotoPrism diese Dateien zu JPEGs *konvertieren*. Falls du das nicht möchtest, kannst du das in den [Einstellungen](ui.md) ausschalten.

Zusätzlich zu den oben genannten Formaten unterstützt PhotoPrism auch BMP-, GIF-, PNG- und TIFF-Dateien. Bevor du diese Formate zur Speicherung nutzt, solltest du bedenken, dass sie oft keine Metadaten speichern können. Deshalb werden sie in der Regel für Screenshots, Diagramme und Icons verwendet.

![](img/editPhoto.png)

!!! info
    Von PhotoPrism erstellte Sidecar-Dateien werden außerhalb des Originals Verzeichnis gespeichert, so dass die RAW zu JPEG Konvertierung auch im
    Read-Only Modus verfügbar ist.

### Maximale JPEG-Größe

Maximalgröße für JPEGs die, bei der RAW Konvertierung erstellt werden.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_JPEG_SIZE`.

### Presets anwenden

Aktiviert Benutzerdefinierte Voreinstellungen. Dateien werden möglicherweise langsamer konvertiert.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_RAW_PRESETS`.

### Darktable deaktivieren

Darktable nicht zum Konvertieren von Bildern verwenden.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_DISABLE_DARKTABLE`.

### RawTherapee deaktivieren

RawTherapee nicht zum Konvertieren von Bildern verwenden.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_DISABLE_RAWTHERAPEE`.

### FFmpeg deaktivieren

FFmpeg nicht zum Konvertieren von Videos verwenden.

Der entsprechende [Konfigurations Parameter](https://docs.photoprism.org/getting-started/config-options/) ist `PHOTOPRISM_DISABLE_FFMPEG`.


<!--## Filter ##

Quelle: https://ijarcce.com/wp-content/uploads/2016/02/IJARCCE-7.pdf

### Linear ###

Die bilineare Interpolation berechnet den Wert eines Pixels indem ein gewichteter Mittelwert der vier benachbarten Pixel berechnet wird. Das dabei entstehende Bild ist weicher als das Originalbild. Wenn die Distanzen zu den verwendeten Pixeln gleich sind, dann ist der interpolierte Wert eines Pixels gleich der Summe der Distanzen geteilt durch vier.
Bei der bilinearen Interpolation wird die Interpolation in beiden Richtungen, horizontal und vertikal, durchgeführt. Das Ergebnis ist qualitativ besser als *Nächster Nachbar* und benötigt weniger Rechenzeit als die bikubische Interpolation.

### Kubisch ###

Catmull-Rom ist ein lokal interpolierendes Kurvenintervall was speziell für die Verwendung in der Computergrafik entwickelt wurde. Während die ursprüngliche Verwendung im Design von Oberflächen und Kurven lag, wird es mittlerweile auch in anderen Bereichen eingesetzt. Catmull-Rom Splines gehören zur Familie von kubischen, interpolierenden Splines, so dass die Tangente an jedem Punkt mithilfe des vorherigen und des nächsten Punkts auf dem Kurvenintervall berechnet wird. Das Ergebnis ist ähnlich dem der bikubischen Interpolation im Bezug auf die Schärfe des Ergebnisbildes, aber bei Regionen mit weichen Verläufen ist Catmull-Rom eindeutig überlegen.

### Lanczos ###

Die *Lanczos*-Interpolation ist eine mathematische Formel zur weichen Interpolation eines Bildes, basierend auf verschiedenen Teilen innerhalb des Bildes. Dabei wird jedes Sample auf eine verschobene und skalierte Kopie des Filter-Kerns angewandt. Die Summe dieser Kerne wird dann am aktuell zu berechnenden Pixel ausgewertet. Die *Lanczos*-Interpolation ist **am besten geeignet um Details beizubehalten und ein Minimum an Artefakten zu erhalten**. Jedoch benötigt eine höherwertige *Lanczos*-Interpolation sehr viel Rechenzeit, wodurch es für die meiste kommerzielle Software ungeeignet ist.

### Blackman ###

*Blackman* ist eine modifizierte *Lanczos*-Interpolation die eine bessere Kontrolle über bestimmte Artefakte hat.

-->


