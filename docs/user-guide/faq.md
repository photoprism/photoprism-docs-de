# Häufig gestellte Fragen

## Allgemein ##

??? question "Wann genau werden neuen Funktionen veröffentlicht?"
    Wir haben eine Zero Bug Policy und geben unser Bestes, Nuztern zu helfen, wenn sie Fragen haben.
    Auch das Schreiben und Aktualisieren der Dokumentation, die du gerade liest, nimmt Zeit in Anspruch.

    Aus diesen Gründen können wir keine exakten Deadlines für neue Funktionen geben. Hinzu kommt, dass
    umfangreiche Funktionen, wie z.B. die Mehrbenutzer-Unterstützung nicht in nur einem Update released werden können.
    Die Arbeit an solchen Funktionen ist ein kontinuierlicher Prozess und es kann Monate oder Jahre dauern, bis alle Anwendungsfälle abgedeckt sind.

    Davon abgesehen, haben Spenden den größten Einfluss auf die Entwicklungsgeschwindigkeit. 
    Als Nutzer kannst du deinen Teil beitragen, indem du [Sponsor wirst](https://docs.photoprism.app/funding/).

??? question "Gibt es Pläne Premium-Funktionen einzuführen?"
    Ja, wir planen nicht essentielle Premium Funktionen und Dienstleistungen anzubieten, da freiwillige Spenden momentan nicht einmal unsere Basiskosten decken.
    Eine nachhaltige Finanzierung ist im besten Interesse aller Nutzer.

    Sofern dein Plan keinen zusätzlichen Cloud-Speicher enthält, kannst du jeder Zeit ein Up- oder Downgrade durchführen, ohne Daten zu verlieren.
    Für diejenigen, die keine Abos mögen, wird es vergünstigte Mehrjahres-Bezahloptionen geben.
    Um Einkommensunterschieden entgegen zu wirken, können Preise je nach Region variieren.
    Sobald wir mehr Details haben, werden wir sie öffentlich bekannt geben.

    Bis dahin hast du die Möglichkeit uns einmalig auf [Github Sponsors](https://github.com/sponsors/photoprism?frequency=one-time) zu unterstützen, falls du keinen Support nach der Installation benötigst
    und keine Updates mit zusätzlichen Funktionen für mehr als 12 Monate erwartest.

    Wir ermutigen jeden, der es sich leisten kann, [Sponsor zu werden](../funding.md). Dies ist langfristig das Beste für
    das Produkt und die Community. 
    Denke bei "freie Software" an "Freiheit", nicht an "Freibier".


??? question "Warum kann ich nicht einfach eine einzelne Version kaufen und herunterladen?"
    Es wäre unverantwortlich, einzelne Versionen zum einmaligen Kauf ohne laufende Updates anzubieten.
    Anders als herkömmliche Offline-Anwendungen wie Microsoft Office muss Software, die mit dem Internet verbunden ist,
    regelmäßig aktualisiert werden, um sicher und mit den neuesten Standards kompatibel zu bleiben.

    Updates sind auch deshalb wichtig, weil praktisch alle Dateiformat-Parser Schwachstellen haben, die nur noch nicht entdeckt wurden. 
    Dies ist ein bekanntes Risiko, das dich auch betreffen kann, wenn dein Computer nicht direkt mit dem Internet verbunden ist.

    Es ist essentiell, dass du Betriebssystem, Webbrowser und alle anderen Programme auf dem neuesten Stand hälst. 
    Fordere dein Glück nicht heraus und erwarte nicht, dass Entwickler Zeit darauf verwenden, einzelne Updates für alte Versionen bereitzustellen, die nichts außer kritischen Sicherheitsaktualisierungen enthalten.

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

## Dateien und Anzahlsanzeigen ##

??? question "Welche Datei Typen werden unterstützt?"

    PhotoPrism's primäres Dateiformat ist JPEG.
    Während der Indexierung werden für RAW, HEIF, TIFF, PNG, BMP und GIF Dateien JPEG Dateien erstellt.
    Diese werden für die Klassifizierung und das Resampling benötigt.
    
    Unterstützung spezieller RAW Formate ist abhängig von der Laufzeitumgebung sowie der Konfiguration. 
    PhotoPrism kann [Darktable](https://www.darktable.org/) und [RawTherapee](https://rawtherapee.com/) für die RAW zu JPEG Konvertierung nutzen. 
    Auf Mac OS, wird möglicherweise auch [Sips](https://ss64.com/osx/sips.html) verwendet.
    
    Wir unterstützen [alle gängigen Videodateien](https://docs.photoprism.app/developer-guide/media/videos/).
    Du solltest PhotoPrism so konfigurieren, dass automatisch JSON Sidecar-Dateien erstellt werden, damit Metadaten deiner Videos, wie Aufnahmeort und Dauer indexiert werden können.
    
    Falls du Probleme mit einem bestimmten Dateiformat hast, öffne gerne ein Ticket.

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

    Du kannst das Verhalten der Punkte 2-4 in den [*Einstellungen*](../settings/general.md) konfigurieren.

??? question "Es sind bereits einige meiner Bilder indexiert. Warum befinden sich noch keine Bilder in den Bereichen Ordner, Kalender und Erlebnisse?"
   
    Bilder werden erst am Ende der Indexierung zu den Bereichen Ordner, Kalender und Erlebnisse hinzugefügt.

??? question "Warum zeigt die Navigation unterschiedliche Zahlen für *Suche* und *Originale* an?"

    Der Bereich *Dateien > Originale* zeigt Dateien an, während in *Suche* Bilder und Videos dargestellt werden.
    
    Bilder und Videos können aus mehreren Dateien bestehen:

    * RAW + JPG + XMP = 1 Bild, 3 Dateien
    * MP4 + JPG = 1 Video, 2 Dateien

    Es kann auch sein, dass mehrere JPG Dateien zu einem Bild gruppiert sind (z.B. eine original und eine bearbeitete Version).

??? question "Warum ist die Anzahl in *Originals* höher, als die Anzahl an Dateien in meinem Originals Verzeichnis?"

    Während der Indexierung erstellt Photoprism JPG Dateien, falls diese nicht vorhanden sind (beispielsweise für RAWs, Videos oder PNGs).
    Diese Dateien werden in /storage/sidecar gespeichert. In der Benutzeroberfläche werden sie allerdings im Bereich Originale angezeigt.

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
