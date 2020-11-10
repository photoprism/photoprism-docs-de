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

Momentan unterstützen wir nur MPEG-4 AVC Videodateien. In einem späteren Release sind weitere Formate geplant.
Zusätzlich solltest du PhotoPrism so konfigurieren, dass automatisch JSON Sidecar-Dateien erstellt werden, damit Metadaten deiner Videos, wie Aufnahmeort und Dauer indexiert werden können.

Falls du Probleme mit einem bestimmten Dateiformat hast, öffne gerne ein Ticket.

### Ich vermisse einige Dateien, wo könnten sie sein? ###
Falls du den [Qualitätsfilter](organize/review.md) aktiviert hast, findest du deine Bilder eventuell im Bereich *Bestätigen*.
Es kann auch sein, dass das Format der Bilder nicht unterstützt wird, oder die Bilder kaputt sind.
Haben mehrere Dateien den gleichen Namen oder exakt das gleiche Datum und den gleichen Aufnahmeort oder die gleiche ID,
werden diese zu einem Bildstapel gruppiert. Du findest sie im Bereich *Bildstapel* und kannst die Gruppierung dort aufheben, sofern sie fehlerhaft ist.

### Warum haben manche Bilder ein komisches Datum wie 01/01/1980? ###
Das kommt vor, wenn es zum Aufnahmezeitpunkt Probleme mit deinen Kameraeinstellungen gab.
Du kannst das Datum im [Bearbeitungs-Dialog](organize/edit.md) ändern. Hier wird allerdings nur der Index in PhotoPrism geändert.

Um das Datum direkt in deiner Originaldatei zu ändern nutze bitte andere Apps wie Photoshop oder Exiftool und indexiere deine Dateien anschließend erneut.

### Wie kann ich Dateien endgültig löschen? ###
Momentan verändern wir Originaldateien (noch) nicht, um versehentlichen Verlust von Daten oder Konflikte mit anderen Apps zu vermeiden.
Du kannst Bilder archivieren, dann werden sie von *Fotos* ins *Archiv* verschoben, sofern die Archiv Funktionalität in den Einstellungen aktiviert ist.

Die Funktion Bilder in PhotoPrism endgültig zu löschen haben wir für einen späteren Release geplant. Siehe [hier](https://github.com/photoprism/photoprism/issues/167).

Wenn du Dateien manuell oder bei der Nutzung von anderen Apps löschst, vergiss nicht deine Dateien erneut zu indexieren oder das Kommando `photoprism purge` im Terminal auszuführen.