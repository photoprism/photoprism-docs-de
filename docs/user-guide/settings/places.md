# PhotoPrism Orte #

Wir haben kürzlich *PhotoPrism Places* gestartet, eine Geokodierungs-API, die die OpenStreetMap-Entwicklungsinfrastruktur ersetzt. Unsere Benutzer genießen jetzt eine viel bessere Leistung, höhere Verfügbarkeit und mehr Privatsphäre. Darüber hinaus werden wir Informationen zu öffentlichen Veranstaltungen hinzufügen, die an einem Ort stattgefunden haben. Dies kann verwendet werden, um automatisch Alben von Festivals für populäre Musik oder Sportveranstaltungen zu erstellen.

## Privatsphäre ##

Geokodierungsanforderungen werden NICHT protokolliert, aber Entwickler können zwischengespeicherte Elemente in MariaDB natürlich ohne persönliche Informationen anzeigen. Das ist der Punkt eines Caches. Diese werden nach dem Zufallsprinzip mit Hotspots rund um Touristenattraktionen und Großstädte verteilt.

Aufgrund von HTTPS kann Ihr Internetprovider die genaue Anfrage nicht sehen, nur dass Sie einen Server kontaktiert haben.

Die API approximiert Koordinaten und codiert sie mit [S2](https://s2geometry.io/resources/s2cell_statistics.html) und kümmert sich nicht um Straße oder Hausnummer:

![](https://pbs.twimg.com/media/EN9AoYdWkAIqVDD?format=jpg&name=medium)

## Performance ##

Zuerst [Benchmarks](https://github.com/tsliwowicz/go-wrk) zeigen, dass bis zu 2500 Anforderungen / s verarbeitet werden können. Vergleichen Sie dies mit den Preisen kommerzieller Anbieter und Sie werden den Wert sehen. Die Antwortzeiten liegen je nach Abfrage und Cache zwischen 10 ms und 7 μs.

Wenn Sie dies lieber vor Ort ausführen möchten: Wir verwenden einen 6-Kern-Intel Xeon-Prozessor, 320 GB SSD und 16 GB Speicher.
Außerdem müssen Sie ~ 100 GB Daten herunterladen.
Aufgrund der Eigenschaften von S2-Zellen-IDs sollte das Skalieren und Sharding bei Bedarf einfach sein.
