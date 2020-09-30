# Miniaturansichten #
Für beste Ergebnisse sollten Sie (mindestens) die JPEG-Qualität auf 95 einstellen und den Filter "lanczos" verwenden. Dies erfordert natürlich deutlich mehr Speicher- und CPU-Zeit. Nach unserer Erfahrung ist "cubic" auf modernen Desktop- und Server-CPUs möglicherweise 30% schneller als "lanczos". Denken Sie daran, dass Sie nur einmal Miniaturansichten erstellen müssen und diese dann für den Rest Ihres Lebens genießen können.


## Konfigurationsoptionen ##

`--jpeg-quality value, -q value`

set to 95 for high-quality thumbnails (25-100) (default: 90) [$PHOTOPRISM_JPEG_QUALITY]

`--thumb-size value, -s value`

default thumbnail size limit in pixels (720-3840) (default: 2048) [$PHOTOPRISM_THUMB_SIZE]

`--thumb-limit value, -x value`

on-demand thumbnail size limit in pixels (720-3840) (default: 3840) [$PHOTOPRISM_THUMB_LIMIT]

`--thumb-uncached, -u`

on-demand rendering of default thumbnails (high memory and cpu usage) [$PHOTOPRISM_THUMB_UNCACHED]

`--thumb-filter value, -f value`

resample filter (best to worst: blackman, lanczos, cubic, linear) (default: "lanczos") [$PHOTOPRISM_THUMB_FILTER]

## Example ##

You can limit the size of JPEG thumbnails using the `-s` parameter when you run commands:

```
photoprism -s 720 start
```

The minimum size is 720px. This will render the following images:

![Screenshot 2020-01-08 at 22 10 30](https://user-images.githubusercontent.com/301686/72016344-e5fdfb80-3263-11ea-95b3-00564156140f.png)

500px wird für Kacheln in Suchergebnissen verwendet, die anderen werden meistens für die Klassifizierung benötigt.

Größe ist noch ~550kb mit hoher Qualität (95). Mit niedriger JPEG quality (80), Sie werden es auf bekommen ~100kb:

```
photoprism -s 720 -q 80 start
```

Diese Seite demonstriert und diskutiert die Auswirkungen von JPEG Kompression: http://fotoforensics.com/tutorial-estq.php

Die Bildklassifizierung funktioniert bei scharfen Bildern offensichtlich besser, sodass Sie möglicherweise weniger genaue Beschriftungen mit höherer Komprimierung erhalten. Bitte teilen Sie Ihre Erfahrungen.


Wenn die Größenbeschränkung überschritten wird, z. B. weil Sie einen großen Bildschirm verwenden, werden Originale für die Anzeige von Bildern im Frontend verwendet. Dies kann dazu führen, dass das Bild mit falscher Drehung angezeigt wird, wenn der Browser es nicht automatisch dreht.

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

## Filters ##

Source: https://ijarcce.com/wp-content/uploads/2016/02/IJARCCE-7.pdf

### Linear ###

Die bilineare Interpolation ergibt einen gewichteten Durchschnitt der vier
Nachbarschaftspixel, um seine endgültige Interpolation zu berechnen
Wert. Das Ergebnis ist ein viel glatteres Bild als das Original
Bild. Wenn alle bekannten Pixelabstände gleich sind, wird die
Der interpolierte Wert ist einfach ihre Summe geteilt durch vier.
Diese Technik führt eine Interpolation in beide Richtungen durch.
horizontal und vertikal. Diese Technik liefert ein besseres Ergebnis
als nächste Nachbarinterpolation und nehmen weniger
Rechenzeit im Vergleich zur bikubischen Interpolation.

### Cubic ###

Catmull-Rom ist ein lokaler interpolierender Spline, der für entwickelt wurde
Computergrafikzwecke. Die anfängliche Verwendung erfolgte im Design
von Kurven und Flächen und wurde vor kurzem in verwendet
mehrere Anwendungen. Catmull-Rom Splines sind eine Familie von
kubische interpolierende Splines, die so formuliert sind, dass die
Die Tangente an jedem Punkt wird unter Verwendung der vorherigen und berechnet
nächster Punkt auf dem Spline. Die Ergebnisse ähneln denen
erzeugt durch bikubische Interpolation in Bezug auf
Schärfe, aber die Catmull-Rom-Rekonstruktion ist klar
überlegen im glatten Signalbereich.

### Lanczos ###

Die Lanczos-Interpolationsfunktion ist eine mathematische Formel
wird verwendet, um den Wert eines Digitaldrucks reibungslos zu interpolieren
Bild zwischen seinen Proben. Es bildet jede Stichprobe der
gegebenes Bild zu einer übersetzten und skalierten Kopie der Lanczos
Kernel, eine Sinc-Funktion, die von der Zentrale angezeigt wird
Buckel einer erweiterten Sinc-Funktion. Die Summe davon
übersetzte und skalierte Kernel werden dann am ausgewertet
gewünschtes Pixel. Lanczos Interpolation hat die **Beste
Eigenschaften in Bezug auf Detailerhaltung und minimal
Generierung von Aliasing-Artefakten** für geometrische
Transformationen ohne starke Down-Sampling.
Die Lanczos-Interpolation höherer Ordnung erfordert jedoch hohe Werte
Rechenzeit, die es ungeeignet macht für
die meiste kommerzielle Software.


### Blackman ###

Blackman ist eine Modifikation von Lanczos, mit der sich klingelnde Artefakte besser kontrollieren lassen.


### Examples ###

Original image:

![](img/branches.png)

The same image resized from 600x400px to 150x100px using different resampling filters.
From faster (lower quality) to slower (higher quality):

Filter                    | Resize result
--------------------------|---------------------------------------------
Nearest Neighbor          | ![](img/out_resize_nearest.png) 
Bilinear                  | ![](img/out_resize_linear.png)
Sharp Bicubic             | ![](img/out_resize_catrom.png)
Lanczos                   | ![](img/out_resize_lanczos.png)
