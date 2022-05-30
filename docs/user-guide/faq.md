# Häufig gestellte Fragen

## Allgemein ##

??? question "Wann genau werden neuen Funktionen veröffentlicht?"
    Unsere [Roadmap](https://link.photoprism.app/roadmap) zeigt, welche Aufgaben in Arbeit sind und welche Funktionen als nächstes implementiert werden. 
    Du kannst Ideen, die dir gefallen, mit einem Daumen hoch bewerten, damit wir wissen, was am beliebtesten ist.

    Wir haben eine Zero Bug Policy und geben unser Bestes, Nuztern zu helfen, wenn sie Fragen haben.
    Aus diesem Grund können wir keine exakten Veröffentlichungstermine für neue Funktionen geben. 
    
    Unser Team erhält viel mehr Anfragen als umgesetzt werden können. Wir möchten daher betonen, dass wir in keiner Weise verpflichtet sind, die von dir angeforderten Funktionen, Verbesserungen oder sonstigen Änderungen umzusetzen. 
    Wir freuen uns jedoch über dein Feedback und werden alle Anfragen sorgfältig prüfen.

    **Da eine nachhaltige Finanzierung der Schlüssel zur schnellen Veröffentlichung neuer Funktionen ist, ermutigen wir alle Nutzer, unsere Mission zu unterstützen, indem sie [sich als Sponsor anmelden](https://photoprism.app/membership) oder eine kommerzielle Lizenz erwerben. Letztendlich ist das das Beste für das Produkt und die Community.**

??? question "Welche Zusatzleistungen bekommen Sponsoren?"
    Unsere Sponsoren kommen zusätzlich in den Genuss aller Funktionen, die mit einem [sponsor-feature](https://github.com/photoprism/photoprism/issues?q=label%3Asponsor-feature) Label versehen sind oder in der Dokumentation als [sponsors only](https://docs.photoprism.app/getting-started/config-options/) gekennzeichnet sind, einschließlich [Interaktiver Weltkarten](https://demo.photoprism.app/places). 
    Besuche [photoprism.app/membership](https://photoprism.app/membership) um mehr zu erfahren.

??? question "Sollte freie Software nicht kostenlos sein?"
    Denke an "freie Software" wie an "freie Rede", nicht wie an "Freibier". Die [Free Software Foundation](https://www.gnu.org/philosophy/free-sw.en.html) nennt es manchmal "libre software", in Anlehnung an das französische oder spanische Wort für "frei", um zu zeigen, dass sie nicht meint, dass die Software kostenlos ist.

??? question "Warum kann ich nicht einfach eine einzelne Version kaufen und herunterladen?"
    Anders als herkömmliche Offline-Anwendungen wie Microsoft Office muss Software, die mit dem Internet verbunden ist,
    [regelmäßig aktualisiert](https://docs.photoprism.app/release-notes/) werden, um sicher und mit den neuesten Standards kompatibel zu bleiben.

    Updates sind auch deshalb wichtig, weil praktisch alle Dateiformat-Parser Schwachstellen haben, die nur noch nicht entdeckt wurden. 
    Dies ist ein bekanntes Risiko, das dich auch betreffen kann, wenn dein Computer nicht direkt mit dem Internet verbunden ist.

    Es ist essentiell, dass du Betriebssystem, Webbrowser und alle anderen Programme auf dem neuesten Stand hälst. 
    In der Vergangenheit haben selbst große Technologieunternehmen ihre alten Produkte bis auf wenige Ausnahmen nicht über einen längeren Zeitraum hinweg unterstützt. 
    Windows XP zum Beispiel wurde 400 Millionen Mal verkauft, weshalb Microsoft so lange Zeit Updates anbieten konnte.

??? question "Wird die selbst gehostete Version weiterhin unterstützt, wenn eine gehostete Version verfügbar ist?"

    Auf jeden Fall! Wir haben es uns zur Aufgabe gemacht, deine Freiheit und deine Privatsphäre zu schützen.
    Selbst zu hosten ist der einfachste Weg, um die Kontrolle zu behalten und deine [Privatsphäre](https://photoprism.app/privacy) zu schützen. Es bietet auch die beste Erfahrung für fortgeschrittene Nutzer, die oft auf eine lokale Toolchain angewiesen sind, um ihre Bilder auszuwählen, zu bearbeiten und zu veröffentlichen.    
    
    Da es eine große Nachfrage und viele praktische Anwendungen für eine gehostete Version gibt, wollen wir diese zusätzlich anbieten, damit unsere Nutzer mehr Auswahl haben. Ausgewählte Hosting-Partner werden sicherstellen, dass die Privatsphäre unserer Nutzer so weit wie technisch möglich geschützt wird, auch in der Cloud.    

    Ebenso haben Unternehmen Bedarf an einem kommerziellen Angebot mit Funktionen und Support-Optionen, die sich an professionelle Nutzer richten. Sie sind bereit, für den Mehrwert zu zahlen, den sie erhalten, was uns hilft, die Entwicklung zu finanzieren und unser Team zu erweitern.

## Benutzer-Oberfläche ##

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

??? question "Was ist der Unterschied zwischen Suchbegriffen und Kategorien"
    
    Suchbegriffe bestehen aus einer Liste von Begriffen, welche aus Metadaten, Dateinamen und anderen Quellen, wie Geoddaten, extrahiert wurden.
    Bilder mit passenden Suchbegriffen tauchen automatisch auch in den entsprechenden Kategorien auf.
    
    Auch wenn sich Suchbegriffe und Kategorien überschneiden können, dienen sie unterschiedlichen Zwecken:

    * **Kategorien** können übergeordnete Kategorien haben und werden primär für die Klassifizierung verwendet, z.B. "Tier", "Katze", "Boot".
    Duplikate und Unstimmigkeiten sollten vermieden werden.
    * **Suchbegriffe** werden hauptsächlich zum Suchen verwendet. Sie können ähnliche Begriffe und Übersetzungen enthalten wie "Kätzchen", "Katze", "Kater".

??? question "Wie kann ich Dateien endgültig löschen?"

    Du kannst Dateien über die Web-Oberfläche [löschen](./organize/delete.md).

## Suche ##

??? question "Warum kann ich Live Fotos nicht abspielen oder Bildstapel finden, wenn ich nach bestimmten Bildern suche? "
    
    Unsere Such-API und die Benutzeroberfläche führen eine Dateisuche durch. Dies ist beabsichtigt, da "Bildstapel" Dateien unterschiedlichen Typs und unterschiedlicher Eigenschaften, wie z. B. Farbe, enthalten können.

    So kann es beispielsweise Farb- und Schwarzweißversionen geben. Wenn nach diesen gesucht wird oder Bilder nach Farbe sortiert werden, muss die Benutzeroberfläche nun einzelne Dateien anzeigen. Andernfalls würden die Ergebnisse, die ein Farbbild/Video anzeigen, wenn nach Schwarzweiß gefiltert wird, keinen Sinn ergeben.    
    
    Ebenso finden Sie bei der Suche nach `Dateiname.mp4.*` nur JPEGs ohne Video, da die Videodateierweiterung `.mp4` nicht mit einem Punkt endet.

    Wir empfehlen die Verwendung der Filter `path:` und/oder `name:` mit Wildcards, wenn die Suche nach einzelnen Dateien die Suchergebnisse zu sehr einschränkt. Die meisten Nutzer werden alle zusammengehörigen Dateien finden wollen, damit sie zusammen angezeigt werden können, z. B. als Live-Fotos, die aus einem Video und einem Bild bestehen.    
    Sie können diese Filter mit anderen Filtern wie `live` kombinieren, um sicherzustellen, dass die Ergebnisse nur Bilder mit einem bestimmten Medientyp enthalten. Alternativ können Sie auch den Filter "filename:" mit einem freizügigeren Platzhalter verwenden, der die Dateierweiterung ausschließt.

## Dateien und Anzahlsanzeigen ##

??? question "Welche Datei Typen werden unterstützt?"

    PhotoPrism unterstützt Indexieren, Anzeigen und [Konvertierung](./settings/library.md) der meisten gängigen Bild-, Video- und RAW-Dateiformate, einschließlich JPEG, PNG, GIF, BMP, HEIF, HEIC, MP4, MOV, WebP und WebM. [TIFF wird teilweise unterstützt](https://github.com/golang/go/issues?q=is%3Aissue+image%2Ftiff+) ohne Erweiterungen wie GeoTIFF.

    Das intern verwendete Bildformat ist JPEG. Beim Indexieren kann für Videos und Bilder in anderen Formaten automatisch eine JPEG-Sidecar-Datei erstellt werden. Sie wird für die Erstellung von Thumbnails, die Bildklassifizierung und die Gesichtserkennung benötigt. Die Unterstützung von JPEG XL ist geplant, sobald es allgemein verfügbar ist und genügend kompatible Programme existieren.
    
    Falls installiert, ist die Konvertierung von RAW-Dateien mit den folgenden Konvertern möglich (unser Docker-Image enthält beide):

    - [Darktable](https://www.darktable.org/) ([unterstützte Kameras](https://www.darktable.org/resources/camera-support/))
    - [RawTherapee](https://rawtherapee.com/) ([unterstützte Kameras](https://www.libraw.org/supported-cameras))

    Auf einem Mac können RAW-Dateien auch mit [Sips](https://ss64.com/osx/sips.html) ([unterstützte Kameras](https://support.apple.com/en-us/HT211241)) konvertiert werden.
    Unser Ziel ist es, erstklassige Unterstützung für alle RAW-Formate zu bieten, unabhängig von Kameramarke und -modell.
    Falls du Probleme mit einem bestimmten Dateiformat hast, öffne gerne ein Ticket.

    
    Von [FFmpeg](https://en.wikipedia.org/wiki/FFmpeg#Supported_codecs_and_formats) unterstützte [Videoformate](https://docs.photoprism.app/developer-guide/media/) können zu
    [MPEG-4 AVC](https://en.wikipedia.org/wiki/Advanced_Video_Coding) transkodiert werden, um maximale Browser-Kompatibilität zu gewährleisten. Aus den meisten Videos können auch Standbilder für die Erstellung von Thumbnails extrahiert werden.
    
    Du solltest PhotoPrism so konfigurieren, dass automatisch JSON Sidecar-Dateien erstellt werden, wenn Du Videos, Live-Fotos und/oder [animierte GIFs](https://github.com/photoprism/photoprism/issues/590) hast, damit videospezifische Metadaten wie Codec, Frames und Dauer extrahiert, indexiert und durchsucht werden können.

    Eine vollständige Liste der Dateiformate und -erweiterungen findest du in unserer [Funktionsübersicht](https://link.photoprism.app/overview).

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
    
    Sofern Metadaten Backups nicht über `PHOTOPRISM_DISABLE_BACKUPS` oder `--disable-backups` deaktiviert sind, erstellt/aktualisiert PhotoPrism automatisch
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

??? question "Werden JPEGs aktualisiert, wenn sich RAW- oder XMP-Dateien ändern?"
    
    JPEGs werden derzeit nicht neu generiert, wenn sich zugehörige RAW- oder XMP-Dateien ändern. RAW-Dateien sind von vornherein digitale Negative. PhotoPrism geht daher davon aus, dass ihre Bildinformationen unveränderlich sind.

    XMP-Dateien können das Erscheinungsbild beeinflussen, aber die meisten der darin enthaltenen Metadaten, wie z. B. Titel und Beschreibung, sind davon nicht betroffen. 
    Die Erstellung von JPEGs aus RAW-Dateien ist eine zeitaufwändige Aufgabe und würde in den meisten Fällen einen enormen, nicht zu rechtfertigenden Overhead verursachen. 
    Hinzu kommt, dass die Rendering-Informationen in XMP-Dateien nicht gut standardisiert sind. So sind beispielsweise Änderungen, die Sie in Photoshop vornehmen, möglicherweise nicht mit Darktable kompatibel.

    Wir empfehlen, vorhandene JPEG-Sidecar-Dateien bei Bedarf manuell zu aktualisieren oder zusätzliche JPEGs zu erstellen, damit Sie zwischen verschiedenen Versionen wählen können. Neue Dateien und andere Metadatenänderungen werden wie üblich beim Scannen Ihrer Bibliothek erkannt und in den Index aufgenommen.

??? question "Ich vermisse einige Dateien, wo könnten sie sein?"
   
    Falls du den [Qualitätsfilter](organize/review.md) aktiviert hast, findest du deine Bilder eventuell im Bereich *Überprüfen*.
    Es kann auch sein, dass das Format der Bilder nicht unterstützt wird, oder die Bilder kaputt sind.
    Haben mehrere Dateien den gleichen Namen oder exakt das gleiche Datum und den gleichen Aufnahmeort oder die gleiche ID,
    werden diese zu einem Bildstapel gruppiert. Du findest sie im Bereich *Bildstapel* und kannst die Gruppierung dort aufheben, sofern sie fehlerhaft ist.

??? question "Unter welchen Bedingungen können Dateien gruppiert werden?" 

    1. Gleichnamige Dateien, die sich im selben Ordner befinden, z.B. `/2018/IMG_1234.jpg` und  `/2018/IMG_1234.avi`, werden immer gruppiert.
    2. Dateien mit fortlaufenden Namen, wie `/2018/IMG_1234 (2).jpg` und `/2018/IMG_1234 (3).jpg`, können optional gruppiert werden.
    3. Dateien, deren Metadaten zeigen, dass sie am selben Ort und in der selben Sekunde aufgenommen wurden, können optional gruppiert werden.
    4. Dateien mit der gleichen *Unique Image ID* oder *XMP Instance ID* können optional gruppiert werden.

    Du kannst das Verhalten der Punkte 2-4 in den [*Einstellungen*](./settings/general.md) konfigurieren.

??? question "Es sind bereits einige meiner Bilder indexiert. Warum befinden sich noch keine Bilder in den Bereichen Ordner, Kalender und Erlebnisse?"
   
    Bilder werden erst am Ende der Indexierung zu den Bereichen Ordner, Kalender und Erlebnisse hinzugefügt.

??? question "Warum zeigt die Navigation unterschiedliche Zahlen für *Suche* und *Originale* an?"

    Der Bereich *Dateien > Originale* zeigt Dateien an, während in *Suche* Bilder und Videos dargestellt werden.
    
    Bilder und Videos können aus mehreren Dateien bestehen:

    * RAW + JPG + XMP = 1 Bild, 3 Dateien
    * MP4 + JPG = 1 Video, 2 Dateien

    Es kann auch sein, dass mehrere JPG Dateien zu einem Bild gruppiert sind (z.B. eine original und eine bearbeitete Version).

## Metadaten ##
??? question "Warum haben manche meiner Bilder ohne GPS Informationen trotzdem einen Ort gesetzt?"

    Für Bilder ohne Orts-Informationen wird anhand von anderen Bilder, die am gleichen Tag gemacht wurden, ein Ort geschätzt. 
    Die Schätzungen können in den [Einstellungen](./settings/general.md) deaktiviert werden.

??? question "Warum haben manche Bilder ein komisches Datum wie 01/01/1980?"

    Das kommt vor, wenn es zum Aufnahmezeitpunkt Probleme mit deinen Kameraeinstellungen gab.
    Du kannst das Datum im [Bearbeitungs-Dialog](organize/edit.md) ändern. Hier wird allerdings nur der Index in PhotoPrism geändert.
    
    Um das Datum direkt in deiner Originaldatei zu ändern nutze bitte andere Apps wie Photoshop oder Exiftool und indexiere deine Dateien anschließend erneut.

## WebDAV, Sync & Upload ##
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

    Aufgrund von Sicherheitsbedenken haben einige Apps, wie [FolderSync](https://www.tacit.dk/foldersync/faq/#i-can-not-connect-to-a-non-https-webdav-server-why), den
    Support f̈́ür HTTP ohne SSL eingestellt.
    
    Wenn du PhotoPrism auf einem öffentlichen Server außerhalb deines Heimnetzwerks installierst, führe es bitte **immer hinter einem sicheren Reverse HTTP Proxy** ,
     wie [Traefik](https://docs.photoprism.app/getting-started/proxies/traefik/),
    [Caddy](https://docs.photoprism.app/getting-started/proxies/caddy-2/), oder [NGINX](https://docs.photoprism.app/getting-started/proxies/nginx/) aus. 
    Deine Dateien und Passwörter werden sonst im Klartext übermittelt und können
    abgefangen werden.
