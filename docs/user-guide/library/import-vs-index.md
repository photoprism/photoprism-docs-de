# Soll ich meine Originale importieren oder indizieren?


*Importieren* ist ein temporärer Ordner, aus dem Sie Dateien strukturiert in *originals* verschieben oder kopieren können, um Duplikate zu vermeiden. 
Die meisten Benutzer mit vorhandenen Sammlungen möchten ihre Originale direkt indizieren, ohne sie zu importieren. 
damit die vorhandenen Datei- und Verzeichnisnamen gleich bleiben. Auf der anderen Seite 
Das Importieren ist effizienter, wenn Sie Dateien hinzufügen, da Sie nicht alle Originale neu indizieren müssen, um neue Fotos und Videos zu finden.


### Index ###

Verwenden Sie *index*, wenn Sie Ihre Fotos und Videos direkt im Ordner *originals* indizieren möchten, ohne zu kopieren,
verschieben oder umbenennen.

Ihre Ordnerstruktur in *originals* könnte wie folgt aussehen:

   ![bildschirmausdruck](img/before-index.png)
     
**Während der Indizierung:**

* Dateien werden nicht umbenannt oder verschoben
* Ihre vorhandene Ordnerstruktur bleibt erhalten. Sie können entscheiden, dass Ihre Ordner als Alben in PhotoPrism angezeigt werden.
* Metadaten aus Ihren Dateien werden gelesen, um Etiketten, Titel und Speicherorte für Ihre Fotos zu erstellen
* Thumbnails werden für JPEGs gerendert
* Optional werden json- und oder yml-Dateien mit Metadaten erstellt

**Nach der Indizierung des Originalordners könnte dies so aussehen:**

  ![bildschirmausdruck](img/after-index.png)

    

#### Vorteile ####

* Sie behalten Ihre vorhandene Ordnerstruktur
* Sie können Ihre vorhandene Ordnerstruktur in PhotoPrism anzeigen

### Importieren ###

*Importieren* ist effizienter beim Hinzufügen von Dateien, da Sie nicht alle Originale neu indizieren müssen, um neue Fotos und Videos zu finden.
[*Uploads*](upload.md) werden auch als Import behandelt, Sie können (noch) nicht direkt in Originale hochladen.

Ihre anfängliche Ordnerstruktur in *Importieren* könnte wie folgt aussehen:

   ![bildschirmausdruck](img/before-import.png)
   
**Während Importieren:**
 
* Dateien werden aus dem Importverzeichnis in das Originalverzeichnis verschoben oder kopiert
* In den Originalen werden Verzeichnisdateien umbenannt und erhalten eine neue Ordnerstruktur. Der ursprüngliche Name wird als Eigenschaft der Datei gespeichert.
* Alle importierten Dateien werden indiziert

**Nach dem Import mit "Kopieren" (dies ist die Standardeinstellung) könnten Ihre Ordner wie folgt aussehen:**

   ![bildschirmausdruck](img/copy-import.png)

**Nach dem Import mit "Verschieben" können Ihre Ordner wie folgt aussehen:**

   ![bildschirmausdruck](img/move-import.png)

#### Vorteile ####
* Duplikate oder nicht unterstützte Dateien bleiben im Import-Verzeichnis unberührt


!!! Informationen
    Originaldatei- und Ordnernamen werden zum Erstellen von Schlüsselwörtern verwendet. 
    Falls Sie ein Verzeichnis mit dem Pfad "Urlaub/Afrika" importieren und indizieren oder nur indizieren. Alle Dateien aus diesem Ordner erhalten die Schlüsselwörter "Urlaub" und "Afrika".


### Schlussfolgerung ###
Falls Sie keine Organisation in Ihrer vorhandenen Fotosammlung haben und davon ausgehen, dass Sie viele Duplikate auf verschiedenen Festplatten haben.
*Importieren* ist der Weg zu gehen. Es wird alle Ihre Fotos und Videos aufgrund der Zeit zu organisieren und es wird Duplikate zu vermeiden.

Falls Sie Ihre Fotosammlung gut in Ordnern organisiert haben und diese Organisation lieber im Dateisystem angezeigt halten. *Index* ist die richtige Option für Sie.
