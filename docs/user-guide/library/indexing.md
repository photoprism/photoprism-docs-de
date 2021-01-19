# Dateien indexieren #

!!! Info
    Wenn du PhotoPrism zum ersten Mal verwendest, stelle sicher, dass deine Foto und Video 
    Sammlung als *Originals* Ordner konfiguriert ist.
    Details hierzu findest du in unserer [Installationsanleitung](https://docs.photoprism.org/getting-started/).
    Wenn du mit einem leeren *Originals* Ordner beginnst, musst du diesem zunächst Dateien über dein Dateisystem hinzufügen.

1. Öffne den Bereich *Dateien*, indem du auf den Link in der Hauptnavigation klickst

2. Wählen einen Unterordner aus, oder nutze die Standardeinstellung, um alle Dateien zu indexieren

3. Wähle *Index vollständig aktualisieren*, falls du alle Dateien, einschließlich bereits indexierterer und unveränderter Dateien, indexieren möchtest

4. Klicke *Start*, um mit der Indexierung zu beginnen


![Screenshot](img/index.png)


!!! Tipp
    Zum Hinzufügen von Dateien zum *Originals* Ordner kann [WebDAV](webdav.md) verwendet werden.
    Das ist besonders hilfreich, wenn PhotoPrism auf einem Remoteserver ausgeführt wird.

!!! Tipp 
    Ein NSFW-Detektor kann aktiviert werden, um Bilder, mit anstößigem Inhalt, automatisch als privat zu kennzeichnen. 
    Beachte, dass der Mechanismus nicht 100% zuverlässig ist. 

#### Wann sollte ich den Index vollständig aktualisieren? ####

Wenn die Option "Index vollständig aktualisieren" gewählt ist, werden alle Dateien in *Originals* neu indexiert. Also auch Dateien, die bereits indexiert und nicht verändert wurden. 
Das kann nach einem Upgrade auf eine neue Hauptversion erforderlich sein.

#### Automatisch Indexieren ####
15 Minuten, nachdem Änderungen über WebDAV am Originals Verzeichnis vorgnommen wurden, wird der Indexer automatisch gestartet.
Die Standardeinstellung von 15 Minuten kann über die [Konfigurations-Optionen](https://docs.photoprism.org/getting-started/config-options/) angepasst werden.