
Nach der [Installation](https://docs.photoprism.app/getting-started/) sind nur noch zwei weitere Schritte erforderlich,
bevor du mit dem Durchsuchen deiner Bilder beginnen kannst:

- Passe deine [Inhalts](./settings/library.md) und die [erweiterten Einstellungen](./settings/advanced.md) an deine persönlichen Vorlieben an
- [Wähle](./library/import-vs-index.md), ob du deine [Originale direkt indexieren](./library/indexing.md) willst, wobei alle Datei- und Ordnernamen unverändert bleiben,
  oder ob du die optionale [Importfunktion](./library/import.md) verwenden willst, die automatisch Duplikate entfernt,
  Dateien einen eindeutigen Namen gibt und sie nach Jahr und Monat sortiert

Wenn du Ordner verwenden möchtest, die bereits auf deinem Computer existieren, stelle sicher, dass du sie während der Einrichtung als originals- bzw. import Ordner konfiguriert hast.

Um neue Bilder hinzuzufügen, kannst du sie entweder in den originals- oder import Ordner kopieren, z. B. mit [WebDAV](./sync/webdav.md), oder sie mit einem Browser [hochladen](./library/upload.md), der sie automatisch importiert, sobald sie hochgeladen sind.

Starte dann die [Indexierung](library/indexing.md) oder den [Import](library/import.md), je nachdem, welche Strategie du gewählt hast.

!!! tldr ""
    Stelle sicher, dass [genügend Speicherplatz](https://docs.photoprism.app/getting-started/troubleshooting/docker/#disk-space) für die Erstellung von Thumbnails zur Verfügung steht und überprüfe die [Dateisystemberechtigungen](https://docs.photoprism.app/getting-started/troubleshooting/docker/#file-permissions),
    bevor du mit der Indexierung beginnst: Die Dateien im Originals Ordner müssen lesbar sein, während der Storage Ordner einschließlich
    aller Unterverzeichnisse lesbar und schreibbar sein muss.

## Während die Indexierung noch läuft...

Deine Fotos und Videos werden nach und nach in den Suchergebnissen und anderen Bereichen der Benutzeroberfläche sichtbar.
Öffne den Tab *Logs* im Bereich *Dateien*, um die Arbeit des Indexers zu beobachten.
Die Anzahl in der Navigation wird ständig aktualisiert, so dass du den Fortschritt verfolgen kannst.

Falls einige deiner Bilder nach Abschluss der Indexierung immer noch fehlen, sind sie möglicherweise aufgrund von schlechter Qualität oder unvollständigen Metadaten im Bereich [Überprüfen](./organize/review.md).
Du kannst diese und andere Funktionen in den [Einstellungen](./settings/library.md) deaktivieren.

Natürlich kannst du weiterhin deine bevorzugten Programme zur Verarbeitung von RAW-Dateien, zur Bearbeitung von Metadaten oder zum Importieren neuer Aufnahmen verwenden.
Gehe zu *Dateien> Index* und klicke auf Start, um den Index zu aktualisieren, nachdem Dateien geändert, hinzugefügt oder entfernt wurden.
Dies kann auch über die Konfigurationsoption [`PHOTOPRISM_INDEX_SCHEDULE`](https://docs.photoprism.app/getting-started/config-options/#indexing) automatisiert werden.

!!! tldr ""
    Bei der Indexierung können JPEG-Sidecar-Dateien für Originale in anderen Formaten wie RAW und HEIF erstellt werden. Dies ist für die Bildklassifizierung, die Gesichtserkennung und für die Anzeige in einem Webbrowser erforderlich.
    Sidecar- und Thumbnail-Dateien werden dem storage Ordner hinzugefügt, so dass der Ordner mit den Originalen nicht verändert wird.

## Geräte einrichten
Sobald die Indexierung abgeschlossen ist und du mit den Ergebnissen zufrieden bist, kannst du die [automatische Synchronisierung](./sync/sync-phone.md) von deinem Handy aus einrichten und die [Progressive Web App](./pwa.md) (PWA) je nach Bedarf auf deinem Desktop sowie deinen mobilen Endgeräten installieren.
