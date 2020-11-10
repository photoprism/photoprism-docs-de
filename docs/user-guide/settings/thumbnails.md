# Vorschau (Thumbnail) Einstellungen #

Um das beste Ergebnis zu erzielen, solltest du die *JPEG*-Qualität auf ein Minimum von 95 einstellen und den *Lanczos*-Filter verwenden. Diese Qualität benötigt jedoch einiges an Rechenzeit.
Wir haben die Erfahrung gemacht, dass moderene Desktop- und Server-Prozessoren den *Cubic*-Filter ungefähr 30% schneller als den *Lanczos*-Filter anwenden können. Bei der Wahl der richtigen Einstellungen solltest du bedenken, dass Vorschaubilder nur einmal erzeugt werden und du sie danach für den Rest deines Lebens verwenden kannst.


## Konfigurations Optionen ##

`--jpeg-quality value, -q value`

Setze den Wert auf 95 für hochqualitative Thumbnails. (Wertebereich 25-100, Standardwert 90)  [$PHOTOPRISM_JPEG_QUALITY]

`--thumb-size value, -s value`

Größenbeschränkung für Thumbnails in Pixeln. (Wertebereich 720-3840, Standardwert 2048) [$PHOTOPRISM_THUMB_SIZE]

`--thumb-limit value, -x value`

Größenbeschränkung in Pixeln für on-demand Thumbnails. (Wertebereich 720-3840, Standardwert 3840) [$PHOTOPRISM_THUMB_LIMIT]

`--thumb-uncached, -u`

Aktiviert die on-demand Erstellung von Thumbnails. Dies benötigt viel Arbeitsspeicher und Rechenzeit. [$PHOTOPRISM_THUMB_UNCACHED]

`--thumb-filter value, -f value`

Der zur Erstellung von Thumbnails genutzte Filter. (Mögliche Optionen, sortiert von gut nach schlecht: *Blackman*, *Lanczos*, *Cubic*, *Linear*. Standardwert ist *Lanczos*) [$PHOTOPRISM_THUMB_FILTER]

## Beispiel ##

Die Größe von *JPEG*-Vorschaubildern kann mit dem `-s`-Parameter eingeschränkt werden:

```
photoprism -s 720 start
```

Dadurch wird die minimale Größe auf 720 Pixel gesetzt. Dementsprechend werden die folgenden Bilder erzeugt:

![Screenshot 2020-01-08 at 22 10 30](https://user-images.githubusercontent.com/301686/72016344-e5fdfb80-3263-11ea-95b3-00564156140f.png)

Die Version mit 500 Pixeln Größe wird für Kacheln in den Suchergebnissen verwendet. Die anderen werden größtenteils für die Klassifizierung benötigt.

Die Größe bei hoher Qualität (95) beträgt ungefähr 550 Kilobytes. Mit geringerer *JPEG*-Qualität (80), sinkt die Dateigröße auf ungefähr 100 Kilobytes.

```
photoprism -s 720 -q 80 start
```

Wenn du mehr über die Komprimierungseffekte bei *JPEG*-Dateien erfahren möchtest, ist folgende Seite für dich interessant: [http://fotoforensics.com/tutorial-estq.php](http://fotoforensics.com/tutorial-estq.php)

Die Klassifizierung von Bildern funktioniert mit scharfen Bildern offensichtlich am Besten. Daraus folgt, dass du bei höherer Kompression an Genauigkeit bei der automatischen Erzeugung von *Kategorien* verlierst.

Falls das Größenlimit ausgeschöpft ist, zum Beispiel bei der Verwendung eines sehr großen Bildschirms, werden dir in PhotoPrism immer die Originalbilder angezeigt. Deshalb kann es passieren, dass Bilder falsch rotiert angezeigt werden, da nicht jeder Browser die Bilder automatisch und korrekt rotiert.

## Größen ##


Name      | Source    | Width  | Height  | Use               |
:---------|:----------|:------:|:-------:|:------------------|
colors    | fit_720   | 3      | 3       | colors            |
tile_50   | tile_500  | 50     | 50      | maps              |
tile_100  | tile_500  | 100    | 100     | maps              |
tile_224  | tile_500  | 224    | 224     | tensorflow        |
left_224  | fit_720   | 224    | 224     | tensorflow        |
right_224 | fit_720   | 224    | 224     | tensorflow        |
tile_500  |           | 500    | 500     | preview           |
fit_720   |           | 720    | 720     | lightbox          |
fit_1280  | fit_2048  | 1280   | 1024    | lightbox          |
fit_1920  | fit_2048  | 1920   | 1200    | lightbox          |
fit_2048  |           | 2048   | 2048    | lightbox          |
fit_2560  |           | 2560   | 1600    | lightbox / retina |
fit_3840  |           | 3840   | 2400    | lightbox / retina |

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
