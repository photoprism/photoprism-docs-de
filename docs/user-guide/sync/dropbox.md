# Synchronisierung mit Dropbox

Du kannst [Dropbox](https://www.dropbox.com/) zur Speicherung deiner Bilder verwenden und sie dann über PhotoPrism ansehen und verwalten.

1. Richte ein Dropbox-Konto ein.
2. Installiere den Dropbox-Desktop-Client.
3. Synchronisiere deine Dropbox mit einem lokalen Verzeichnis.
4. Falls du Docker verwendest, konfiguriere deine `compose.yaml` bzw. `docker-compose.yml` wie folgt:
    ```
    volumes:
      - "~/Dropbox/Photos:/photoprism/originals"
    ```
5. Folge anschließend der [Installationsanleitung](https://docs.photoprism.app/getting-started/) von PhotoPrism wie gewohnt.

## Automatischer Upload vom Smartphone

Die Dropbox-Smartphone-Apps bieten zusätzlich eine „Kamera-Upload"-Funktion, die Bilder nach Dropbox und von dort auf jeden Rechner synchronisiert, auf dem Dropbox installiert ist.

So importierst du hochgeladene Dateien automatisch in PhotoPrism:

1. Installiere die Dropbox-App für [iOS](https://itunes.apple.com/gb/app/dropbox/id327630330?mt=8) oder [Android](https://play.google.com/store/apps/details?hl=en_GB&id=com.dropbox.android).
2. Aktiviere „Kamera-Uploads" in den Einstellungen der Dropbox-App.
3. Installiere den Dropbox-[Desktop-Client](https://www.dropbox.com/install) auf deinem Server oder einem im Netzwerk erreichbaren Rechner.
4. Konfiguriere den Ordner `Camera Uploads` als dein `import`-Verzeichnis für PhotoPrism.
    In deiner `compose.yaml` bzw. `docker-compose.yml` sieht das so aus:
    ```
    volumes:
      - "~/Dropbox/Camera Uploads:/photoprism/import"
    ```
5. Optional: Aktiviere „Dateien verschieben" in den Import-Einstellungen, um importierte Dateien aus Dropbox zu entfernen. Damit sparst du Dropbox-Speicherplatz und bleibst innerhalb der kostenlosen 2‑GB‑Stufe.

!!! note ""
    Die Dropbox-Smartphone-App muss regelmäßig geöffnet werden, da sie sonst neue Bilder oft nicht erkennt und nicht synchronisiert.

## Smart / Selective Sync

Eine nützliche (allerdings kostenpflichtige) Funktion ist [Dropbox Smart Sync](https://www.dropbox.com/smart-sync) (mit optionaler automatischer Entfernung), die Dateien nur dann von den Dropbox-Servern herunterlädt, wenn du (oder PhotoPrism) auf sie zugreifst – zum Beispiel beim ersten Indexieren oder beim Herunterladen einer Originaldatei über die PhotoPrism-Benutzeroberfläche.

So lässt sich Speicherplatz auf deinem Server sparen, weil Originale automatisch ausgelagert werden, bis sie tatsächlich angezeigt werden.

!!! example ""
    **Hilf mit, diese Dokumentation zu verbessern!** Du kannst dazu beitragen, indem du auf :material-file-edit-outline: klickst, um einen Pull Request mit deinen Änderungen zu senden.
