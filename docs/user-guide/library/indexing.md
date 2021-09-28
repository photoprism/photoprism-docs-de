# Das Originals-Verzeichnis Indexieren #

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


!!! Info
    Zum Hinzufügen von Dateien zum *Originals* Ordner kann [WebDAV](webdav.md) verwendet werden.
    Das ist besonders hilfreich, wenn PhotoPrism auf einem Remote-Server ausgeführt wird oder du Dateien von deinem Handy synchronisieren möchtest.

!!! Info 
    Ein NSFW-Detektor kann aktiviert werden, um Bilder, mit anstößigem Inhalt, automatisch als privat zu kennzeichnen. 
    Beachte, dass der Mechanismus nicht 100% zuverlässig ist. 

#### Verzeichnisse und Dateien Ignorieren ####
Versteckte Dateien oder Ordner, deren Namen mit `.` oder `@` beginnen, werden automatisch ignoriert.
Falls bestimmte Dateien oder Ordner nicht indexiert werden sollen, erstelle eine `.ppignore` Datei im Verzeichnis, in welchem diese Dateien/Ordner liegen.
In dieser Datei kannst du konfigurieren, welche Dateien oder Ordner ignoriert werden sollen.

```
# Ignoriere den Ordner "foo"
foo
# Ignoriere alle Dateien in diesem Ordner
*.*
# Ignoriere alle Dateien, die auf .gif enden
*.gif
# Ignoriere Videos, deren Name mit MVI beginnt
MVI_*.MOV
# oder
MVI_*.*
```

Dateien werden im Ordner, in welchem die .ppignore Datei liegt, sowie in allen Unterordnern ignoriert. 
Du kannst `*` als Wildcard benutzen.

Bereits indexierte Dateien und Ordner werden nicht nachträglich aus dem Index entfernt, wenn du Sie auf die Ignorieren Liste setzt.
Hast du Dateien, die du ignorieren willst, bereits indexiert, kannst du die Datenbank zurücksetzen, um mit einem neuen Index zu starten.

#### Index Vollständig Aktualisieren ####

Wenn die Option "Index vollständig aktualisieren" gewählt ist, werden alle Dateien in *Originals* neu indexiert. Also auch Dateien, die bereits indexiert und nicht verändert wurden. 
Das kann nach einem Upgrade auf eine neue Hauptversion erforderlich sein.

#### Automatisch Indexieren ####
15 Minuten, nachdem Änderungen über WebDAV am Originals Verzeichnis vorgnommen wurden, wird der Indexer automatisch gestartet.
Die Standardeinstellung von 15 Minuten kann über die [Konfigurations-Parameter](https://docs.photoprism.org/getting-started/config-options/) angepasst werden.