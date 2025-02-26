# Häufig gestellte Fragen

## Allgemein ##

??? question "Ist PhotoPrism von irgendwelchen externen Diensten abhängig?"

    Wie in unserer [Datenschutzerklärung](https://www.photoprism.app/privacy) ausführlich erklärt, hängen die Reverse Geocodierung und die interaktiven Weltkarten davon ab, dass die erforderlichen Daten von externen Systemen [von uns](https://www.photoprism.app/contact) und der [MapTiler AG](https://www.maptiler.com/contacts/) mit Hauptsitz in der Schweiz abgerufen werden. Beide Dienste werden mit einem sehr hohen Maß an Datenschutz und Vertraulichkeit angeboten.

    Die Nutzung dieser Dienste ist derzeit [vollständig durch uns abgedeckt](https://docs.photoprism.app/getting-started/faq/#are-the-keys-for-using-interactive-world-maps-provided-free-of-charge). Abhängig von deiner Nutzung kannst du damit viel mehr sparen als die Kosten für eine [PhotoPrism+ Mitgliedschaft](https://www.photoprism.app/membership). Andere Anbieter berechnen in der Regel nutzungsabhängige Gebühren und erlauben möglicherweise auch nicht, die von ihnen bereitgestellten Daten zwischenzuspeichern, was deine Privatsphäre durch unnötige Anfragen gefährdet.

      ↪ [Datenschutzerklärung](https://www.photoprism.app/privacy#section-7){ class="pr-3 block-xs" } ↪ [Compliance FAQ](https://www.photoprism.app/kb/compliance-faq#privacy)

    Um deine Installation erfolgreich einzurichten und Standortdetails in PhotoPrism anzuzeigen, musst du [Anfragen an diese API-Endpunkte zulassen](https://docs.photoprism.app/getting-started/troubleshooting/firewall), wenn du eine Firewall installiert hast, und sicherstellen, dass deine Internetverbindung funktioniert:    

    [![](https://dl.photoprism.app/img/diagrams/proxy-cdn.svg){ class="w100" }](https://docs.photoprism.app/getting-started/troubleshooting/firewall)

    *Andere Open-Source-Anwendungen nutzen manchmal den kostenlosen Kartendienst, der von [openstreetmap.org](https://operations.osmfoundation.org/policies/tiles/) betrieben wird. In diesem Fall gelten deren [Nutzungs-](https://operations.osmfoundation.org/policies/tiles/) und [Datenschutzrichtlinien](https://wiki.osmfoundation.org/wiki/Privacy_Policy), was bedeutet, dass deine Anfragedaten gespeichert und zur [Erstellung öffentlich zugänglicher Berichte](https://planet.openstreetmap.org/tile_logs/) verwendet werden. Dies unterscheidet sich von unserem Ansatz, der sich auf deine Privatsphäre und dein Benutzererlebnis konzentriert.*

??? question "Warum sind einige Funktionen nur für Mitglieder verfügbar?"

    PhotoPrism ist **100% selbstfinanziert und unabhängig**. Freiwillige Spenden decken nicht die Kosten für ein Team, das Vollzeit arbeitet, um dich mit Updates, Dokumentation und Support zu versorgen. Es ist deine Entscheidung, ob du dich anmelden möchtest, um zusätzliche Vorteile zu genießen.
    
    [Mitgliedschafts FAQ ›](https://www.photoprism.app/kb/membership)

??? question "Was sind die Vorteile des Kaufs einer kommerziellen Lizenz?"

    Ein wesentlicher Unterschied zwischen der [Open Source Lizenz](https://docs.photoprism.app/license/agpl/) und  einem [kommerziellen Lizenzvertrag](https://www.photoprism.app/teams) besteht darin, dass du Zugang zu zusätzlichen Support- und Konfigurationsoptionen sowie das Recht erhälst, die Funktionalität an deine Bedürfnisse anzupassen, ohne dass du deine Änderungen veröffentlichen musst. 
    Unsere [Compliance-FAQ](https://www.photoprism.app/kb/compliance-faq) geben Antworten auf die am häufigsten gestellten Fragen zur Produkt-Compliance und Skalierbarkeit.    

    [Team Editionen Vergleichen ›](https://www.photoprism.app/teams#compare)

??? question "Wann genau werden neuen Funktionen veröffentlicht?"

    Unsere [Roadmap](https://link.photoprism.app/roadmap) zeigt, welche Aufgaben in Arbeit sind und welche Funktionen als nächstes implementiert werden. 
    Du kannst Ideen, die dir gefallen, mit einem Daumen hoch bewerten, damit wir wissen, was am beliebtesten ist.

    Wir haben eine Zero Bug Policy und geben unser Bestes, Nuztern zu helfen, wenn sie Fragen haben.
    Aus diesem Grund können wir keine exakten Veröffentlichungstermine für neue Funktionen geben. 
    
    Unser Team erhält viel mehr Anfragen als umgesetzt werden können. Wir möchten daher betonen, dass wir in keiner Weise verpflichtet sind, die von dir angeforderten Funktionen, Verbesserungen oder sonstigen Änderungen umzusetzen. 
    Wir freuen uns jedoch über dein Feedback und werden alle Anfragen sorgfältig prüfen.

    **Da eine [nachhaltige Finanzierung](https://www.photoprism.app/oss/faq) der Schlüssel zur schnellen Veröffentlichung neuer Funktionen ist, ermutigen wir alle Nutzer, unsere Mission zu unterstützen, indem sie [sich als Mitglied anmelden](https://www.photoprism.app/membership) oder eine [kommerzielle Lizenz](https://www.photoprism.app/teams) erwerben.**

## Mitgliedschaften ##

??? question "Wie kann ich meine Mitgliedschaft aktivieren?"

    Um eine neue Instanz mit deinem Mitgliedskonto zu verbinden, musst du dich mit dem Admin-Benutzer anmelden, der bei der Einrichtung automatisch erstellt wird (siehe deine `docker-compose.yml`-Datei oder die App-Store-Dokumentation), und dann die in unserem Aktivierungs-Guide beschriebenen Schritte ausführen.    
    
    [Aktivierungs-Guide ›](https://www.photoprism.app/kb/activation)

??? question "Gibt es Alternativen zu einem wiederkehrenden Abonnement?"

    Ja, unsere Plus-Mitglieder erhalten nach 24 Monaten automatisch eine kostenlose Essentials-Mitgliedschaft auf Lebenszeit. Ebenso erhalten Silber-Mitglieder nach 24 Monaten eine lebenslange Plus-Mitgliedschaft, Gold-Mitglieder nach 12 Monaten und Platin-Mitglieder nach nur 6 Monaten.

    Wenn du dich für eine Silber-, Gold- oder Platin-Mitgliedschaft anmelden möchtest, kannst du das entweder [direkt auf unserer Website](https://my.photoprism.app/register) oder [auf Patreon](https://www.patreon.com/photoprism) tun, wo du auch jährlich mit einem Rabatt von 15% zahlen kannst.

    Beachte, dass du als Lifetime-Mitglied Updates und Support für deinen persönlichen Gebrauch von uns erhältst, anders als bei sogenannten "Lifetime"-Lizenzen, die vielleicht nur bis zur Veröffentlichung der nächsten Hauptversion gültig sind.    
    
    [Mitgliedschaften FAQ ›](https://www.photoprism.app/kb/membership) [Anmelden ›](https://link.photoprism.app/membership)

??? question "Was passiert, wenn ich meine Mitgliedschaft kündige?"

    Wenn du Anspruch auf eine lebenslange Essentials- oder Plus-Mitgliedschaft hast, kannst du diese Funktionen weiterhin nutzen, auch wenn du dich entscheidest, uns nicht mehr zu unterstützen. Ansonsten kannst du weiterhin alle frei verfügbaren Funktionen nutzen. In keinem Fall verlierst du den Zugriff auf deine Bilder.
    
    [Mitgliedschaften Vergleichen >](https://www.photoprism.app/editions#compare)

## Benutzer-Oberfläche ##

??? question "Kann ich mehrere Bilder auf einmal auswählen?"

    Ja, das ist möglich. Wie es funktioniert, hängt davon ab, welche Art von Gerät du benutzt.

    **Desktop Browser**
    
    Wähle das erste Bild aus, indem du auf :material-checkbox-blank-circle-outline: in der unteren rechten Ecke klickst.

    Die Benutzeroberfläche befindet sich jetzt im Auswahlmodus:

    - Um zusätzlich einzelne Bilder auszuwählen, klicke irgendwo auf sie, außer auf die Symbole in der Ecke.
    - Um mehrere Bilder auf einmal auszuwählen, drücke Umschalt+Klick, damit alle Bilder zwischen dem zuletzt ausgewählten Bild und dem Bild, auf das du mit Umschalt+Klick klickst, ausgewählt werden

    **Mobile Geräte**

    Wähle das erste Bild mit einem langen Klick aus.

    Die Benutzeroberfläche befindet sich jetzt im Auswahlmodus:

    - Um zusätzlich einzelne Bilder auszuwählen, klicke/touche irgendwo auf sie, außer auf die Symbole in der Ecke.
    - Um mehrere Bilder auf einmal auszuwählen, mache einen langen Klick, damit alle Bilder zwischen dem zuletzt ausgewählten Bild und dem Bild, auf das du lange klickst, ausgewählt werden

??? question "Kann ich meine Bilder und Alben in Baumstrukturen organisieren?" 
    
    Außerhalb der Bereiche *Dateien > Originale* und *Kategorien* unterstützt PhotoPrism aus folgenden Gründen keine hierarchische Organisation von Dateien:
    
    Zum Einen gibt es schon viele Anwendungen (einschließlich Windows Explorer und Mac OS Finder), die Ordner auf diese Weise anzeigen.
    
    Der Umgang mit Namespaces stellt eine besondere Herausforderung für die Benutzeroberfläche dar.
    Zum Beispiel könnte ein Album mit Namen "Berlin" 5 Mal an unterschiedlichen Stellen in der Hierarchie existieren.
    Um Missverständnissen vorzubeugen müsste man statt nur dem Album immer den kompletten Kontext anzeigen, was auf kleinen Bildschirmen schwer umzusetzen ist.
    
    Persönliche Alben können nach Zeit sortiert sowie mit weiteren Filtern gesucht werden.
    Im Geschäftsumfeld dagegen, werden Baumstrukturen häufig benötigt, um Verantwortlichkeiten und [Zugänge](https://github.com/photoprism/photoprism/issues/455#issuecomment-675859270) zu organisieren.
    Wir werden später eventuell eine extra Version für Geschäftskunden veröffentlichen.
    
    Während du die Freiheit hast, deine Original Dateien und Ordner zu organisieren wie du möchtest, denken wir, dass Baumstrukturen kein Teil der PhotoPrism 
    Benutzeroberfläche sein sollten.
    Die meisten Nutzer können ihre Erinnerungen nicht strikt hierarchisch sortieren und bevorzugen es ihre Bilder in mehreren Dimensionen zu entdecken.

## Karten & Orte ##

??? question "Warum sind einige Bilder an nicht besuchten Orten auf der Karte positioniert?"

    PhotoPrism kann den Standort von Bildern, die ohne GPS-Informationen aufgenommen wurden, schätzen, indem es ihn aus dem Standort anderer Bilder, die am selben Tag aufgenommen wurden, extrapoliert. Diese Schätzungen können [in den Einstellungen](./settings/library.md) deaktiviert werden, wenn du sie nicht möchtest.

??? question "Werden die API Keys für die Nutzung der interaktiven Weltkarten kostenlos zur Verfügung gestellt?"

    Alle Benutzer haben Zugriff auf eine [hochauflösende Vektorkarte](https://maps.photoprism.app/){:target="_blank"}, die wir auf [unserer eigenen Infrastruktur](https://github.com/photoprism/photoprism/issues/2998){:target="_blank"} hosten, sodass kein kommerzieller API-Schlüssel erforderlich ist. Sie basiert auf [von OpenStreetMap veröffentlichten Daten](https://planet.openstreetmap.org/){:target="_blank"} (OSM).

    Darüber hinaus stellen wir [unseren Mitgliedern](https://www.photoprism.app/membership) und [Geschäftskunden](https://www.photoprism.app/teams#compare) automatisch einen API-Schlüssel für den kommerziellen Dienst von MapTiler zur Verfügung, der [Satelliten-, Outdoor- und 3D-Karten](https://www.photoprism.app/kb/personal#maps-and-places) umfasst. Du kannst diese auf [unserer öffentlichen Demo](https://try.photoprism.app/library/places){:target="_blank"} testen.
    
    [Mehr erfahren ›](https://www.photoprism.app/kb/personal#maps-and-places)

??? question "Warum nutzt ihr nicht den kostenlosen Kartendienst von OpenStreetMap?"

    Andere [freie und Open-Source-Software Projekte](https://en.wikipedia.org/wiki/Free_and_open-source_software){:target="_blank"} verwenden manchmal die öffentlichen Karten, die OpenStreetMap für die Entwicklung und das Testen bereitstellt. Diese sind [nicht für Endbenutzeranwendungen](https://operations.osmfoundation.org/policies/tiles/) wie unsere gedacht.

    Die Nutzung dieser Dienste bedeutet auch, dass [ihre Nutzungs-](https://operations.osmfoundation.org/policies/tiles/) und [Datenschutzrichtlinien](https://wiki.osmfoundation.org/wiki/Privacy_Policy) gelten, da deine Anfragedaten gespeichert und zur Erstellung [öffentlich zugänglicher Berichte](https://planet.openstreetmap.org/tile_logs/) verwendet werden. Dies unterscheidet sich von unseren Diensten, die [ein hohes Maß an Datenschutz](https://www.photoprism.app/privacy) gewährleisten und eine bessere Benutzererfahrung mit schnelleren Ladezeiten bieten.

    [Mehr erfahren ›](https://docs.photoprism.app/getting-started/faq/#are-the-keys-for-using-interactive-world-maps-provided-free-of-charge)

## Bibliothek ##

??? question "Welche Datei Typen werden unterstützt?"

    PhotoPrism unterstützt Indexieren, Anzeigen und [Konvertierung](./settings/library.md) der meisten gängigen Bild-, Video- und RAW-Dateiformate, einschließlich JPEG, PNG, GIF, BMP, HEIF, HEIC, MP4, MOV, WebP und WebM. [TIFF wird teilweise unterstützt](https://github.com/golang/go/issues?q=is%3Aissue+image%2Ftiff+) ohne Erweiterungen wie GeoTIFF.

    Bei der Indexierung wird automatisch eine JPEG- oder PNG-Sidecar-Datei für Videos und Bilder in anderen Formaten, wie RAW oder Vektorgrafiken, erstellt. Sie wird für die Erstellung von Thumbnails, die Bildklassifizierung und die Gesichtserkennung benötigt. Die Unterstützung von JPEG XL ist geplant, sobald es allgemein verfügbar ist und genügend kompatible Programme existieren.
    
    Falls installiert, ist die Konvertierung von RAW-Dateien mit den folgenden Konvertern möglich (unser Docker-Image enthält beide):

    - [Darktable](https://www.darktable.org/) ([unterstützte Kameras](https://www.darktable.org/resources/camera-support/))
    - [RawTherapee](https://rawtherapee.com/) ([unterstützte Kameras](https://www.libraw.org/supported-cameras))

    Auf einem Mac können RAW-Dateien auch mit [Sips](https://ss64.com/osx/sips.html) ([unterstützte Kameras](https://support.apple.com/en-us/HT211241)) konvertiert werden.
    Unser Ziel ist es, erstklassige Unterstützung für alle RAW-Formate zu bieten, unabhängig von Kameramarke und -modell.
    Falls du Probleme mit einem bestimmten Dateiformat hast, öffne gerne ein Ticket.

    
    Von [FFmpeg](https://en.wikipedia.org/wiki/FFmpeg#Supported_codecs_and_formats) unterstützte [Videoformate](https://docs.photoprism.app/developer-guide/media/) können zu
    [MPEG-4 AVC](https://en.wikipedia.org/wiki/Advanced_Video_Coding) transkodiert werden, um maximale Browser-Kompatibilität zu gewährleisten. Aus den meisten Videos können auch Standbilder für die Erstellung von Thumbnails extrahiert werden.
    
    Du solltest PhotoPrism so konfigurieren, dass automatisch JSON Sidecar-Dateien erstellt werden, wenn Du Videos, Live-Fotos und/oder [animierte GIFs](https://github.com/photoprism/photoprism/issues/590) hast, damit videospezifische Metadaten wie Codec, Frames und Dauer extrahiert, indexiert und durchsucht werden können.

    Eine vollständige Liste der Dateiformate und -erweiterungen findest du [hier](https://docs.photoprism.app/developer-guide/media/).

??? question "Welche Metadaten-Dateitypen werden unterstützt?"
    
    Derzeit werden folgende Metadaten-Formate unterstützt

    #### JSON ####
    
    Wenn [Exiftool](https://exiftool.org/) nicht über `PHOTOPRISM_DISABLE_EXIFTOOL` oder `--disable-exiftool` deaktiviert ist, wird es verwendet,
    um automatisch eine JSON-Sidecar-Datei für jede Mediendatei zu erstellen. 

    **Auf diese Weise können auch eingebettete XMP- und Video-Metadaten ausgelesen werden.**
    Die native Metadatenextraktion ist auf die üblichen Exif-Header beschränkt. Beachte, dass dies bei der ersten Indexierung einen geringen Overhead erzeugt.
    
    JSON-Dateien können auch für die Fehlersuche nützlich sein, da sie die vollständigen Metadaten enthalten und mit gängigen Entwicklungswerkzeugen und Texteditoren verarbeitet werden können.
    
    *JSON-Dateien, die aus Google Photos exportiert wurden, können ebenfalls gelesen werden. Die Unterstützung für weitere Schemata kann im Laufe der Zeit hinzugefügt werden.*
 
    #### YAML ####
    
    Sofern Metadaten Backups nicht über `PHOTOPRISM_SIDECAR_YAML` deaktiviert sind, erstellt/aktualisiert PhotoPrism automatisch
    [menschenlesbare YAML-Dateien](https://docs.photoprism.app/developer-guide/technologies/yaml/) während der Indexierung und nach manueller Bearbeitung von Feldern wie Titel, Datum oder Ort. 
    Sie dienen als Backup, falls die Datenbank (Index) verloren geht, oder bei der Synchronisation von Ordnern mit einer anderen Instanz.
    
    Wie JSON können auch [YAML-Dateien](https://docs.photoprism.app/developer-guide/technologies/yaml/) mit gängigen Entwicklungswerkzeugen und
    Texteditoren geöffnet werden. Änderungen werden jedoch nicht mit dem ursprünglichen Index synchronisiert, da dadurch bestehende Daten überschrieben werden könnten.
 
    #### XMP ####
    
    XMP (Extensible Metadata Platform) ist ein XML-basiertes Metadaten-Containerformat [entwickelt von Adobe](https://www.adobe.com/products/xmp.html).
    Es bietet deutlich mehr Felder (als Teil von eingebetteten Modellen wie Dublin Core) als Exif. Dies macht es auch schwierig - wenn nicht
    wenn nicht gar unmöglich - eine vollständige Unterstützung zu bieten. Das Lesen von Titel, Copyright, Künstler und Beschreibung aus XMP-Sidecar-Dateien ist
    als Proof-of-Concept implementiert, [Contributions sind willkommen](https://docs.photoprism.app/developer-guide/metadata/xmp/). Die Indexierung von
    eingebetteten XMP-Dateien ist nur über Exiftool möglich, siehe oben.

??? question "Warum werden meine Videos nicht indexiert?"

    Wenn [FFmpeg deaktiviert](settings/advanced.md#ffmpeg-deaktivieren) oder nicht installiert ist, können Videos nicht indexiert werden, da keine Standbilder erstellt werden können.
    Außerdem solltest du [Exiftool](settings/advanced.md#exiftool-deaktivieren) aktiviert haben, um Metadaten wie Dauer, Auflösung und Codec zu extrahieren.

??? question "Ich vermisse einige Dateien, wo könnten sie sein?"
   
    Falls du den [Qualitätsfilter](organize/review.md) aktiviert hast, findest du deine Bilder eventuell im Bereich *Überprüfen*.
    Es kann auch sein, dass das Format der Bilder nicht unterstützt wird, oder die Bilder kaputt sind.
    Haben mehrere Dateien den gleichen Namen oder exakt das gleiche Datum und den gleichen Aufnahmeort oder die gleiche ID,
    werden diese zu einem Bildstapel gruppiert. Du findest sie im Bereich *Bildstapel* und kannst die Gruppierung dort aufheben, sofern sie fehlerhaft ist.

    [Checklist ansehen ›](https://docs.photoprism.app/getting-started/troubleshooting/#missing-pictures)

??? question "Unter welchen Bedingungen können Dateien gruppiert werden?" 

    1. Gleichnamige Dateien, die sich im selben Ordner befinden, z.B. `/2018/IMG_1234.jpg` und  `/2018/IMG_1234.avi`, werden immer gruppiert.
    2. Dateien mit fortlaufenden Namen, wie `/2018/IMG_1234 (2).jpg` und `/2018/IMG_1234 (3).jpg`, können optional gruppiert werden.
    3. Dateien, deren Metadaten zeigen, dass sie am selben Ort und in der selben Sekunde aufgenommen wurden, können optional gruppiert werden.
    4. Dateien mit der gleichen *Unique Image ID* oder *XMP Instance ID* können optional gruppiert werden.

    Du kannst das Verhalten der Punkte 2-4 in den [*Einstellungen*](./settings/library.md#bildstapel) konfigurieren.

    Beachte, dass es **nicht möglich ist, die Gruppierung von Dateien mit demselben Namen zu deaktivieren**, da sonst wichtige Funktionen nicht mehr funktionieren würden. Beipsielsweise die Unterstützung von Apple [Live Photos](organize/video.md#live-fotos) (die aus einer Foto- und einer Videodatei bestehen) sowie anderen Multidatei-/Hybridformaten wie RAW/JPEG und die Indexierung von Metadaten aus XMP/JSON Sidecar-Dateien.

??? question "Werden gruppierte Dateien automatisch getrennt, wenn die ich Einstellungen ändere?"

    Wenn du die Bildstapel-Einstellungen unter *[Einstellungen > Bibliothek](settings/library.md)* änderst, werden Dateien, die bereits gruppiert sind, **nicht automatisch voneinander getrennt**. Das liegt daran, dass das Entstapeln ein ressourcenintensiver Vorgang ist, bei dem jede Datei neu indexiert werden muss.

    Das Ergebnis hängt auch von der genauen Reihenfolge ab, in der du die Dateien entstapelst, da z. B. Nicht-Medien-Sidecar-Dateien an die verbleibende Mediendatei in einem Stapel gebunden bleiben. Wir denken darüber nach, in einer zukünftigen Version einen entsprechenden Befehl bereitzustellen.
 
    Wenn du PhotoPrism zum ersten Mal verwendest und deine Bibliothek mit anderen Einstellungen neu indexieren möchtest, kannst du den Befehl `photoprism reset` [in einem Terminal](https://docs.photoprism.app/getting-started/docker-compose/#command-line-interface) ausführen, um den Index zurückzusetzen und von vorne zu beginnen. [Mehr erfahren >](https://docs.photoprism.app/getting-started/docker-compose/#examples)

??? question "Es sind bereits einige meiner Bilder indexiert. Warum befinden sich noch keine Bilder in den Bereichen Ordner, Kalender und Ereignisse?"
   
    Bilder werden erst am Ende der Indexierung zu den Bereichen Ordner, Kalender und Ereignisse hinzugefügt.

??? question "Warum zeigt die Navigation unterschiedliche Zahlen für *Suche* und *Originale* an?"

    Der Bereich *Dateien > Originale* zeigt Dateien an, während in *Suche* Bilder und Videos dargestellt werden.
    
    Bilder und Videos können aus mehreren Dateien bestehen:

    * RAW + JPG + XMP = 1 Bild, 3 Dateien
    * MP4 + JPG = 1 Video, 2 Dateien

    Es kann auch sein, dass mehrere JPG Dateien zu einem Bild gruppiert sind (z.B. eine original und eine bearbeitete Version).

??? question "Wann sollte ich meinen Index vollständig aktualisieren?"

    Wir empfehlen, nach größeren Aktualisierungen einen kompletten Rescan durchzuführen, um die Vorteile der neuen Suchfilter und Sortieroptionen zu nutzen. 
    Lies unbedingt [die Hinweise zu jeder Version](https://docs.photoprism.app/release-notes/), um herauszufinden, welche Änderungen vorgenommen wurden und ob sie sich auf deine Bibliothek auswirken könnten, z. B. wegen der Dateitypen, die du hast, oder weil neue Suchfunktionen hinzugefügt wurden. 
    Wenn du auf Probleme stößt, die du anders nicht lösen kannst (also bevor du einen Fehler meldest), versuche bitte auch einen Rescan und schaue, ob das Problem dadurch gelöst wird.

    Du kannst einen [Rescan über die Benutzeroberfläche](library/indexing.md) starten, indem du zu *Dateien* > *Index* navigierst, "Index vollständig aktualisieren" auswählst und dann auf "Start" klickst.
    Manuell eingegebene Informationen wie Kategorien, Personen, Titel oder Beschreibungen werden bei der Indexierung nicht verändert, selbst wenn du den Index vollständig aktualisierst.

??? question "Wie kann ich Dateien endgültig löschen?"

    Du kannst Dateien über die Web-Oberfläche [löschen](./organize/delete.md).

??? question "In welchen Fällen können Dateien im Originals Ordner geändert werden?"

    PhotoPrism schreibt in der Regel nicht im *Originals* Ordner, mit folgenden Ausnahmen: (1) Wenn du ein Bild in der Benutzeroberfläche rotierst, muss sein Exif-Header aktualisiert werden. (2) Du hebst die Stapelung von Dateien auf, die aufgrund ihres Namens gestapelt wurden, so dass sie umbenannt werden müssen. (3) Du fügst Dateien über die Importfunktion oder den Web-Upload hinzu. (4) Du löschst Dateien manuell über die Benutzeroberfläche. (5) Du hast den Ordner *Originals* als deinen Sidecar-Ordner konfiguriert. (6) Du greifst mit einem WebDAV-Client auf den *Originals* Ordner zu, um deine Dateien zu verwalten, ohne dass der *Schreibschutzmodus* aktiviert ist.

## RAW Dateien ##

??? question "Was ist eine RAW-Bilddatei?"

    Professionelle und semiprofessionelle Fotografen bewahren ihre Originale oft in einem [verlustfreien RAW-Format](https://en.wikipedia.org/wiki/Raw_image_format) auf, das den Aufnahmen mit dem physischen Sensor entspricht, und nicht in einem komprimierten Bildformat wie JPEG, besonders wenn sie mit einer digitalen Spiegelreflexkamera fotografieren. Auch neuere Handys können Bilder im RAW-Format aufnehmen. Unser Ziel ist es, erstklassige Unterstützung für [alle RAW-Dateien](https://docs.photoprism.app/getting-started/faq/#what-media-file-types-are-supported) zu bieten, unabhängig von Kameramarke und -modell. Eine vollständige Liste der Dateitypen und -erweiterungen findest du in unserer [Knowledge Base](https://www.photoprism.app/kb/file-formats).
    
    Da Webbrowser RAW-Dateien in der Regel nicht direkt anzeigen können, müssen sie konvertiert werden. Das geschieht beim [Import](library/import.md) oder beim [initialen Indexieren](library/indexing.md). Die Konvertierung kann auch manuell [in einem Terminal](https://docs.photoprism.app/getting-started/docker-compose/#command-line-interface) mit dem Befehl `photoprism convert` durchgeführt werden.

??? question "Werden JPEGs aktualisiert, wenn sich RAW- oder XMP-Dateien ändern?"

    JPEGs werden derzeit nicht neu generiert, wenn sich zugehörige RAW- oder XMP-Dateien ändern. RAW-Dateien sind von vornherein digitale Negative. PhotoPrism geht daher davon aus, dass ihre Bildinformationen unveränderlich sind.

    XMP-Dateien können das Erscheinungsbild beeinflussen, aber die meisten der darin enthaltenen Metadaten, wie z. B. Titel und Beschreibung, sind davon nicht betroffen. 
    Die Erstellung von JPEGs aus RAW-Dateien ist eine zeitaufwändige Aufgabe und würde in den meisten Fällen einen enormen, nicht zu rechtfertigenden Overhead verursachen. 
    Hinzu kommt, dass die Rendering-Informationen in XMP-Dateien nicht gut standardisiert sind. So sind beispielsweise Änderungen, die Sie in Photoshop vornehmen, möglicherweise nicht mit Darktable kompatibel.

    Wir empfehlen, vorhandene JPEG-Sidecar-Dateien bei Bedarf manuell zu aktualisieren oder zusätzliche JPEGs zu erstellen, damit Sie zwischen verschiedenen Versionen wählen können. Neue Dateien und andere Metadatenänderungen werden wie üblich beim Scannen Ihrer Bibliothek erkannt und in den Index aufgenommen.

??? question "Bleiben Bearbeitungen bei der Konvertierung eines RAW-Bildes mit einer XMP-Sidecar-Datei erhalten?"

    PhotoPrism unterstützt derzeit Darktable und RawTherapee als RAW-Konverter. Darktable unterstützt XMP-Sidecar-Dateien vollständig, RawTherapee nur teilweise. XMP ist jedoch nur ein "Container"-Format, daher unterscheiden sich die Felder (Namensräume), die dort verwendet werden, um anzugeben, wie ein Bild konvertiert werden soll (sowie andere Metadaten) zwischen Lightroom/Photoshop, Darktable und RawTherapee.    

    Mit anderen Worten: Nur weil eine Anwendung generell XMP unterstützt, heißt das nicht, dass sie Metadaten verwenden kann, die mit einer anderen Anwendung oder von einem anderen Anbieter wie Adobe erstellt wurden. Wenn du denkst, dass das verwirrend ist, dann stimmt das auch. Du hast zwar ein offenes Format, bist aber immer noch an einen bestimmten Anbieter gebunden - wahrscheinlich nicht ganz unbeabsichtigt von Adobe.

    Unserer Erfahrung nach werden einige grundlegende Bearbeitungen, die mit Adobe-Werkzeugen vorgenommen wurden - wie z. B. das Zuschneiden - möglicherweise beibehalten, wenn du das gleiche RAW-Bild mit einer anderen Software wie Darktable konvertierst. Erweiterte Bearbeitungen, wie Objektiv- oder Farbkorrekturen, werden wahrscheinlich nicht übernommen.

## Live Photos ##

??? question "Warum kann ich Live Fotos nicht abspielen oder Bildstapel finden, wenn ich nach bestimmten Bildern suche? "

    Unsere Such-API und die Benutzeroberfläche führen eine Dateisuche durch. Dies ist beabsichtigt, da "Bildstapel" Dateien unterschiedlichen Typs und unterschiedlicher Eigenschaften, wie z. B. Farbe, enthalten können.

    So kann es beispielsweise Farb- und Schwarzweißversionen geben. Wenn nach diesen gesucht wird oder Bilder nach Farbe sortiert werden, muss die Benutzeroberfläche nun einzelne Dateien anzeigen. Andernfalls würden die Ergebnisse, die ein Farbbild/Video anzeigen, wenn nach Schwarzweiß gefiltert wird, keinen Sinn ergeben.    
    
    Ebenso finden Sie bei der Suche nach `Dateiname.mp4.*` nur JPEGs ohne Video, da die Videodateierweiterung `.mp4` nicht mit einem Punkt endet.

    Wir empfehlen die Verwendung der Filter `path:` und/oder `name:` mit Wildcards, wenn die Suche nach einzelnen Dateien die Suchergebnisse zu sehr einschränkt. Die meisten Nutzer werden alle zusammengehörigen Dateien finden wollen, damit sie zusammen angezeigt werden können, z. B. als Live-Fotos, die aus einem Video und einem Bild bestehen.    
    Sie können diese Filter mit anderen Filtern wie `live` kombinieren, um sicherzustellen, dass die Ergebnisse nur Bilder mit einem bestimmten Medientyp enthalten. Alternativ können Sie auch den Filter "filename:" mit einem freizügigeren Platzhalter verwenden, der die Dateierweiterung ausschließt.


## Metadaten ##
??? question "Windows zeigt andere Metadaten an. Könnte das ein Fehler in PhotoPrism sein?"

    Wir empfehlen, dass du [Exiftool](https://exiftool.org/install.html) verwendest, um alle Metadatenfelder und -werte zu prüfen, da Windows nur eine begrenzte Funktionalität hat.
    
    Vielleicht wird dann klar, warum es Unterschiede gibt. Es könnte zum Beispiel sein, dass Windows einige Felder nicht unterstützt und sie deshalb ignoriert oder dass die angezeigten Daten tatsächlich aus dem Dateisystem und nicht aus den Dateien stammen. Wenn du immer noch glaubst, einen Fehler gefunden zu haben, stelle uns bitte [Beispieldateien](https://www.photoprism.app/contact#file-samples) zur Verfügung, damit wir das Problem reproduzieren können.

??? question "Warum wird das Datum von Bildern ohne Metadaten in den Suchergebnissen als *Unbekannt* angezeigt?"

    Wenn in den Metadaten oder den Originaldateinamen keine Datumsangaben vorhanden sind, wird die Modifikationszeit des Dateisystems verwendet, um die Bilder in den Suchergebnissen zu sortieren und um [beim Import kanonische Dateinamen für sie zu erstellen](library/import.md). Dabei handelt es sich jedoch in der Regel nicht um das tatsächliche Aufnahmedatum eines Fotos ( oder um das Datum, an dem eine Grafik vom ursprünglichen Autor erstellt wurde), sondern lediglich um den Zeitpunkt, an dem es heruntergeladen oder kopiert wurde. Daher wird das Datum von Bildern ohne zuverlässiges Erstellungsdatum als "Unbekannt" angezeigt, bis du manuell [im Bearbeitungsdialog ein Datum festlegst](organize/edit.md).

??? question "Warum haben einige Bilder den 08.12.2002 als Datum, wenn sie an diesem Tag nicht aufgenommen wurden?"

    Das liegt wahrscheinlich an einem [Fehler in Android](https://issuetracker.google.com/issues/36963276), der dazu führte, dass Fotos mit einem falschen CreateDate erstellt wurden. Du kannst das Datum im [Bearbeitungs-Dialog](organize/edit.md) ändern. Hier wird allerdings nur der Index in PhotoPrism geändert.
    Um das Datum direkt in deiner Originaldatei zu ändern nutze bitte andere Apps wie Photoshop oder Exiftool und indexiere deine Dateien anschließend erneut.

??? question "Warum haben manche Bilder ein komisches Datum wie 01/01/1980?"

    Das kommt vor, wenn es zum Aufnahmezeitpunkt Probleme mit deinen Kameraeinstellungen gab.
    Du kannst das Datum im [Bearbeitungs-Dialog](organize/edit.md) ändern. Hier wird allerdings nur der Index in PhotoPrism geändert.
    
    Um das Datum direkt in deiner Originaldatei zu ändern nutze bitte andere Apps wie Photoshop oder Exiftool und indexiere deine Dateien anschließend erneut.

??? question "Was ist der Unterschied zwischen Suchbegriffen und Kategorien"

    Suchbegriffe bestehen aus einer Liste von Begriffen, welche aus Metadaten, Dateinamen und anderen Quellen, wie Geoddaten, extrahiert wurden.
    Bilder mit passenden Suchbegriffen tauchen automatisch auch in den entsprechenden Kategorien auf.
    
    Auch wenn sich Suchbegriffe und Kategorien überschneiden können, dienen sie unterschiedlichen Zwecken:

    * **Kategorien** können übergeordnete Kategorien haben und werden primär für die Klassifizierung verwendet, z.B. "Tier", "Katze", "Boot".
    Duplikate und Unstimmigkeiten sollten vermieden werden.
    * **Suchbegriffe** werden hauptsächlich zum Suchen verwendet. Sie können ähnliche Begriffe und Übersetzungen enthalten wie "Kätzchen", "Katze", "Kater".

## Vorschaubilder ##
??? question "Ist es nicht unsicher, dass die URLs von Vorschaubildern auch dann funktionieren, wenn du nicht eingeloggt bist?"

    Wie die meisten kommerziellen Bild-Hosting-Dienste haben wir uns für eine **cookiefreie Thumbnail-API** entschieden, um die Anfrage-Latenz zu minimieren und unnötigen Netzwerkverkehr zu vermeiden. Wenn du private Sitzungscookies kopieren und in einem anderen Browserfenster verwenden würdest, hättest du ein ähnliches Problem, nur dass sie auch für andere API-Endpunkte funktionieren und nicht nur für ein einzelnes Bild.

    Selbst wenn die URLs jede Minute ungültig werden würden: Digitale Kopien sind so gut wie Originale. Einmal geteilt und heruntergeladen, sollten solche Bilder als "durchgesickert" betrachtet werden, weil sie zwischengespeichert werden und vom Empfänger jederzeit erneut geteilt werden können, ohne dass es eine sichere Möglichkeit gibt, alle Kopien zurückzubekommen. Jede Form des Schutzes, die wir anbieten könnten, wäre im Grunde "Schlangenöl", könnte umgangen werden und hätte negative Auswirkungen auf das Nutzererlebnis, wie z. B. die Deaktivierung des Browser-Caches oder des Kontextmenüs.

    Um ein Höchstmaß an Schutz zu gewährleisten, wird empfohlen, deinen privaten Server vom öffentlichen Internet abzuschirmen. Verwende immer **HTTPS, ein VPN und/oder idealerweise TLS-Client-Zertifikate** und stelle sicher, dass nur Personen, denen du vertraust, Zugang zu deiner Instanz haben.

    Unter [docs.photoprism.app/developer-guide/media/thumbnails/](https://docs.photoprism.app/developer-guide/media/thumbnails/) erfährst du mehr.

## WebDAV ##
??? question "Warum bekomme ich eine Fehlermeldung, wenn ich versuche einen Remote Server als Synchronisationsziel hinzuzufügen?"
   
    PhotoPrism testet einige [übliche Endpoints](https://raw.githubusercontent.com/photoprism/photoprism/develop/internal/remote/heuristic.go), wenn ein neuer Remote Server
    hinzugefügt wird.
    Falls diese Tests fehlschlagen, wird dir eine Fehlermeldung angezeigt. Hierfür kann es unterschiedliche Gründe geben:

    - Du benutzt HTTPS mit einem ungültigen Zertifikat (nicht signiert, abgelaufen, falsche Domain, ...).
    - Dein Server hat Berechtigungsprobleme oder ist falsch konfiguriert. Nextcloud blockiert z.B. Anfragen, wenn der Host nicht unter den `trusted_domains` in `config.php` definiert ist.
    - Deine PhotoPrism Instanz kann aufgrund von Netzwerk Einstellungen oder einer Firewall die IP des Servers nicht erreichen.
    - Der interne Hostname kann nicht in eine IP Adresse aufgelöst werden.
    - Host oder Port sind falsch.
    - Benutzername oder Passwort sind falsch.

    Wenn du keine Probleme hast, das Terminal zu benutzen, kannst du [Curl](https://curl.se/) verwenden, um [HTTP Verbindungen zu testen](https://code.blogs.iiidefix.net/posts/webdav-with-curl/).
 
    ```
    curl -X PROPFIND -H "Depth: 1" -u user:pass https://example.org/webdav/
    ```
    
    Benutze Curl am besten im gleichen Docker-Container/der gleichen VM/der gleichen Server Umgebung, auf der du PhotoPrism installiert hast.

??? question "Wenn ich mit meiner Synchronisations App eine WebDAV Verbindung aufbauen will, bekomme ich den Fehler "TLS Paket-Header können nicht gelesen werden"?"

    Aufgrund von Sicherheitsbedenken haben einige Apps, wie [FolderSync](https://foldersync.io/docs/faq/#https-connection-errors), den
    Support f̈́ür HTTP ohne SSL eingestellt.
    
    Wenn du PhotoPrism auf einem öffentlichen Server außerhalb deines Heimnetzwerks installierst, führe es bitte **immer hinter einem sicheren Reverse HTTP Proxy** ,
     wie [Traefik](https://docs.photoprism.app/getting-started/proxies/traefik/),
    [Caddy](https://docs.photoprism.app/getting-started/proxies/caddy-2/), oder [NGINX](https://docs.photoprism.app/getting-started/proxies/nginx/) aus. 
    Deine Dateien und Passwörter werden sonst im Klartext übermittelt und können
    abgefangen werden.
