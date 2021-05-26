# Suche #
Mit Hilfe des *Suchfelds* kann  in allen Bereichen nach Fotos, Videos, Alben oder Labels gesucht werden.

Du kannst nach unerschiedlichsten Kriterien suchen:

* Auf dem Foto abgebildete Objekte
* Hauptfarbe eines Fotos
* Dateiname oder Verzeichnisname
* Ort der Aufnahme
* ...

Probier es einfach aus!

   ![Screenshot](img/search-beach.png)

!!! Tipp
    Um gleichzeitig nach mehreren Eigenschaften zu suchen, trenne die Suchbegriffe mit einem Leerzeichen.

    Eine Suche nach `cat blue berlin` wird alle Fotos finden, auf denen eine Katze abgebildet ist, deren Hauptfarbe blau ist oder die in Berlin aufgenommen wurden.

## Filter ##
Zusätzlich zur Suche können auch folgende Filter gesetzt werden:

* Land
* Jahr
* Reihenfolge
* Kamera
* Linse
* Farbe
* Kategorie

Sofern mehrere Filter ausgewählt wurden, werden nur Fotos von der Suche berücksichtigt, die allen Filterkriterien entsprechen.

 ![Screenshot](img/color-red.png)

!!! Tipp
    Filter können auch im Suchfeld angegeben werden:

    `label:cat`
    `color:green`
    `type:live`

    Die komplette Liste der Filter findest du weiter unten.
    
   
   ![Screenshot](img/color-green.png)


### Suchfilter Übersicht ###
PhotoPrism unterstützt die folgenden Filter im Suchfeld.
    
| Filter      | Beispiel | Notizen |
| ----------- | ----------- | - |
| after      |    2015-06-30    | |
| archived     |    yes, no    | |
| before      |   2016-12-22     | |
| chroma     |   5     | |
| color  | purple, magenta, pink, red, orange, gold, yellow, lime, green, teal, cyan, blue, brown, white, grey, black       | |
| country     | "de" | |
| day     |  23    | |
| month     |  5    | |
| year     |  2012    | |
| error     |    yes, no    | |
| faces     |  yes, no, 1, 3    | 1 means minimum 1 face |
| favorite     |    yes, no    | |
| fmax     |    4.5  | |
| fmin     |    1.8    | |
| folder | "2020/Holiday", "2020/*" | |
| geo | yes, no | |
| hidden     |    yes, no    | |
| label      |    cat    | |
| lat     |    38.300457    | Latitude |
| lng     |   8.931358   | Longitude |
| mono     |    yes, no  | Monochrome images |
| name     | "IMG_9831-112*", "IMG_9831-112" | |
| original     | "IMG_9831-112*", "IMG_9831-112" | Only applicable when file have been imported |
| panorama     |    yes, no    | |
| path | "2020/Holiday" | |
| photo | yes, no | |
| portrait     |    yes, no  | |
| primary | yes, no | |
| private     |    yes, no    | |
| quality     |   1, 2, 3, 4, 5   | |
| review     |   yes, no   | |
| scan     |    yes, no    | |
| stack     |    yes, no    | |
| state     | "Baden-Württemberg", "Baden*" | |
| title     | "Holiday*", "Holiday / 2012" | |
| type     |   image, video, raw, live     | |
| unsorted     |    yes, no    | |
| video | yes, no | |

## UND Suche ##
Du kannst verschiedene Filter kombinieren:

```
mono:true review:false
```

Gefunden werden alle Bilder, die monochrom **UND** nicht in Überprüfen sind.

## ODER Suche ##
Für eine ODER Suche verwende |:

```
label:cat|dog
```

Hier werden alle Bilder mit Kategorie Katze **ODER** Hund angezeigt.

## Wildcard ##
Das `*` fungiert in der Suche als Wildcard:

```
name:"IMG_23*"
```

Gefunden werden alle Bilder, deren Namen mit `IMG_23` starten.


```
name:"*_23*"
```

Hier werden alle Bilder gefunden, die  `_23` im Namen enthalten, beispielsweise `IMG_2356.MOV` , `2021_02_23.jpg`, etc.
