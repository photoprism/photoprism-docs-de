# Backup und Synchronisierung mit Nextcloud #

## Mit Nextcloud verbinden ##
PhotoPrism kann mit einem Nextcloud Server verbunden werden, so dass automatisch
Backups erstellt werden können oder die aktuellsten Bilder gezogen werden.

**Verbindung aufbauen:**

1. Geh zu den *Einstellungen*
2. Öffne den *Backup* Tab
3. Klicke auf *Server hinzufügen*
    ![Screenshot](img/nextcloud-connect.png)
4. Nextcloud Server URL, Nutzernamen und Passwort eintragen
5. Auf *verbinden* drücken
    ![Screenshot](img/nextcloud-connect-2.png)
6. Nun ist die Nextcloud mit PhotoPrism verbunden

## Dateien manuell zur Nextcloud hochladen ##
**Manuellen Upload einrichten:**

1. Gehe zu den *Einstellungen*
2. Öffne den *Backup* Tab
3. Klicke in den Upload Bereich deines Nextcloud servers

![Screenshot](img/upload-1.png)
4. Wähle das Verzeichnis aus, in den die Dateien gesendet werden sollen und klicke auf *speichern*

![Screenshot](img/upload-2.png)

**Hochladen von Bilder aus PhotoPrism in die Nextcloud:**

1. Gehe zu *Fotos*
2. Bilder zum Upload auswählen
3. Öffne das Kontextmenü
4. Klicke auf :material-cloud:
5. Wähle deinen Nextcloud Account und drücke auf *Upload*

![Screenshot](img/upload-3.png)

!!! Info
	Nur JPEGs werden beim manuellen Upload kopiert.
	Unterstützung für RAW Dateien und Videos wird später hinzugefügt.

!!! Achtung
	Durch ein Problem bei einigen Nextcloud Einstellungen kann es vorkommen, dass der Upload von Dateien in 0 Byte großen Dateien endet. [Hier](https://github.com/photoprism/photoprism/issues/443) findest du Informationen um das Problem zu lösen.

## Backup/Synchronisierung von Dateien mit Nextcloud ##
1. Gehe zu den *Einstellungen*
2. Öffne den *Backup* Tab
3. Klicke in den Synchronisierungsbereich des Nextcloud Servers
![Screenshot](img/sync-1.png)
4. Aktiviere Synchronisation in der oberen rechten Ecke
5. Wähle den Ordner innerhalb der Nextcloud, wo sich die Fotos befinden
6. Wähle wie oft die Dateien synchronisiert werden sollen
7. Wähle weite passende Optionen und klickt auf *speichern*

![Screenshot](img/sync-2.png)

!!! Achtung
    Videos werden nicht synchronisiert. Wir arbeiten da dran.

### Remote Synchronisierungseinstellungen ###
* *Remote Dateien herunterladen* lädt alle Dateien von der Nextcloud, die noch nicht in PhotoPrism vorliegen
* *Lokale Dateien hochladen* lädt alle Dateien von PhotoPrism hoch, die noch nicht in der Nextcloud sind
* *Dateinamen erhalten* behält die Dateinamen der Nextcloud bei und nennt keine Dateien um
* *RAW Bilder synchronisieren* synchronisiert die RAW Dateien neben den JPEGs
