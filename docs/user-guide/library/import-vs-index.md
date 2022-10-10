# Dateien einlesen #

Die meisten Benutzer mit einer bestehenden Ordnerstruktur werden ihre Originale direkt [indexieren](./indexing.md) wollen, ohne die optionale Importfunktion zu verwenden, 
sodass die Datei- und Ordnernamen unverändert bleiben.

Beim [Importieren](./import.md) werden die Dateien zunächst aus einem temporären Ordner in den Originals Ordner  übertragen. 
Dabei werden Duplikate automatisch übersprungen, und die importierten Dateien erhalten einen eindeutigen Dateinamen und werden nach Jahr 
und Monat sortiert.

Der Import ist auch eine effiziente Methode zum Hinzufügen von Dateien, da PhotoPrism das Originals Verzeichnis nicht durchsuchen muss, 
um neue Dateien zu finden.

!!! tip ""
    Versteckte Dateien sowie Ordner, die mit `.`, `@`, oder `_` wie `__MACOSX` beginnen, werden automatisch ignoriert. 
    Andere Namen, die ignoriert werden sollen, können in einer .ppignore Datei im Originals oder Import Verzeichnis konfiguriert werden. 
    Diese Datei kann im Hauptordner oder in einem Unterordner ablegt werden.

## Originale Indexieren ##

Verwende *Indexieren*, wenn du deine Bilder und Videos direkt im Ordner *Originals* indexieren möchtest,  wobei die Datei- und Ordnernamen unverändert bleiben.

**Deine Ordnerstruktur in *Originals* könnte so aussehen:**

![Screenshot](img/originals-before-after.png){ class="shadow" }
     
**Während der Indexierung:**

* Dateien werden NICHT umbenannt oder verschoben
* Die vorhandene Ordnerstruktur bleibt erhalten. Ordner können später optional als Alben in PhotoPrism angezeigt werden
* Metadaten der Dateien werden eingelesen, um Kategorien, Titel und Ortsinformationen für deine Bilder zu erstellen
* Für JPEGs werden Thumbnails erstellt
* Optional werden JSON- und oder YAML-Dateien mit Metadaten erstellt

Das *Originals* Verzeichnis nach der Indexierung, es wurde in keiner Weise verändert:

![Screenshot](img/originals-before-after.png){ class="shadow" }

    

### Vorteile ###

* Deine vorhandene Ordnerstruktur wird beibehalten
* Deine vorhandene Ordnerstruktur kann in PhotoPrism anzeigt werden
* Du kannst deine Bilder nach ihrem aktuellen Namen und Speicherort suchen
* Indexieren ist in der Regel schneller, da keine Dateien kopiert oder verschoben werden müssen

!!! tldr ""
    Du kannst deine Dateien innerhalb von *Originals* verschieben. PhotoPrism erkennt den neuen Pfad bei der nächsten Indexierung automatisch

## Dateien Importieren ##

*Importieren* ist effizienter beim Hinzufügen von Dateien, da nicht alle Dateien im *Originals* Ordner neu indexiert werden müssen, um die neuen Bilder und Videos zu finden.
[*Uploads*](upload.md) werden automatisch importiert, du kannst (noch) keine Dateien direkt in das *Originals* Verzeichnis hochladen.

**Deine anfängliche Ordnerstruktur in *Import* könnte wie folgt aussehen:**

   ![Screenshot](img/before-import.png){ class="shadow" }
   
**Während dem Import:**
 
* Dateien werden aus dem *Import* Verzeichnis in das *Originals* Verzeichnis verschoben oder kopiert
* Duplikate werden automatisch übersprungen, "Verschieben" löscht sie auch im Ursprungsverzeichnis
* Importierte Dateien erhalten einen eindeutigen Dateinamen und werden nach Jahr und Monat sortiert
* Der ursprüngliche Dateiname wird als Datei-Eigenschaft gespeichert
* Alle importierten Dateien werden indexiert, der Rest bleibt im Import Verzeichnis

**Ordnerstruktur in *Import* und *Originals* nach Import mit der "Kopieren" Option:**

   ![Screenshot](img/copy-import.png){ class="shadow" }

**Ordnerstruktur in *Import* und *Originals* nach Import mit der "Verschieben" Option:**

   ![Screenshot](img/move-import.png){ class="shadow" }

### Vorteile ###
* Nicht unterstützte Dateien bleiben unberührt im Import Verzeichnis
* Keine Duplikate im Originals Verzeichnis


!!! info ""
    Original Datei- und Ordnernamen werden zum Erstellen von Suchbegriffen verwendet. 
    Falls du ein Verzeichnis mit dem Pfad "Urlaub/Afrika" importierst oder indexierst erhalten alle Dateien aus diesem Ordner die Suchbegriffe "Urlaub" und "Afrika".


## Fazit ##
Falls deine Bildersammlung nicht gut organisiert ist und/oder du viele Duplikate hast, kannst du in Erwägung ziehen, deine Dateien zu importieren, da dadurch Duplikate entfernt werden. 
Beachte, dass importierte Dateien einen eindeutigen Dateinamen erhalten und nach Jahr und Monat sortiert werden.

Wenn du über eine gut organisierte Bibliothek mit aussagekräftigen Datei- und Ordnernamen verfügst, ist es am besten, wenn du deine Originale direkt indexierst 
und die Datei- und Ordnernamen unverändert lässt.
