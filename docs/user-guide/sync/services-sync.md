# Dateien mit anderen Apps synchronisieren #

In den [Einstellungen > Dienste](../settings/sync.md) kannst du deine PhotoPrism-Instanz mit anderen Diensten mit WebDAV-Unterstützung verbinden, zum Beispiel mit anderen PhotoPrism-Instanzen, Nextcloud oder ownCloud.

!!! attention ""
      Bei der Synchronisierung werden deine Dateien zu/von einem anderen Dienst hoch- oder heruntergeladen, was zusätzlichen Speicherplatz erfordert.

    Wenn PhotoPrism Dateien aus einer anderen lokalen Anwendung, z. B. Nextcloud, indexieren soll, empfehlen wir, deren Speicherordner [als originals Ordner einzubinden](https://docs.photoprism.app/getting-started/docker-compose/#photoprismoriginals), anstatt die Dateien über WebDAV zu synchronisieren. Dadurch wird verhindert, dass unnötige Kopien deiner Dateien erstellt werden.


## Dateien von/zu einerApp herunterladen/hochladen##
1. Gehe zu *Einstellungen*
2. Öffne das *Dienste* Tab
3. Klicke in den Sync Bereich deines Servers
   ![Screenshot](img/services-sync-1-german.jpg){ class="shadow" }
4. Aktiviere die Synchronisation in der Ecke oben rechts
5. Wähle den Ordner, in welchem sich deine Bilder befinden
6. Entscheide wie oft die Dateien synchronisiert werden sollen
7. Selektiere alle Optionen, die zu deinem Anwendungsfall passen und klicke *Speichern*

![Screenshot](img/services-sync-2-german.jpg){ class="shadow" }

### Synchronisations-Optionen ###
* *Dateien herunterladen*  - alle Dateien, die noch nicht in PhotoPrism existieren, werden regelmäßig von deinem Dienst heruntergeladen
* *Dateien hochladen* - alle Dateien (auch als privat markierte oder archivierte), die auf deinem Dienst noch nicht existieren, werden regelmäßig hochgeladen
* *Namen beibehalten* - Dateinamen werden beibehalten
* *RAWs und Videos kopieren* - Neben JPEGs werden auch RAW Dateien und Videos synchronisiert