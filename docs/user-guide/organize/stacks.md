# Bildstapel #

Zusammengehörige Dateien werden gruppiert, wenn in den [*Einstellungen*](../settings/general.md) die Option "Bildstapel" aktiviert ist.

Gruppierte Dateien werden im Bereich *Bildstapel* dargestellt.

![Screenshot](img/stack-page.png)

### Unter welchen Bedingungen können Dateien gruppiert werden? ###

1. Gleichnamige Dateien, die sich im selben Ordner befinden, z.B. `/2018/IMG_1234.jpg` und  `/2018/IMG_1234.avi`, werden immer gruppiert.
2. Dateien mit fortlaufenden Namen, wie `/2018/IMG_1234 (2).jpg` und `/2018/IMG_1234 (3).jpg`, können optional gruppiert werden.
3. Dateien, deren Metadaten zeigen, dass sie am selben Ort und in der selben Sekunde aufgenommen wurden, können optional gruppiert werden.
4. Dateien mit der gleichen *Unique Image ID* oder *XMP Instance ID* können optional gruppiert werden.

Du kannst das Verhalten der Punkte 2-4 in den [*Einstellungen*](../settings/general.md) konfigurieren.


### Gruppierte Bilder anschauen ###

1. Klicke auf :material-camera-burst:

    ![Screenshot](img/sequential1.png)

2. Mit Hilfe der Pfeile kannst du durch alle Bilder der Sequenz wechseln

    ![Screenshot](img/sequential3.png) ![Screenshot](img/sequential4.png)


### Das Anzeigebild wechseln ###
Das als *Primärdatei* ausgewählte Bild wird in den Bild-Ansichten verwendet. 
Es wird als erster Eintrag im Tab *Dateien* angezeigt.

Um die Primärdatei zu ändern:

1. Öffne den [*Bearbeitungs-Dialog*](edit.md) des Bildes
2. Gehe zu *Dateien*
3. Klicke auf :material-chevron-down: der Datei, die du als primär markieren willst
4. Klicke *Primärdatei*

      ![Screenshot](img/unstack-1.png) 


### Gruppierung von Dateien aufheben ###
1. Öffne den [*Bearbeitungs-Dialog*](edit.md) des Bildes
2. Gehe zu *Dateien*
3. Klicke auf :material-chevron-down: der Datei, die nicht als primär markiert ist
4. Klicke *Einzelaufnahme*

      ![Screenshot](img/unstack-1.png)

Das Bild wird nun separat von der anderen Datei in den Ansichten angezeigt.

![Screenshot](img/group-4.png)

### Nicht primäre Dateien endgültig löschen ###
1. Öffne den [*Bearbeitungs-Dialog*](edit.md) des Bildes
2. Gehe zu *Dateien*
3. Klicke auf :material-chevron-down: der Datei, die nicht als primär markiert ist
4. Klicke *Löschen*
5. Bestätige, dass du das Bild wirklich löschen möchtest

      ![Screenshot](img/group-5.png)