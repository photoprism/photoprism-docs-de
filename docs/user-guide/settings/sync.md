# Synchronisations Einstellungen #

## Mit WebDAV Server verbinden ##
PhotoPrism kann mit anderen WebDAV Servern verbunden werden. So können zum Beispiel automatisch Backups auf deiner ownCloud Instanz erstellt oder
neue Bilder von deiner ownCloud Instanz in PhotoPrism geladen werden.

**Verbindung zu WebDAV Server konfigurieren**

1. Gehe zu *Einstellungen*
2. Öffne das *Sync* Tab
3. Klicke auf *Server hinzufügen*
   ![Screenshot](img/sync-1.png)
4.  Trage die Server URL, den Nutzernamen sowie das Passwort ein
5. Klicke *Verbinden*
   ![Screenshot](img/sync-2.png)
6. Dein Server ist jetzt mit PhotoPrism verbunden

## Dateien manuell auf den Server hochladen ##
**Manuellen Upload einrichten:**

1. Gehe zu *Einstellungen*
2. Öffne das *Sync* Tab
3. Klicke in den Upload Bereich deines Servers

![Screenshot](img/sync-upload-1.png)
4. Wähle den Ordner, in den die Dateien hochgeladen werden sollen und klicke *Speichern*

![Screenshot](img/sync-upload-2.png)

**Bilder von PhotoPrism auf den Server laden:**

1. Gehe zu *Suche*
2. Selektiere Bilder, die du hochladen möchtest
3. Öffne das Kontext-Menü
4. Klicke :material-cloud:
5. Wähle deinen Account und klicke *Upload*

![Screenshot](img/upload-3.png)

!!! Info
	Aktuell werden beim manuellen Upload nur JPEGs kopiert.
	Unterstützung für RAW und Video Dateien ist geplant.

!!! Attention
	Auf Grund von Problemen bei bestimmten Nextcloud Einstellungen kann es vorkommen, dass nach dem Upload bei Nextcloud nur 0 Byte große Dateien ankommen. 
	[Hier](https://github.com/photoprism/photoprism/issues/443) findest du Informationen, die dir helfen, das Problem zu beheben.

## Backup/Synchronisation von Dateien mit einem WebDAV Server ##
**Synchronisation einrichten:**

1. Gehe zu *Einstellungen*
2. Öffne das *Sync* Tab
3. Klicke in den Sync Bereich deines Servers
   ![Screenshot](img/sync-sync-1.png)
4. Aktiviere die Synchronisation in der Ecke oben rechts
5. Wähle den Ordner, in welchem sich deine Bilder befinden
6. Entscheide wie oft die Dateien synchronisiert werden sollen
7. Selektiere alle Optionen, die zu deinem Anwendungsfall passen und klicke *Speichern*

![Screenshot](img/sync-sync-2.png)

### Backup Optionen ###
* *Dateien herunterladen*  - alle Dateien, die noch nicht in PhotoPrism existieren, werden regelmäßig von deinem Server heruntergeladen
* *Dateien hochladen* - alle Dateien, die auf deinem Server noch nicht existieren, werden regelmäßig von PhotoPrism auf deinen Server geladen
* *Namen beibehalten* - Dateinamen von deinem Server werden beibehalten
* *RAWs und Videos kopieren* - Neben JPEGs werden auch RAW Dateien und Videos synchronisiert
