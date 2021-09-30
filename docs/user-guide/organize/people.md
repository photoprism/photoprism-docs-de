PhotoPrism erkennt und gruppiert Gesichter automatisch.

Jedes Mal, wenn du einem Gesicht einen Namen gibst, verbessert PhotoPrism die Gesichts-Cluster.

## Personen ##
Der Bereich Personen zeigt dir bereits identifizierte Personen sowie neue Gesichts-Cluster.

Klicke :material-star:, um eine Person als Favorit zu markieren. Favoriten werden ganz oben angezeigt.

![Screenshot](img/recognized.png)
![Screenshot](img/new.png)

!!!info
    Nicht alle Gesichter gehören zu einem Cluster und werden unter Neu angezeigt. Du findest alle Bilder, mit Gesichtern ohne Namen,
    indem du nach `face:new` suchst. Im [Bearbeitungs-Dialog](edit.md) werden immer alle Gesichter angezeigt.


## Gesichter identifizieren ##
1. Gehe zu *Personen*
2. Gehe zu *Neu*
3. Klicke in das Eingabefeld
4. Beginne einen Namen einzugeben
5. Drücke *Enter*

![Screenshot](img/add-name-new.png)

<!--![Screenshot](img/add-name-new-2.png)-->

Oder

1. Öffne den [*Bearbeitungs-Dialog*](edit.md)
2. Gehe zu *Personen*
3. Klicke in das Eingabefeld
4. Beginne einen Namen einzugeben
5. Drücke *Enter*

![Screenshot](img/add-name-edit.png)

Die Person wird nun unter *Erkannt* angezeigt

## Gesichter verstecken ##
Du kannst Gesichter in *Neu* verstecken, indem du :material-close: klickst.

![Screenshot](img/hide-face.png)

## Alle Bilder einer Person ansehen ##
1. Gehe zu *Personen*
2. Gehe zu *Erkannt*
3. Klicke auf eine Person

![Screenshot](img/view-person.png)

Oder

1. Gehe zu *Suche*
2. Suche nach person:"jane-doe"

![Screenshot](img/view-person-2.png)

## Personen umbenennen ##

1. Gehe zu *Personen*
2. Gehe zu *Erkannt*
3. Klicke auf den Namen
4. Gib einen neuen Namen ein
5. Drücke *Enter*

![Screenshot](img/rename-recognized-0.png)

![Screenshot](img/rename-recognized.png)

## Gesicht einer anderen Person zuordnen ##
Wenn einem Gesicht die falsche Person zugeordnet ist, kannst du dies ändern.

!!!info
    Jedes Mal, wenn du ein Gesicht aus einem Cluster aussortierst, werden die Gesichts-Cluster im Hintergrund aktualisiert.

1. Öffne den [*Bearbeitungs-Dialog*](edit.md)
2. Gehe zu *Personen*
3. Klicke :material-eject:
4. Nun kannst du einen neuen Namen eingeben, oder das Feld leer lassen

![Screenshot](img/reject.png)

## Falsch erkannte Gesichter entfernen ##

1. Öffne den [*Bearbeitungs-Dialog*](edit.md)
2. Gehe zu *Personen*
3. Klicke :material-close:

![Screenshot](img/remove-face.png)

Bevor die Seite neu geladen wird kannst du diese Aktion rückgängig machen.

![Screenshot](img/undo-remove-face.png)

## Alle Bilder einer Person herunterladen ##
1. Gehe zu *Personen*
2. Selektiere eine Person
3. Öffne das Kontext-Menü
4. Klicke :material-download:

## Album aus Personen erstellen ##
1. Gehe zu *Personen*
2. Selektiere eine Person
3. Öffne das Kontext-Menü
4. Klicke :material-bookmark:
5. Wähle ein existierendes Album oder gib einen neuen Albumnamen ein
6. Klicke auf *Hinzufügen*

![Screenshot](img/people-context-menu.png)

## Suche ##
Du kannst Bilder mit bestimmten Personen mit Hilfe der folgenden Suchanfragen finden

- `people`, `faces` oder `faces:true` findet alle Bilder mit Gesichtern
- `faces:false` findet alle Bilder ohne Gesichter
- `faces:3` findet alle Bilder mit mindestens 3 Personen
- `person:"John Doe"` oder `subject:"John Doe"` findet alle Bilder der Person John Doe
- `people:"John"` oder `subjects:"John"` findet alle Bilder von Personen, deren Namen John enthält

Der person/subject sowie der people/subjects Filter kann in Kombination mit & und | verwendet werden (siehe [Suche](search.md)). 
Suchfilter können auch kombiniert werden.

`person:"John Doe&Jane Doe" faces:3` findet alle Bilder auf denen John und Jane Doe und mindestens eine weitere Person abgebildet sind.

![Screenshot](img/people-search.png)


