# Bibliotheks Einstellungen #

##Indexierung ##

#### :material-chart-timeline-variant: Schätzungen ####
Den ungefähren Standort von Bildern ohne Koordinaten automatisch schätzen.

#### Qualitätsfilter :material-eye: ####
Wenn diese Option aktiviert ist, musst du Fotos und Videos mit geringer Qualität [*überprüfen*](../organize/review.md), bevor sie in *Fotos* oder *Videos* angezeigt werden.

#### Automatische Konvertierung zu JPEG :material-camera: ####
Wenn diese Option aktiviert ist, werden während der [*Indexierung*](../library/indexing.md) automatisch *JPEG*-Vorschaubilder deiner *RAW*-Dateien erstellt.

!!! Attention
    Falls diese Option deaktiviert ist, und es RAW, PNG oder Video Dateien ohne dazugehöriges JPEG gibt, wird es für diese Dateien keine Vorschau geben.

## Bildstapel ##
PhotoPrism gruppiert zusammengehörige Dateien automatisch zu Bildstapeln.
Ein Bildstapel hat ein primäres Bild, das in den Ansichten angezeigt wird. Deine gruppierten Dateien findest du unter  [*Bildstapel*](../organize/stacks.md).

Du kannst folgende Optionen nutzen, um Bilder zu gruppieren:

* :material-format-list-numbered-rtl: Fortlaufende Dateinamen
* :material-clock-outline: Gleicher Ort und Zeit
* :material-fingerprint: Gleiche eindeutige Bild-ID


<!--## Umwandlung von RAW zu JPEG ##
Viele Fotografen, insbeondere Nutzer einer digitalen SLR, verwenden ein verlustfreies RAW-Format anstelle des verlustbehafteten JPEG-Formats. Es gibt auch [Handies](https://www.fredericpaulussen.be/how-to-raw-photos-huawei-p30-pro/) die RAW-Daten abspeichern können oder das Format HEIC/HEIF nutzen.
Das Ziel von PhotoPrism ist eine umfangreiche Unterstützung für alle [RAW-Formate](https://en.wikipedia.org/wiki/Raw_image_format), unabhängig vom verwendeten Kameramodell. Deshalb bitten wir dich uns eine Nachricht zu schicken, falls du ein Problem mit den Dateien von einem deiner Geräte hast.

Webbrowser können keine RAW-Formate anzeigen. Deshalb muss PhotoPrism diese Dateien zu JPEGs *konvertieren*. Falls du das nicht möchtest, kannst du das in den [Einstellungen](ui.md) ausschalten.

Zusätzlich zu den oben genannten Formaten unterstützt PhotoPrism auch BMP-, GIF-, PNG- und TIFF-Dateien. Bevor du diese Formate zur Speicherung nutzt, solltest du bedenken, dass sie oft keine Metadaten speichern können. Deshalb werden sie in der Regel für Screenshots, Diagramme und Icons verwendet.

![](img/editPhoto.png)

### Read-only Modus ###
Die Konvertierung von RAW-Formaten benötigt sehr viel Rechenzeit, weshalb normalerweise die dann erzeugten JPEG-Dateien neben den RAW-Dateien für die zukünftige Verwendung abgespeichert werden. Im *read-only Modus* (schreibgeschützt) schreibt PhotoPrism jedoch keine Daten in deine Bildverzeichnisse. Da es nicht sinnvoll wäre die konvertierten Daten im Arbeitsspeicher oder einem temporären Verzeichnis abzulegen, ist die automatische Konvertierung im *read-only Modus* deaktiviert.

Wenn du dir unsicher bist, ob du neben deinen RAW-Dateien auch JPEG-Dateien abspeichern sollst, bedenke, dass es in 20 Jahren bestimmt einen JPEG-Viewer geben wird. Die Unterstützung von einer proprietären RAW-Datei ist jedoch nicht garantiert.
Nutzern, die PhotoPrism zum Anzeigen von Fotos [(im *read-only Modus*)](https://github.com/photoprism/photoprism/issues/189) nutzen wollen, empfehlen wir die JPEGs manuell oder mithilfe eines anderen Tools zu erzeugen.

Wie PhotoPrism mit der automatischen Konvertierung im *read-only Modus* in Zukunft umgehen wird, ist noch nicht abschließend entschieden. Vielleicht gibt es eine Möglichkeit, mit akzeptablem Rechenaufwand und Qualität RAW-Bilder automatisch zu konvertieren. Diese könnten dann in einen Ordner `cached/converted` abgelegt werden. Von da aus könnten sie dann in das Verzeichnis mit den Originalen kopiert/verschoben werden. Was hälst du davon? Wir freuen uns auf dein Feedback!-->