# Suche #
Mit Hilfe des *Suchfelds* kann  in allen Bereichen nach Bildern, Videos, Alben oder Labels gesucht werden.

Du kannst nach unerschiedlichsten Kriterien suchen:

* Personen
* Auf dem Bild abgebildete Objekte
* Hauptfarbe eines Bildes
* Dateiname oder Verzeichnisname
* Ort der Aufnahme
* ...

Probier es einfach aus!

   ![Screenshot](img/search-beach.png)

## Suchfilter ##
Zusätzlich zur Suche können auf der Filterleiste folgende Filter gesetzt werden:

* Land, Jahr, Reihenfolge, Kamera, Linse, Farbe, Kategorie

Sind mehrere Filter gesetzt, werden nur Bilder von der Suche berücksichtigt, die allen Filterkriterien entsprechen.

 ![Screenshot](img/color-red.png)

!!! tip ""
    Filter können auch im Suchfeld angegeben werden:

    `label:cat`
    `color:green`
    `type:live`

    Die komplette Liste der Filter findest du weiter unten.
    
   
   ![Screenshot](img/color-green.png)

## UND Suche ##
Du kannst verschiedene Filter kombinieren:

```
mono:true review:false
```

Gefunden werden alle Bilder, die monochrom **UND** nicht in Überprüfen sind.

Manche Suchfilter können mit & verwendet werden:

```bigquery
keywords:buffalo&water
```

Oder:

```bigquery
keywords:"buffalo & water"
```

Diese Suche resultiert in allen Bildern, die die Suchbegriffe buffalo **UND** water haben.

& funktioniert in Kombination mit folgenden Suchfiltern:

* albums, keywords, subject/person, subjects/people.

!!!info ""
    Der label Suchfilter funktioniert nicht mit &. Du kannst alternativ den keywords Filter verwenden, da 
    alle Labels auch Suchbegriffe sind.

## ODER Suche ##
Für eine ODER Suche verwende |:

```
label:cat|dog
```

Hier werden alle Bilder mit Kategorie Katze **ODER** Hund angezeigt.

Folgende Suchfilter unterstützen |:

* albums, color, country, day, month, year, keywords, label, path, state, subject/person, subjects/people, title, type, name, filename, original, hash


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

!!!info ""
    Wildcards können mit & oder | verwendet werden : `filename:"*IMG123*|*_22F6FC19.jpg"`

## Suchfilter Übersicht ##
PhotoPrism unterstützt die folgenden Filter im Suchfeld.

| Filter      | Examples | Notes |
| ----------- | ----------- | - |
| after      |    2015-06-30    | |
| albums | "Holiday 2020" | Album Name |
| archived     |    yes, no    | |
| before      |   2016-12-22     | |
| chroma     |   5     | |
| color  | purple, magenta, pink, red, orange, gold, yellow, lime, green, teal, cyan, blue, brown, white, grey, black       | |
| country     | de | |
| day     |  23    | |
| dist     | 5 | Distanz zu den Koordinaten (radius in km). Nur in Kombination mit den lat/lng Filtern relevant.|
| month     |  5    | |
| year     |  2012    | |
| error     |    yes, no    | |
| faces     |  yes, no, 1, 3    | faces:2 sucht Bilder mit mindestens 2 Gesichtern |
| favorite     |    yes, no    | |
| filename | 2021/07/12345.jpg | |
| fmax     |    4.5  | |
| fmin     |    1.8    | |
| folder | "2020/Holiday", "2020/*" | |
| geo | yes, no | |
| hidden     |    yes, no    | |
| keywords    | love | |
| label      |    cat    | |
| lat     |    38.300457    | Längengrad |
| lng     |   8.931358   | Breitengrad |
| mono     |    yes, no  | Einfarbige Bilder |
| name     | "IMG_9831-112*", "IMG_9831-112" | |
| original     | "IMG_9831-112*", "IMG_9831-112" | Nur relevant, wenn Import verwendet wird |
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
| subject/person  |"Jane Doe" | Subject Name --> Findet nur exakte Übereinstimmungen|
| subjects/people  |"Jane Doe" | Subject Name|
| title     | "Holiday*", "Holiday / 2012" | |
| type     |   image, video, raw, live     | |
| uid       |  pqbcf5j446s0futy       | |
| unsorted     |    yes, no    | |
| video | yes, no | |