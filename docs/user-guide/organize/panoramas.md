# Panorama-Aufnahmen #

PhotoPrism markiert Bilder mit einem Seitenverhältnis von etwa 2:1 oder breiter als *Panorama*, sodass sie in den Suchergebnissen neben deinen übrigen Bildern und Videos erscheinen. Equirektangulare 360°-Fotos und -Videos werden in einem interaktiven 360°-Betrachter geöffnet, statt als flaches, verzerrtes Bild dargestellt zu werden. So kannst du dich umsehen und hineinzoomen, ohne einen separaten 360°-Modus einschalten zu müssen.

## Panoramen finden ##

Gehe zu *Suche > Panoramen*, um alle Dateien anzusehen, die als Panorama markiert wurden. Du kannst außerdem jede Suche mit dem Filter `panorama:yes` auf Panoramen einschränken. [Mehr erfahren ›](../search/filters.md)

![Screenshot](img/panorama-1-2503-german.jpg){ class="shadow" }

## Den 360°-Betrachter verwenden ##

Öffne ein equirektangulares Foto oder Video, indem du es in den Suchergebnissen anklickst. Der Betrachter erkennt geeignete Dateien automatisch und bietet die folgenden Bedienelemente:

<video class="shadow screencast" controls muted loop playsinline preload="metadata" poster="../img/panorama-360-2607.jpg">
  <source src="../img/panorama-360-2607.mp4" type="video/mp4">
  Dein Browser unterstützt keine eingebetteten Videos.
</video>

#### :material-cursor-move: Umsehen ####

Ziehe mit der Maus oder einem Finger, um die Blickrichtung zu ändern.

#### :material-magnify-plus-outline: Zoom ####

Nutze das Mausrad oder ziehe auf einem Touchscreen zwei Finger auseinander bzw. zusammen, um hinein- und herauszuzoomen.

#### :material-play-circle-outline: 360°-Videos abspielen ####

360°-Videos werden innerhalb der Kugel abgespielt, sodass du dich während der Wiedergabe weiter umsehen kannst. Über die Wiedergabesteuerung kannst du sie pausieren, fortsetzen und stummschalten.

#### :material-chevron-double-right: Weitere Bilder ####

Horizontales Ziehen dreht die Kugel, statt zum nächsten Bild zu wechseln. Verwende daher die Pfeile am linken und rechten Bildschirmrand, um zur vorherigen oder nächsten Datei zu wechseln.

## Unterstützte Dateien ##

Nur *equirektangulare* Inhalte – eine vollständige Kugel, die in ein einzelnes Bild mit einem Seitenverhältnis von etwa 2:1 aufgeklappt wurde – können interaktiv dargestellt werden:

- Bilder werden anhand des Projektionstyps `equirectangular` erkannt, der in ihren [Exif](https://docs.photoprism.app/developer-guide/metadata/exif/)- oder [XMP](https://docs.photoprism.app/developer-guide/metadata/xmp/)-Metadaten gespeichert ist und von den meisten 360°-Kameras beim Speichern geschrieben wird; `GPano`-Metadaten werden ebenfalls akzeptiert
- Videos enthalten oft keine auslesbaren Projektionsdaten. Ein Video wird daher im 360°-Betrachter angezeigt, wenn es als *Panorama* markiert ist und seine Bildgröße ungefähr 2:1 beträgt
- Andere Projektionstypen wie Cubemaps und zylindrische Panoramen sowie ultrabreite Videos werden als normale Bilder angezeigt, da sie als Kugel gerendert verzerrt wären

!!! note ""
    Für die Darstellung einer Kugel wird ein Browser mit [WebGL](https://caniuse.com/webgl)-Unterstützung benötigt, die in allen aktuellen Browsern standardmäßig aktiviert ist. Beachte, dass das manuelle Markieren von Gesichtern auf 360°-Inhalten noch nicht unterstützt wird.

## Bildqualität ##

Da du tief in ein 360°-Bild hineinzoomen kannst, gehen Details schnell verloren, wenn die erzeugte Vorschau zu klein ist. Wenn du hochauflösende Originale hast, empfehlen wir daher, die [statischen und dynamischen Maximalgrößen](../settings/advanced.md#vorschaubilder) auf einen zu deinen Dateien passenden Wert zu erhöhen – Größen bis 16K UHD (15360×8640) werden unterstützt. Die Auflösung transkodierter Videos wird separat über die Option [`PHOTOPRISM_FFMPEG_SIZE`](https://docs.photoprism.app/getting-started/advanced/transcoding/) konfiguriert.

Bedenke, dass größere Vorschaubilder mehr Speicherplatz benötigen und länger zum Erzeugen brauchen. Wähle daher die kleinste Größe, die auf deinen Bildschirmen noch gut aussieht.

## Panorama Status bearbeiten ##

Wenn eine 360°-Datei nicht automatisch erkannt wird – zum Beispiel ein Kugelvideo, dessen Metadaten keinen Projektionstyp enthalten – kannst du den *Panorama*-Status manuell setzen:

1. Öffne den [*Bearbeitungs-Dialog*](edit.md)
2. Klicke :material-cog:
3. Setze oder entferne den Panorama-Status

![Screenshot](img/panorama-2-2503-german.jpg){ class="shadow" }

!!! tldr ""
    Wenn du den Panorama-Status von einem 360°-Video entfernst, wird es auch nicht mehr im 360°-Betrachter angezeigt, da der Status Videos als kugelförmig kennzeichnet, solange ihre Metadaten keinen Projektionstyp enthalten. Bilder mit dem Projektionstyp `equirectangular` sind davon nicht betroffen.
