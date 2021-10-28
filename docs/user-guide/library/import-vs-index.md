# Bildersammlung verwalten #

## Soll ich meine Dateien importieren oder indexieren? ##


Das *Import* Verzeichnis ist ein temporärer Ordner, aus welchem Dateien strukturiert in den *Originals* Ordner verschoben oder kopiert werden, um Duplikate in *Originals* zu vermeiden.
Importierte Dateien erhalten einen kanonischen Dateinamen und werden nach Jahr und Monat sortiert.

Die meisten Nutzer mit bereits gut strukturierten Bildsammlungen möchten ihre Originaldateien direkt indexieren, ohne sie zu importieren, 
damit vorhandene Datei- und Verzeichnisnamen erhalten bleiben. 
Das Importieren ist dagegen deutlich effizienter, wenn später neue Dateien hinzugefügt werden, da nicht alle schon vorhandenen Dateien in *Originals* neu indexiert werden müssen, um die neu hinzugefügten Bilder und Videos zu finden.

!!! tip ""
    Versteckte Dateien sowie Ordner, die mit ```.``` oder ```@``` beginnen, werden automatisch ignoriert. 
    Andere Namen, die ignoriert werden sollen, können in einer .ppignore Datei im Originals oder Import Verzeichnis konfiguriert werden. 
    Diese Datei kann im Hauptordner oder in einem Unterordner ablegt werden.

### Indexieren ###

Verwende *Indexieren*, wenn du deine Bilder und Videos direkt im Ordner *Originals* indexieren möchtest, ohne sie zu kopieren,
zu verschieben oder umzubenennen.

**Deine Ordnerstruktur in *Originals* könnte so aussehen:**

![Screenshot](img/originals-before-after.png)
     
**Während der Indexierung:**

* Dateien werden NICHT umbenannt oder verschoben
* Die vorhandene Ordnerstruktur bleibt erhalten. Ordner können später optional als Alben in PhotoPrism angezeigt werden
* Metadaten der Dateien werden eingelesen, um Kategorien, Titel und Ortsinformationen für deine Bilder zu erstellen
* Für JPEGs werden Thumbnails erstellt
* Optional werden JSON- und oder YAML-Dateien mit Metadaten erstellt

**Der *Originals* Ordner nach der Indexierung:**

![Screenshot](img/originals-before-after.png)

    

#### Vorteile ####

* Deine vorhandene Ordnerstruktur wird beibehalten
* Deine vorhandene Ordnerstruktur kann in PhotoPrism anzeigt werden
* Du kannst deine Dateien innerhalb von *Originals* verschieben. PhotoPrism erkennt den neuen Pfad bei der nächsten Indexierung automatisch

### Importieren ###

*Importieren* ist effizienter beim Hinzufügen von Dateien, da nicht alle Dateien im *Originals* Ordner neu indexiert werden müssen, um die neuen Bilder und Videos zu finden.
[*Uploads*](upload.md) werden automatisch importiert, du kannst (noch) keine Dateien direkt in das *Originals* Verzeichnis hochladen.

**Deine anfängliche Ordnerstruktur in *Import* könnte wie folgt aussehen:**

   ![Screenshot](img/before-import.png)
   
**Während dem Import:**
 
* Dateien werden aus dem *Import* Verzeichnis in das *Originals* Verzeichnis verschoben oder kopiert
* Im *Originals* Verzeichnis werden die Dateien umbenannt und umstrukturiert. Der ursprüngliche Dateiname wird in den Metadaten der Datei gespeichert
* Alle importierten Dateien werden indexiert

**Ordnerstruktur in *Import* und *Originals* nach Import mit der "Kopieren" Option:**

   ![Screenshot](img/copy-import.png)

**Ordnerstruktur in *Import* und *Originals* nach Import mit der "Verschieben" Option:**

   ![Screenshot](img/move-import.png)

#### Vorteile ####
* Nicht unterstützte Dateien bleiben unberührt im Import Verzeichnis
* Keine Duplikate im Originals Verzeichnis


!!! info ""
    Original Datei- und Ordnernamen werden zum Erstellen von Suchbegriffen verwendet. 
    Falls du ein Verzeichnis mit dem Pfad "Urlaub/Afrika" importierst oder indexierst erhalten alle Dateien aus diesem Ordner die Suchbegriffe "Urlaub" und "Afrika".


### Fazit ###
Deine Bildersammlung ist noch nicht organisiert und du gehst davon aus, dass du viele Duplikate, beispielsweise verteilt auf verschiedenen Festplatten, hast?

Dann ist *Importieren* die bessere Wahl.
Der Importvorgang wird deine Dateien nach Erstellungsdatum sortieren und Duplikate vermeiden.


Ist deine Bildersammlung bereits gut in Ordnern organisiert und du möchtest diese Organisation auch im Dateisystem beibehalten?

Dann ist *Indexieren* ist die richtige Option für dich.
