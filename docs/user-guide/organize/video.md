### Videos ###
Im Bereich *Videos* findest du alle Videos deiner Sammlung. Um ein Video abzuspielen, klicke auf :material-play:.

Videos mit dem MPEG-4 AVC Format können von den meisten modernen Browsern abgespielt werden.
Andere Formate werden im Hintergrund automatisch mit [Ffmpeg](https://www.ffmpeg.org/documentation.html) transkodiert, damit sie ohne Probleme abgespielt werden können.

Beachte, dass nicht alle [Video- und Audioformate](https://caniuse.com/?search=video%20format) von jedem [Browser abgespielt](https://docs.photoprism.app/getting-started/troubleshooting/browsers/) werden können. 
So wird beispielsweise [AAC](https://caniuse.com/aac) - der Standard-Audiocodec für [MPEG-4 AVC / H.264](https://caniuse.com/mpeg4) - in Chrome, Safari und Edge nativ unterstützt, 
während er in Firefox und Opera nur optional vom Betriebssystem unterstützt wird.

![Screenshot](img/video-1.png){ class="shadow" }

### Live-Fotos ###
Kurze Videos von bis zu 3 Sekunden, werden unabhängig vom Handy-Model als Live Foto kategorisiert.
Sie sind mit :material-adjust: in der linken oberen Ecke markiert.

Um nach Live-Fotos zu filtern, nutze den Filter `type:live`. Um ein Live-Foto abzuspielen, bewege den Mauszeiger auf das Bild.

![Screenshot](img/live-photo.png){ class="shadow" }

### Transkodierung ###

Videos, die nicht das AVC Format haben, werden bei Bedarf transkodiert.
Bei sehr langen Videos kann das zu längeren Ladezeiten führen, wenn das Video zum ersten Mal abgespielt wird.

Du kannst den Befehl


```
docker-compose exec photoprism photoprism convert
```

verwenden, um deine Videos schon vor dem Abspielen zu transkodieren.

!!! note ""
    Vergewissere dich, dass dein Server genug freien Speicherplatz zur verfügung hat, bevor du deine Videos transkodierst. 

!!! tldr ""
    HEVC-Videodateien können auch die Dateiendung `.mp4` haben, die normalerweise mit AVC assoziiert wird. Dies liegt daran, dass MP4 ein
    *Container*-Format ist, was bedeutet, dass der eigentliche Videoinhalt mit H.264, H.265 oder etwas anderem komprimiert sein kann.
    Die Dateiendung sagt eigentlich nichts anderes aus, als dass es sich wahrscheinlich um eine Videodatei handelt.