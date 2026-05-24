# Gesichtserkennung

PhotoPrism enthält eine Gesichtserkennung, mit der du Bilder deiner Familie und Freunde wiederfindest. Freue dich darauf, längst vergessene Aufnahmen neu zu entdecken! Neue Gesichter werden während des Indexierens deiner Sammlung erkannt und anschließend nach Ähnlichkeit gruppiert, sodass du sie schnell Personen zuordnen kannst.

!!! note ""
    Die Erkennung beginnt erst, wenn deine Sammlung vollständig indexiert wurde. Das Suchen und Aktualisieren von Gesichtern verursacht vorübergehend eine hohe CPU-Belastung und kann je nach Hardware und Anzahl der Bilder eine Weile dauern.

!!! tldr ""
    Vorhandene Cluster werden automatisch im Hintergrund optimiert, z.B. wenn neue Gesichter erkannt werden, du eine falsche Zuordnung gemeldet hast oder neue Dateien zu deiner Sammlung hinzugefügt werden.

## Erkannte und neue Personen ##

Der Bereich Personen zeigt dir bereits erkannte Personen sowie neue Gesichts-Cluster.

Klicke :material-star:, um eine Person als Favorit zu markieren. Favoriten werden ganz oben angezeigt.

![Screenshot](img/recognized-2503-german.jpg){ class="shadow" }
![Screenshot](img/recognized-new-2503-german.jpg){ class="shadow" }

### Warum werden im Bereich NEU nicht alle erkannten Gesichter angezeigt?

Im Bereich *NEU* werden nur erkannte Gesichts-Cluster angezeigt. In deiner Sammlung kann es noch tausende weitere, nicht gruppierte Gesichter geben, wie z. B. Gesichter auf Shampooflaschen
oder im Fernsehen. 

Du kannst diese Bilder finden, indem du nach `face:new` suchst. Falls du bestimmte Bilder suchst, empfehlen wir, die Suche mit anderen Filtern wie `year` oder `country` zu kombinieren. Im *Personen*-Tab des [Bearbeitungs-Dialogs](edit.md) werden alle Gesichter angezeigt, sodass du sie benennen oder eine falsche Zuordnung über die Schaltfläche :material-eject: melden kannst.

### Wenn ein Gesicht nicht erkannt wurde... ###

Gesichter können aus mehreren Gründen nicht erkannt werden:

- Unsere [neueste Version](https://docs.photoprism.app/release-notes/#november-30-2025) beinhaltet eine verbesserte Gesichtserkennung. Nach einem Update solltest du einen [kompletten Rescan](../library/originals.md#index-vollstandig-aktualisieren) durchführen oder `photoprism faces index` [im Terminal ausführen](https://docs.photoprism.app/getting-started/docker-compose/#opening-a-terminal), um weitere zuvor übersehene Gesichter zu finden
- Möglicherweise musst du warten, bis die Indexierung abgeschlossen ist, da die Gesichtserkennung erst danach beginnt
- Bei Bildstapeln wird nur die Primärdatei nach Gesichtern durchsucht
- Gesichter können kleiner als die konfigurierte Mindestgröße sein
- Unsere Gesichtserkennung hat das Bild nicht gründlich genug gescannt
- Eine reduzierte Auflösung sowie Qualität von generierten [Vorschaubildern](../settings/advanced.md) führt zu schlechteren Gesichtserkennungs-Ergebnissen
- Der Kontrast spielt eine große Rolle, so dass ein helles Gesicht mit grauen Haaren auf einem grauen Hintergrund für unsere Gesichtserkennung weniger auffällig sein kann als für dich
- In sehr seltenen Fällen kann ein Gesicht als falsch-positiv eingestuft und daher ignoriert werden

!!! tldr ""
    Die Gesichtserkennung vergleicht die Ähnlichkeit von Gesichtern. Der Ähnlichkeits‑Schwellwert für ein Gesicht
    wird reduziert, wenn du ein Gesicht aus einem Cluster entfernst.

## Gesichter identifizieren ##
=== "Unter Personen"
     1. Gehe zu *Personen*
     2. Gehe zu *Neu*
     3. Klicke in das Eingabefeld
     4. Beginne einen Namen einzugeben
     5. Drücke *Enter*

    ![Screenshot](img/add-name-new-2503-german.jpg){ class="shadow" }

=== " Im Bearbeitungs-Dialog"

     1. Öffne den [*Bearbeitungs-Dialog*](edit.md)
     2. Gehe zu *Personen*
     3. Klicke in das Eingabefeld
     4. Beginne einen Namen einzugeben
     5. Drücke *Enter*

    ![Screenshot](img/add-name-edit-new-2503-german.jpg){ class="shadow" }

     Du kannst Namen auch direkt aus der [Info-Seitenleiste](info-sidebar.md) des Vollbildbetrachters zuweisen. Sie ist außerdem der einzige Ort, an dem du ein Gesicht **manuell markieren** kannst, das PhotoPrism bei der automatischen Erkennung übersehen hat.

Die Person wird nun unter *Erkannt* angezeigt

## Cover für eine Person ändern ##
1. Gehe zum Tab [Personen](./edit.md#personen-bearbeiten) im Bearbeitungs-Dialog des Bildes, auf dem das Gesicht zu sehen ist, das du als Titelbild verwenden möchtest
2. Fahre mit der Maus über :material-dots-vertical: in der oberen rechten Ecke des Gesichts
3. Klicke auf *Als Titelbild festlegen*

## Personen ausblenden ##
Du kannst Personen im Bereich *Erkannt* ausblenden, indem du :material-close: klickst.

!!! attention ""
    Bilder von ausgeblendeten Personen tauchen weiterhin in Suchergebnissen auf.


![Screenshot](img/person-hide-2503-german.jpg){ class="shadow" }

Um alle Personen, inklusive ausgeblendete, zu sehen klicke :material-eye:.

![Screenshot](img/person-show-all-2503-german.jpg){ class="shadow" }

Ausgeblendete Personen werden wieder angezeigt, wenn du :material-eye-off: klickst.

![Screenshot](img/person-recover-2503-german.jpg){ class="shadow" }


## Gesichter ausblenden ##
Du kannst Gesichts-Cluster im Bereich *Neu* auf die gleiche Weise wie [Personen](#personen-ausblenden) ausblenden.

## Alle Bilder einer Person ansehen ##
=== "Unter Personen"
     1. Gehe zu *Personen*
     2. Gehe zu *Erkannt*
     3. Klicke auf eine Person

    ![Screenshot](img/view-person-2503-german.jpg){ class="shadow" }

=== "Über die Suche"
     1. Gehe zu *Suche*
     2. Suche nach person:"jane-doe"

    ![Screenshot](img/view-person-2-2503-german.jpg){ class="shadow" }

## Personen umbenennen ##

1. Gehe zu *Personen*
2. Gehe zu *Erkannt*
3. Klicke auf den Namen
4. Gib einen neuen Namen ein
5. Klicke auf *Speichern*

![Screenshot](img/rename-recognized-2503-german.jpg){ class="shadow" }

![Screenshot](img/rename-recognized-2-2503-german.jpg){ class="shadow" }

## Gesicht einer anderen Person zuordnen ##
Wenn einem Gesicht die falsche Person zugeordnet ist, kannst du dies ändern.

!!!attention ""
    Jedes Mal, wenn du ein Gesicht aus einem Cluster aussortierst, werden die Gesichts-Cluster im Hintergrund aktualisiert.

1. Öffne den [*Bearbeitungs-Dialog*](edit.md)
2. Gehe zu *Personen*
3. Klicke :material-eject:
4. Nun kannst du einen neuen Namen eingeben, oder das Feld leer lassen

![Screenshot](img/reject-2503-german.jpg){ class="shadow" }

Du kannst Zuordnungen auch über die [Info-Seitenleiste](info-sidebar.md) des Vollbildbetrachters ändern.

## Gesichter entfernen ##
Falls etwas Falsches als Gesicht erkannt wurde, oder dich ein Gesicht nicht interessiert, kannst du es entfernen.

1. Öffne den [*Bearbeitungs-Dialog*](edit.md)
2. Gehe zu *Personen*
3. Klicke :material-close:

![Screenshot](img/remove-face-2503-german.jpg){ class="shadow" }

Bevor die Seite neu geladen wird kannst du diese Aktion rückgängig machen.

![Screenshot](img/undo-remove-face-2503-german.jpg){ class="shadow" }

Gesichter können auch über die [Info-Seitenleiste](info-sidebar.md) des Vollbildbetrachters entfernt werden.

## Alle Bilder einer Person herunterladen ##
1. Gehe zu *Personen*
2. Selektiere eine Person
3. Öffne das Kontext-Menü
4. Klicke :material-download:

![Screenshot](img/people-context-menu-down-2503-german.jpg){ class="shadow" }

## Album aus Personen erstellen ##
1. Gehe zu *Personen*
2. Selektiere eine Person
3. Öffne das Kontext-Menü
4. Klicke :material-bookmark:
5. Wähle ein existierendes Album oder gib einen neuen Albumnamen ein
6. Klicke auf *Hinzufügen*

![Screenshot](img/people-context-menu-album-2503-german.jpg){ class="shadow" }

## Suche ##
Du kannst Bilder von bestimmten Personen mit Hilfe der folgenden Suchanfragen finden

- `people`, `faces` oder `faces:true` findet alle Bilder mit Gesichtern
- `faces:false` findet alle Bilder ohne Gesichter
- `faces:3` findet alle Bilder mit mindestens 3 Personen
- `person:"John Doe"` oder `subject:"John Doe"` findet alle Bilder der Person John Doe
- `people:"John"` oder `subjects:"John"` findet alle Bilder von Personen, deren Namen John enthält

Der person/subject sowie der people/subjects Filter kann in Kombination mit & und | verwendet werden (siehe [Suche](../search/filters.md)). 
Suchfilter können auch kombiniert werden.

`person:"John Doe&Jane Doe" faces:3` findet alle Bilder auf denen John und Jane Doe und mindestens eine weitere Person abgebildet sind.

![Screenshot](img/people-search-2503-german.jpg){ class="shadow" }

## Bekannte Probleme ##

Eine vollständige Liste bekannter Probleme findest du unter [Erste Schritte > Bekannte Probleme > Gesichtserkennung](https://docs.photoprism.app/known-issues/#face-recognition).

### Ältere Hardware ###

Die Gesichtserkennung kann auf [älterer Hardware](https://docs.photoprism.app/getting-started/troubleshooting/performance/#legacy-hardware) aufgrund unzureichender Ressourcen langsam sein oder sogar abstürzen.

*Wie die meisten Anwendungen hat auch PhotoPrism [bestimmte Anforderungen](https://docs.photoprism.app/getting-started/#system-requirements) und unser Entwicklungsprozess beinhaltet keine Tests auf nicht unterstützter oder ungewöhnlicher Hardware.*

### Hintergrund-Worker ###

Die Gesichtserkennung wurde unter der Annahme entwickelt und getestet, dass der [Hintergrund-Worker](https://docs.photoprism.app/getting-started/config-options/#indexing) ungefähr alle 15 Minuten läuft, sofern das Backend nicht mit anderen Aufgaben wie der Indexierung beschäftigt ist. Sie wurde nicht mit deutlich längeren Intervallen getestet und ist dafür auch nicht ausgelegt.

Der Hintergrund-Worker gruppiert neue Gesichter nach Ähnlichkeit, vergleicht Gesichter mit Clustern und optimiert bei Bedarf bestehende Cluster. Ohne diese Routineaufgaben wird die Anzahl der zu verarbeitenden Gesichter schnell zu groß. Bei der nächsten Ausführung des Workers kann es dann zu einer starken Serverbelastung kommen, bis alle Gesichter, Gesichts-Cluster und zugehörigen Bilder aktualisiert wurden. Je länger du wartest, desto mehr CPU wird benötigt und desto länger dauert es.

Ein wichtiger Grund, warum der Worker unabhängig von tatsächlichen Änderungen in der Hauptinstanz läuft, ist, dass manche Nutzer Datenbankinhalte direkt verändern oder zusätzliche Instanzen betreiben, etwa zum Indexieren. Dieses Problem lässt sich lösen, braucht aber Zeit. Würden wir das ignorieren und den Worker nicht ständig laufen lassen, könnte das zu vielen zusätzlichen Support-Anfragen führen und uns weiter von der Entwicklung abhalten.

*Der Umgang mit Änderungen über mehrere Instanzen hinweg wird im Laufe der Zeit verbessert, sodass der Worker in zukünftigen Releases seltener laufen muss.*

!!! info "Geplante Funktionen"
    - Import von XMP-Gesichtsmarkierungen
    - Personen beim Durchsuchen deiner Bilder ausschließen
    - automatische Sicherung benannter Personen in YAML-Dateien

*[Gesichts-Cluster]: Ein Cluster ist eine Gruppe von Gesichtern, die aufgrund ihrer Ähnlichkeit derselben Person zugeordnet werden.
