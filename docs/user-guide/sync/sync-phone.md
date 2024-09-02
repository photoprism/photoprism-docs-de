# Bilder von mobilen Endgeräten synchronisieren #

Um Bilder und Videos zwischen deinem Handy und PhotoPrism zu synchronisieren, kannst du jede App verwenden, die das [WebDAV-Protokoll](./webdav.md) unterstützt.

Aus eigener Erfahrung können wir [PhotoSync](https://link.photoprism.app/photosync) sehr empfehlen, da es eine der funktionsreichsten und ausgereiftesten Apps ist, die derzeit für iOS und Android erhältlich sind.

Eine Übersicht über [mobile Sync-Apps](#sync-apps-fur-ios-und-android) für iOS und Android findest du unten.


!!! info ""
    WebDAV kann in den [Erweiterten Einstellungen](../settings/advanced.md) deaktiviert werden.
    Da der WebDAV-Server Schreibrechte und Authentifizierung erfordert, wird er automatisch deaktiviert, wenn du PhotoPrism im [public](https://docs.photoprism.app/getting-started/config-options/#authentication) und/oder [schreibgeschützten Modus](https://docs.photoprism.app/getting-started/config-options/#feature-flags) betreibst.

## PhotoSync verwenden ##

### Übertragungsziel einrichten ###

1. Öffne PhotoSync und klicke :material-cog-outline:
2. Klicke *Konfigurieren*
3. Wähle PhotoPrism als Übertragungsziel

      ![Screenshot](img/photosync-1.jpg){: style="width:35%" class="shadow"}
      ![Screenshot](img/photosync-2.jpg){: style="width:35%" class="shadow"}
   
4. Trage deine PhotoPrism Konfiguration ein

    !!! info ""
        *Server:* Deine Server Url, z.B. "example.com".

        *Port:* Dein Port. Falls du HTTPS verwendest ist der Port 443.

        *Login:* Dein Benutzername, z.B. "admin".
        
        *Password:* Dein Admin Passwort.

        *Directory:* /import/ oder /originals/ jenachdem, wie du deine Dateien [einlesen möchtest](../library/import-vs-index.md).
        
        *Use SSL:* Sollte aktiviert sein.

        [PikaPods](https://docs.photoprism.app/getting-started/cloud/pikapods/) Benutzer können [hier](https://docs.pikapods.com/apps/photoprism/#sync-from-mobile-apps) weitere Informationen finden. 

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

## Sync Apps für iOS und Android##
Als Alternative zu [PhotoSync](https://link.photoprism.app/photosync) kannst du auch eine Vielzahl anderer Apps verwenden, um deine Bilder mit PhotoPrism zu synchronisieren, entweder [direkt über WebDAV](./webdav.md#server-url) oder indem du den Originals Ordner als [SMB-Netzlaufwerk](https://ubuntu.com/server/docs/samba-as-a-file-server){:target="_blank"} über dein [Betriebssystem](https://support.microsoft.com/en-us/windows/file-sharing-over-a-network-in-windows-b58704b2-f53a-4b82-7bc1-80f9994725bf){:target="_blank"} oder deinen [Cloud-Anbieter](https://learn.microsoft.com/en-us/azure/storage/files/files-smb-protocol){:target="_blank"} freigibst:

| Name                                                                                                                            | Platform     | Synchronisation                     | Preis     | Download                                                                                                                                                                                                                |
|---------------------------------------------------------------------------------------------------------------------------------|--------------|-------------------------------------|-----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [PhotoSync Pro](https://www.photosync-app.com/support/ios/answers/what-is-the-difference-between-photosync-pro-and-premium)     | iOS, Android | [WebDAV](#photosync-verwenden), SMB     | €6.99     | [App Store](https://link.photoprism.app/photosync-ios), [Google Play](https://link.photoprism.app/photosync-android)                                                                                                    |
| [PhotoSync Premium](https://www.photosync-app.com/support/ios/answers/what-is-the-difference-between-photosync-pro-and-premium) | iOS, Android | [WebDAV](#photosync-verwenden), SMB     | €24.99    | [App Store](https://link.photoprism.app/photosync-ios), [Google Play](https://link.photoprism.app/photosync-android)                                                                                                    |
| [EasySync](https://github.com/phpbg/easysync)                                                                                   | Android      | [WebDAV](webdav.md#server-url)      | €2.99     | [Google Play](https://play.google.com/store/apps/details?id=com.phpbg.easysync&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1), [F-Droid](https://f-droid.org/packages/com.phpbg.easysync) |
| [Syncthing](https://syncthing.net/)                                                                                             | Android      | Syncthing                           | Kostenlos | [Google Play](https://play.google.com/store/apps/details?id=com.nutomic.syncthingandroid)                                                                                                                               |
| [FolderSync Pro](https://foldersync.io/)                                                                                        | Android      | [WebDAV](webdav.md#server-url), SMB | €6.49     | [Google Play](https://play.google.com/store/apps/details?id=dk.tacit.android.foldersync.full)                                                                                                                           |
| [Owlfiles Pro](https://www.skyjos.com/owlfiles/)                                                                                | iOS, Android | [WebDAV](webdav.md#server-url), SMB | €59.99    | [App Store](https://itunes.apple.com/app/id510282524), [Google Play](https://play.google.com/store/apps/details?id=com.skyjos.apps.fileexplorerfree)                                                                    |


!!! note ""
      Beachte, dass diese Übersicht nur der Orientierung dient und dass wir keinen [technischen Support](https://www.photoprism.app/kb/getting-support) für diese Apps leisten können. Wenn du Probleme hast, wende dich bitte an den Autor oder bitte die Community um Hilfe. Du kannst gerne weitere Synchronisierungs-Apps [vorschlagen](https://github.com/photoprism/photoprism-docs/tree/master/docs/user-guide/sync/mobile-devices.md), damit wir sie in diese Liste aufnehmen können.