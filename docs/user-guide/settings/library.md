# Bibliothekseinstellungen #

## RAW-JPEG-Konvertierung ##

Viele Fotografen behalten ihre Originale in einem verlustfreien RAW-Format anstelle von komprimiertem JPEG, insbesondere bei Aufnahmen mit einer digitalen Spiegelreflexkamera. Einige [Mobiltelefone] (https://www.fredericpaulussen.be/how-to-raw-photos-huawei-p30-pro/) unterstützen auch RAW oder verwenden HEIC / HEIF für einen ähnlichen Zweck. PhotoPrism bietet eine hervorragende Unterstützung für alle [RAW] -Formate (https://en.wikipedia.org/wiki/Raw_image_format), unabhängig von Kameramarke und -modell. Bitte teilen Sie uns mit, wenn ein Problem mit Ihrem Gerät vorliegt.

Webbrowser können im Allgemeinen keine RAW-Bilddateien anzeigen. Sie müssen konvertiert werden, wie es unsere Befehle * import * und * convert * tun. Ein Kontrollkästchen für diesen Schritt finden Sie auch in unserer [Web-Benutzeroberfläche] (ui.md).

Darüber hinaus unterstützt PhotoPrism jetzt auch TIFF-, PNG-, BMP- und GIF-Dateien. Beachten Sie, dass Dateien in diesen Formaten häufig keine nützlichen Metadaten enthalten und normalerweise nur für Screenshots, Diagramme, Grafiken und Symbole verwendet werden.
![](https://pbs.twimg.com/media/EPd-Lp1WAAYYBzs?format=png&name=large)

### Schreibgeschützter Modus ###

Die Konvertierung ist derzeit im * schreibgeschützten Modus * deaktiviert, da das Erstellen von JPEGs aus RAWs ein ziemlich teurer Vorgang ist und es sinnvoll ist, JPEGs direkt neben ihren RAW-Dateien zu speichern, damit sie in Zukunft wieder gefunden und verwendet werden können. Andernfalls ist es möglicherweise nicht möglich, die Dateien erneut abzugleichen, und Sie möchten die teuer erstellte JPEG-Datei nicht in einem temporären Verzeichnis ablegen oder dies alles im laufenden Betrieb im Speicher tun, es sei denn, Sie haben einen wirklich schnellen Computer. Die meisten Benutzer möchten eine Sicherungskopie ihrer Dateien erstellen, daher sollten zusammengehörige Dateien nicht zufällig über das Dateisystem verteilt werden. In 20 Jahren ist es wahrscheinlich einfacher, ein JPEG zu öffnen, als eine proprietäre RAW-Datei erneut in guter Qualität zu rendern.


Wir sehen jedoch den Punkt [Benutzer, die PhotoPrism als schreibgeschützten Fotobetrachter verwenden möchten] (https://github.com/photoprism/photoprism/issues/189), der keine Dateien in ihrem * Originalverzeichnis erstellen sollte *. Die einfachste Lösung besteht darin, JPEGs manuell zu erstellen oder ein anderes Tool Ihres Vertrauens zu verwenden, um dies automatisch zu tun.

Mit etwas Aufwand ist es möglicherweise möglich, eingebettete JPEGs in akzeptabler Qualität aus vielen RAW-Formaten zu extrahieren und diese im schreibgeschützten Modus zu verwenden. Alternativ könnten JPEGs im Cache-Verzeichnis mit allen oben genannten Nachteilen erstellt werden. Der Speicher wird auf die eine oder andere Weise gelöscht. Beachten Sie, dass JPEGs in voller Auflösung relativ groß sind und Sie sie nicht finden oder wiederverwenden können, da Dateien dort ein anderes Namensschema haben, das auf dem Hash der Originaldatei basiert.


Idee: Legen Sie konvertierte Bilder standardmäßig in den "Cache / konvertiert" mit der Option, sie automatisch in das "Originale" -Verzeichnis zu verschieben / kopieren. Feedback willkommen.

