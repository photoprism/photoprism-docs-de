# Synchronisations Einstellungen #
Diese Seite beschreibt, wie PhotoPrism Dateien von einem externen Speichersystem (wie ownCloud) über WebDAV synchronisieren kann.

!!! tldr ""
    Da diese Einstellungen ohne Authentifizierung nicht sicher sind, sind sie nicht verfügbar, wenn du PhotoPrism im [public Modus](https://docs.photoprism.app/getting-started/config-options/#authentication) verwendest.


## Mit WebDAV Server verbinden ##
PhotoPrism kann mit anderen WebDAV Servern verbunden werden. So können zum Beispiel automatisch Backups auf deiner ownCloud Instanz erstellt oder
neue Bilder von deiner ownCloud Instanz in PhotoPrism geladen werden.

**Verbindung zu WebDAV Server konfigurieren**

1. Gehe zu *Einstellungen*
2. Öffne das *Sync* Tab
3. Klicke auf *Server hinzufügen*
   ![Screenshot](img/sync-1.png){ class="shadow" }
4.  Trage die Server URL, den Nutzernamen sowie das Passwort ein
5. Klicke *Verbinden*
   ![Screenshot](img/sync-2.png){ class="shadow" }
6. Dein Server ist jetzt mit PhotoPrism verbunden

## Dateien manuell auf den Server hochladen ##
**Manuellen Upload einrichten:**

1. Gehe zu *Einstellungen*
2. Öffne das *Sync* Tab
3. Klicke in den Upload Bereich deines Servers

![Screenshot](img/sync-upload-1.png){ class="shadow" }
4. Wähle den Ordner, in den die Dateien hochgeladen werden sollen und klicke *Speichern*

![Screenshot](img/sync-upload-2.png){ class="shadow" }

**Bilder von PhotoPrism auf den Server laden:**

1. Gehe zu *Suche*
2. Selektiere Bilder, die du hochladen möchtest
3. Öffne das Kontext-Menü
4. Klicke :material-cloud:
5. Wähle deinen Account und klicke *Upload*

![Screenshot](img/upload-3.png){ class="shadow" }

!!! attention ""
	Auf Grund von Problemen bei bestimmten Nextcloud Einstellungen kann es vorkommen, dass nach dem Upload bei Nextcloud nur 0 Byte große Dateien ankommen. 
	[Hier](https://github.com/photoprism/photoprism/issues/443) findest du Informationen, die dir helfen, das Problem zu beheben.

## Dateien von/zu einem WebDAV Server herunterladen/hochladen##
**Synchronisation einrichten:**

1. Gehe zu *Einstellungen*
2. Öffne das *Sync* Tab
3. Klicke in den Sync Bereich deines Servers
   ![Screenshot](img/sync-sync-1.png){ class="shadow" }
4. Aktiviere die Synchronisation in der Ecke oben rechts
5. Wähle den Ordner, in welchem sich deine Bilder befinden
6. Entscheide wie oft die Dateien synchronisiert werden sollen
7. Selektiere alle Optionen, die zu deinem Anwendungsfall passen und klicke *Speichern*

![Screenshot](img/sync-sync-2.png){ class="shadow" }

### Backup Optionen ###
* *Dateien herunterladen*  - alle Dateien, die noch nicht in PhotoPrism existieren, werden regelmäßig von deinem Server heruntergeladen
* *Dateien hochladen* - alle Dateien (auch als privat markierte oder archivierte), die auf deinem Server noch nicht existieren, werden regelmäßig von PhotoPrism auf deinen Server geladen
* *Namen beibehalten* - Dateinamen von deinem Server werden beibehalten
* *RAWs und Videos kopieren* - Neben JPEGs werden auch RAW Dateien und Videos synchronisiert
