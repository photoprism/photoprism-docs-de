# Bilder von mobilen Endgeräten synchronisieren #
Um Bilder und Videos von deinem Handy mit PhotoPrism zu synchronisieren, kannst du jede App, die Datei-Synchronisation mit WebDAV unterstützt, verwenden.

!!! info ""
    WebDAV kann in den [Erweiterten Einstellungen](../settings/advanced.md) deaktiviert werden.
    Da der WebDAV-Server Schreibrechte und Authentifizierung erfordert, wird er automatisch deaktiviert, wenn du PhotoPrism im [public](https://docs.photoprism.app/getting-started/config-options/#authentication) und/oder [schreibgeschützten Modus](https://docs.photoprism.app/getting-started/config-options/#feature-flags) betreibst.

## PhotoSync ##
Wir empfehlen die, für iOS und Android verfügbare, App [PhotoSync](https://link.photoprism.app/photosync).

### Übertragungsziel einrichten ###

!!! attention ""
    Falls du PhotoSync auf Android nutzt, wähle WebDAV als Übertragungsziel. 

1. Öffne PhotoSync und klicke :material-cog-outline:
2. Klicke *Konfigurieren*
3. Wähle PhotoPrism als Übertragungsziel

      ![Screenshot](img/photosync-1.jpg){: style="width:35%" class="shadow"}
      ![Screenshot](img/photosync-2.jpg){: style="width:35%" class="shadow"}
   
4. Trage deine PhotoPrism Konfiguration ein

      ![Screenshot](img/photosync-3.jpg){: style="width:35%" class="shadow"}

5. Klicke *Fertig*
6. Du kannst die Übertragungsdetails deinen Wünschen anpassen
   
      ![Screenshot](img/photosync-4.jpg){: style="width:35%" class="shadow"}
      ![Screenshot](img/photosync-5.jpg){: style="width:35%" class="shadow"}
   
### Automatische Synchronisation einrichten ###
1. Öffne PhotoSync und klicke :material-cog-outline:
2. Klicke *Autotransfer*

      ![Screenshot](img/photosync-1.jpg){: style="width:35%" class="shadow"}

3. Klicke *Neuer Auslöser* und wähle mindestens einen Auslöser
   
      ![Screenshot](img/photosync-6.jpg){: style="width:35%" class="shadow"}
   
4. Wähle PhotoPrism als Übertragungsziel
5. Klicke *Fertig*

      ![Screenshot](img/photosync-7.jpg){: style="width:35%" class="shadow"}

PhotoPrism startet den Import- bzw. Indexiervorgang automatisch, nachdem neue Dateien mit PhotoSync übertragen wurden.

## Andere Apps ##
Wenn du PhotoPrism auf einem Gerät ausführst, das Samba (Windows File Sharing) unterstützt, kannst du auch diese kostenlose open source Android App verwenden:
[SMBSync2 - Github](https://github.com/Sentaroh/SMBSync2/releases) | [SMBSync2 - Google Play](https://play.google.com/store/apps/details?id=com.sentaroh.android.SMBSync2)
