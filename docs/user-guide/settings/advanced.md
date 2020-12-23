# Erweiterte Einstellungen #

## Optionen ##

#### Debug Logs ####
Debug Logs unter *Dateien>Logs* anzeigen.
Änderungen erfordern einen Neustart.

#### Schreibgeschützter Modus ####
Ist diese Option gewählt können Dateien nicht importiert, über die Benutzeroberfläche hochgeladen oder gelöscht werden.

#### Expermientelle Funktionen ####
Aktiviert neue Funktionen, an denen derzeit noch entwickelt wird.

#### Keine Sicherungskopien anlegen ####
Keine YAML-Sicherungskopien für Metadaten von Bildern und Alben erstellen.

Ist diese Option aktiviert werden die folgenden Backups nicht erstellt:

- Metadaten-Backup für Fotos in `storage/sidecar`
- Backups für Alben, Monate, Staaten und Ordner in `storage/albums`

#### WebDAV deaktivieren####
Deaktiviert den eingebauten WebDAV-Server. Änderungen erfordern einen Neustart.

#### Karten deaktivieren ####
Deaktiviert Ortsdaten und Landkarten.

#### ExifTool deaktivieren ####
Keine JSON-Dateien  in `storage/sidecar` mit ExifTool erstellen. Diese werden für die Indexierung zusätzlicher Metadaten, z.B. von Videos, benötigt.

#### TensorFlow deaktivieren####
TensorFlow nicht zur automatischen Bild-Kategorisierung verwenden.

## Bild Qualität ##

Du kannst Einstellungen der Vorschaubild-Qualität im Tab *Erweitert* ändern:

![](img/advanced-settings.jpg)

Um das beste Ergebnis zu erzielen, solltest du die *JPEG*-Qualität auf ein Minimum von 90 einstellen und den *Lanczos*-Filter verwenden. 
Diese Qualität benötigt jedoch einiges an Rechenzeit.

Wir haben die Erfahrung gemacht, dass moderene Desktop- und Server-Prozessoren den *Cubic*-Filter ungefähr 30% schneller als den *Lanczos*-Filter anwenden können. 
Bei der Wahl der richtigen Einstellungen solltest du bedenken, dass Vorschaubilder nur einmal erzeugt werden und du sie danach für den Rest deines Lebens verwenden kannst.

Bei einer JPEG-Qualität von 95 sind die Vorschaubilder ca 500kb groß. Bei einer Qualität von 80 ist die Größe auf ca 100kb reduziert, man 
erkennt allerdings auch Bildartifakte, ähnlich wie in hoch komprimierten Bildern auf Social Media.

Die Objekterkennung funktioniert mit scharfen Bildern besser, mit hoher Kompression werden also auch die Kategorien ungenauer.

## Vorschaubild Größen ##


Name      | Width  | Height  | Use                      |
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

!!! note
    Wenn das eingestellte Größenlimit erreicht ist, z.B. wenn Nutzer einen größeren Bildschirm verwenden, 
    wird im Vollbildmodus das Originalbild angezeigt. Dies kann dazu führen, dass Bilder in der falschen Orientierung dargestellt werden.

## Filter ##

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

### Beispiele ###

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

## Welche Dateien werden von PhotoPrism erstellt? ##

Die kleinstmögliche Größe für statische Thumbnails sind 720px. Mit dieser Einstellung werden die folgenden Bilder im `chache` Verzeichnis erstellt:

```
cache/thumbnails/1/a/3/1a30c1f...9_100x100_center.jpg
cache/thumbnails/1/a/3/1a30c1f...9_224x224_center.jpg
cache/thumbnails/1/a/3/1a30c1f...9_224x224_left.jpg
cache/thumbnails/1/a/3/1a30c1f...9_224x224_right.jpg
cache/thumbnails/1/a/3/1a30c1f...9_3x3_resize.png
cache/thumbnails/1/a/3/1a30c1f...9_500x500_center.jpg
cache/thumbnails/1/a/3/1a30c1f...9_50x50_center.jpg
cache/thumbnails/1/a/3/1a30c1f...9_720x720_fit.jpg
```

Wird das Limit für statische Thumbnails auf 2048px erhöht kommen folgende Bilder dazu:

```
cache/thumbnails/1/a/3/1a30c1f...9_1280x1024_fit.jpg
cache/thumbnails/1/a/3/1a30c1f...9_1920x1200_fit.jpg
cache/thumbnails/1/a/3/1a30c1f...9_2048x2048_fit.jpg
```


## Umwandlung von RAW zu JPEG ##
Viele Fotografen, insbeondere Nutzer einer digitalen SLR, verwenden ein verlustfreies RAW-Format anstelle des verlustbehafteten JPEG-Formats. Es gibt auch [Handies](https://www.fredericpaulussen.be/how-to-raw-photos-huawei-p30-pro/) die RAW-Daten abspeichern können oder das Format HEIC/HEIF nutzen.
Das Ziel von PhotoPrism ist eine umfangreiche Unterstützung für alle [RAW-Formate](https://en.wikipedia.org/wiki/Raw_image_format), unabhängig vom verwendeten Kameramodell. Deshalb bitten wir dich uns eine Nachricht zu schicken, falls du ein Problem mit den Dateien von einem deiner Geräte hast.

Webbrowser können keine RAW-Formate anzeigen. Deshalb muss PhotoPrism diese Dateien zu JPEGs *konvertieren*. Falls du das nicht möchtest, kannst du das in den [Einstellungen](ui.md) ausschalten.

Zusätzlich zu den oben genannten Formaten unterstützt PhotoPrism auch BMP-, GIF-, PNG- und TIFF-Dateien. Bevor du diese Formate zur Speicherung nutzt, solltest du bedenken, dass sie oft keine Metadaten speichern können. Deshalb werden sie in der Regel für Screenshots, Diagramme und Icons verwendet.

![](img/editPhoto.png)

!!! info
    Von PhotoPrism erstellte Sidecar-Dateien werden außerhalb des Originals Verzeichnises gespeichert, so dass die RAW zu JPEG Konvertierung auch im
    Read-Only Modus verfügbar ist.
