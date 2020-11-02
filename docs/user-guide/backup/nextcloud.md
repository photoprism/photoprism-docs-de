# Backup und Synchronisation mit Nextcloud #

## Mit Nextcloud verbinden ##
PhotoPrism kann mit einem Nextcloud Server verbunden werden. So können zum Beispiel automatisch Backups auf deiner Nextcloud Instanz erstellt oder
 neue Bilder von deiner Nextcloud Instanz in PhotoPrism geladen werden.

**Verbindung aufbauen:**

1. Gehe zu *Einstellungen*
2. Öffne das *Backup* Tab
3. Klicke auf *Server hinzufügen*
    ![Screenshot](img/nextcloud-connect.png)
4.  Trage die Nextcloud Server URL, den Nutzernamen sowie das Passwort ein
5. Klicke *Verbinden*
    ![Screenshot](img/nextcloud-connect-2.png)
6. Deine Nextcloud Instanz ist jetzt mit PhotoPrism verbunden

## Dateien manuell zu Nextcloud hochladen ##
**Manuellen Upload einrichten:**

1. Gehe zu *Einstellungen*
2. Öffne das *Backup* Tab
3. Klicke in den Upload Bereich deines Nextcloud Servers

![Screenshot](img/upload-1.png)
4. Wähle den Ordner, in den die Dateien hochgeladen werden sollen und klicke *Speichern*

![Screenshot](img/upload-2.png)

**Bilder von PhotoPrism zu Nextcloud laden:**

1. Gehe zu *Fotos*
2. Selektiere Bilder, die du hochladen möchtest
3. Öffne das Kontextmenü
4. Klicke :material-cloud:
5. Wähle deinen Nextcloud Account und klicke *Upload*

![Screenshot](img/upload-3.png)

!!! Info
	Aktuell werden nur JPEGs beim manuellen Upload kopiert.
	Unterstützung für RAW und Video Dateien ist geplant.

!!! Achtung
	Auf Grund von Problemen bei bestimmten Nextcloud Einstellungen kann es vorkommen, dass nach dem Upload bei Nextcloud nur 0 Byte große Dateien ankommen. 
	[Hier](https://github.com/photoprism/photoprism/issues/443) findest du Informationen, die dir helfen, das Problem zu beheben.

## Backup/Synchronisation von Dateien mit Nextcloud ##
**Synchronisierung einrichten:**

1. Gehe zu *Einstellungen*
2. Öffne das *Backup* Tab
3. Klicke in den Sync Bereich deines Nextcloud Servers
![Screenshot](img/sync-1.png)
4. Aktiviere die Synchronisation in der Ecke oben rechts
5. Wähle den Ordner, in welchem sich deine Bilder bei Nextcloud befinden
6. Entscheide wie oft die Dateien synchronisiert werden sollen
7. Selektiere alle Optionen, die zu deinem Anwendungsfall passen und klicke *Speichern*

![Screenshot](img/sync-2.png)

!!! Achtung
    Videos werden noch nicht synchronisiert. Wir arbeiten daran.

### Backup / Synchronisation Optionen ###
* *Dateien herunterladen*  - alle Dateien, die noch nicht in PhotoPrism existieren, werden regelmäßig von deiner Nextcloud Instanz heruntergeladen
* *Dateien hochladen* - alle Dateien, die auf deiner Nextcloud noch nicht existieren, werden regelmäßig von PhotoPrism auf deine Nextcloud Instanz geladen
* *Namen beibehalten* Dateinamen von Nextcloud werden beibehalten
* *RAW-Dateien sichern* Neben JPEGs werden auch RAW Dateien synchronisiert
