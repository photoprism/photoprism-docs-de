### Videos ###
Videos mit dem MPEG-4 AVC Format können von den meisten modernen Browsern abgespielt werden.
PhotoPrism verwendet [*ffmpeg*](https://www.ffmpeg.org/documentation.html), um andere Videoformate in MPEG4-AVC zu transkodieren.
Aktuell werden alle Formate, die von ffmpeg transkodiert werden können unterstützt.

!!! info ""
    Falls du ein Format findest, das nicht abgespielt werden kann, melde dich gerne bei uns.

!!! info ""
    PhotoPrism transkodiert Videos, wenn sie zum ersten Mal abgespielt werden. Bei sehr langen Videos kann das zu längeren Ladezeiten führen.
    Du kannst den Befehl `docker-compose exec photoprism photoprism convert` verwenden, um deine Videos schon vor dem Abspielen zu transkodieren.

Im Bereich *Videos* findest du alle Videos deiner Sammlung. Um ein Video abzuspielen, klicke auf :material-play:.

![Screenshot](img/video-1.png)

### Live-Fotos ###
Live-Fotos werden wie normale Bilder behandelt. Sie sind mit :material-adjust: in der linken oberen Ecke markiert.

Um nach Live-Fotos zu filtern, nutze den Filter `type:live`.

![Screenshot](img/live-photo.png)

Um ein Live-Foto abzuspielen, bewege den Mauszeiger auf das Bild.
