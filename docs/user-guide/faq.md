# Häufig gestellte Fragen

### Kann ich meine Fotos und Alben in Baumstrukturen organisieren? ###
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

### Was ist der Unterschied zwischen Suchbegriffen und Kategorien ###
Suchbegriffe bestehen aus einer Liste von Begriffen, welche aus Metadaten, Dateinamen und anderen Quellen, wie Geoddaten, extrahiert wurden.
Bilder mit passenden Suchbegriffen tauchen automatisch auch in den entsprechenden Kategorien auf.

Auch wenn sich Suchbegriffe und Kategorien überschneiden können, dienen sie unterschiedlichen Zwecken:

* **Kategorien** können übergeordnete Kategorien haben und werden primär für die Klassifizierung verwendet, z.B. "Tier", "Katze", "Boot".
Duplikate und Unstimmigkeiten sollten vermieden werden.
* **Suchbegriffe** werden hauptsächlich zum Suchen verwendet. Sie können ähnliche Begriffe und Übersetzungen enthalten wie "Kätzchen", "Katze", "Kater".

### Welche Datei Typen werden unterstützt?###

PhotoPrism's primäres Dateiformat ist JPEG.
Während der Indexierung werden für RAW, HEIF, TIFF, PNG, BMP und GIF Dateien JPEG Dateien erstellt.
Diese werden für die Klassifizierung und das Resampling benötigt.

Unterstützung spezieller RAW Formate ist abhängig von der Laufzeitumgebung sowie der Konfiguration. 
PhotoPrism kann [Darktable](https://www.darktable.org/) und [RawTherapee](https://rawtherapee.com/) für die RAW zu JPEG Konvertierung nutzen. 
Auf Mac OS, wird möglicherweise auch [Sips](https://ss64.com/osx/sips.html) verwendet.

Wir unterstützen alle gängigen Videodateien.
Du solltest PhotoPrism so konfigurieren, dass automatisch JSON Sidecar-Dateien erstellt werden, damit Metadaten deiner Videos, wie Aufnahmeort und Dauer indexiert werden können.

Falls du Probleme mit einem bestimmten Dateiformat hast, öffne gerne ein Ticket.

### Ich vermisse einige Dateien, wo könnten sie sein? ###
Falls du den [Qualitätsfilter](organize/review.md) aktiviert hast, findest du deine Bilder eventuell im Bereich *Überprüfen*.
Es kann auch sein, dass das Format der Bilder nicht unterstützt wird, oder die Bilder kaputt sind.
Haben mehrere Dateien den gleichen Namen oder exakt das gleiche Datum und den gleichen Aufnahmeort oder die gleiche ID,
werden diese zu einem Bildstapel gruppiert. Du findest sie im Bereich *Bildstapel* und kannst die Gruppierung dort aufheben, sofern sie fehlerhaft ist.

### Warum sind einige meiner Dateien zu Bildstapeln gruppiert? ###
Dateien, mit gleicher *XMP Instanz ID* oder *Eindeutigen Bild ID*, sowie Dateien mit mit identischem Aufnahmeort und Zeit werden standardmäßig gruppiert.
Dieses Verhalten kann in den [*Einstellungen*](settings/library.md) ausgeschaltet werden. 
Sidecar-Dateien werden in jedem Fall gruppiert.

### Warum haben manche Bilder ein komisches Datum wie 01/01/1980? ###
Das kommt vor, wenn es zum Aufnahmezeitpunkt Probleme mit deinen Kameraeinstellungen gab.
Du kannst das Datum im [Bearbeitungs-Dialog](organize/edit.md) ändern. Hier wird allerdings nur der Index in PhotoPrism geändert.

Um das Datum direkt in deiner Originaldatei zu ändern nutze bitte andere Apps wie Photoshop oder Exiftool und indexiere deine Dateien anschließend erneut.

### Wie kann ich Dateien endgültig löschen? ###
Ja, wenn du Sponsor bist, kannst du Dateien über die Web-Oberfläche [löschen](./organize/delete.md). Falls du kein Sponsor bist, musst du dich noch ein bisschen gedulden.

### Es sind bereits einige meiner Bilder indexiert. Warum befinden sich noch keine Bilder in den Bereichen Ordner, Kalender und Erlebnisse? ###
Bilder werden erst am Ende der Indexierung zu den Bereichen Ordner, Kalender und Erlebnisse hinzugefügt.

### Warum zeigt die Navigation unterschiedliche Zahlen für *Suche* und *Originale* an?###
Der Bereich *Originale* zeigt Dateien an, während in *Suche* Fotos und Videos dargestellt werden.

Fotos und Videos können aus mehreren Dateien bestehen:

* RAW + JPG + XMP = 1 Foto, aber 3 Dateien
* MP4 + JPG = 1 Video, aber 2 Dateien

Es kann auch sein, dass mehrere JPG Dateien zu einem Foto gruppiert sind (z.B. eine original und eine bearbeitete Version).

### Warum ist die Anzahl in *Originals* höher, als die Anzahl an Dateien in meinem Originals Verzeichnis? ###
Während der Indexierung erstellt Photoprism JPG Dateien, falls diese nicht vorhanden sind (beispielsweise für RAWs, Videos oder PNGs).
Diese Dateien werden in /storage/sidecar gespeichert. In der Benutzeroberfläche werden sie allerdings im Bereich Originale angezeigt.

### Warum haben manche meiner Fotos ohne GPS Informationen trotzdem einen Ort gesetzt?###
Für Fotos ohne Orts-Informationen wird anhand von anderen Fotos, die am gleichen Tag gemacht wurden, ein Ort geschätzt. 
Die Schätzungen können in den [Einstellungen](./settings/general.md) deaktiviert werden.
