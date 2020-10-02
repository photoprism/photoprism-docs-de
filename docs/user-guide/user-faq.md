# FAQ #
## Was ist der einfachste Weg, um PhotoPrism unter Mac / Windows zu installieren? ##

## Sollte ich PhotoPrism auf meinem Laptop oder auf einem Server installieren? ##

## Gibt es eine mobile App? ##
Wir bieten keine native App über die App Stores an.
Unsere App jedoch vollständig mobil nutzbar und Sie können sie auf dem Homescreen Ihres Telefons oder Tablets hinzufügen.
Auf diese Weise können Sie es wie jede andere App verwenden.

**iOS:**

1. Öffnen Sie PhotoPrism im Safari-Browser auf Ihrem Telefon oder Tablet
2. Klicken Sie auf :material-export-variant:
3. Klicken Sie auf Zum Startbildschirm hinzufügen :material-plus-box-outline:

**Android:**



## Wie kann ich meine Import- / Originalverzeichnisse finden / ändern? ##


## Warum erhalten einige meiner Fotos das Importdatum als Datum anstelle des Datums der Bilderstellung? ##
?????

## Wo werden meine Dateien gespeichert? ##
Ihre Originaldateien verbleiben in dem Verzeichnis, das Sie während der Einrichtung als Originale definiert haben.

## Kann PhotoPrism Backups meiner Dateien erstellen? ##

## Kann ich Bilder von meinem Telefon direkt auf PhotoPrism sichern? ##

## Ich habe ein Label entfernt, aber das zugehörige Schlüsselwort ist noch vorhanden. Warum? ##
Schlüsselwörter stammen aus verschiedenen Quellen: Beschriftungen, Dateinamen, Ordnernamen, Speicherorte usw.
Wenn eine Beschriftung entfernt wird, wird das Schlüsselwort nicht automatisch entfernt, da es möglicherweise aus einer anderen Quelle stammt.
Sie können das Schlüsselwort manuell im [edit dialogue] (organize/edit.md) löschen.

## Was sind Filialdateien-Dateien und wo finde ich sie? ##
Eine Filialdatei ist eine Datei, die sich neben Ihren Fotos mit demselben Namen, aber unterschiedlicher Dateierweiterung / unterschiedlichem Dateityp befindet. Z.B:

 * `IMG_0101.jpg`
 * `IMG_0101.json`
 * `IMG_0101.yaml`

Es gibt zwei Arten von Filialdateien, die von PhotoPrism verwendet werden.

 * **json** - (Variable: `PHOTOPRISM_SIDECAR_JSON` Parameter: `--sidecar-json, -j`) - Dies wird automatisch aus den EXIF-Daten Ihrer Fotos von erstellt `exiftool`. Dadurch sind die Daten für andere Skripte / Apps leicht verfügbar
 * **yaml** - (Variable: `PHOTOPRISM_SIDECAR_YAML` Parameter: `--sidecar-yaml, -y`) - Dies wird verwendet, um alle in PhotoPrism vorgenommenen Änderungen an den Metadaten Ihrer Fotos zu sichern. Dadurch bleibt das Versprechen erhalten, dass wir keine Änderungen an den Originalen vornehmen und gleichzeitig Änderungen vornehmen, die Sie im Klartextformat vorgenommen haben. Nützlich für und Backup/Sicherunge und Datenbank-Neuerstellungen.

## Was ist der Vorteil von PhotoPrism als OpenSource für mich als Benutzer? ##
