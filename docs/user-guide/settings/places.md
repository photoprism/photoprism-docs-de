# PhotoPrism Places #

We've recently launched **PhotoPrism Places**, a Geocoding API that replaces OpenStreetMap development infrastructure. Our users now enjoy much better performance, higher availability and more privacy. In addition, we're going to add information about public events that have taken place at a location. This can be used to automatically create albums of popular music festivals or sports events.


## Privatsphäre ##

Geokodierungsanforderungen werden NICHT protokolliert, aber Entwickler können zwischengespeicherte Elemente in MariaDB natürlich ohne persönliche Informationen anzeigen. Das ist der Punkt eines Caches. Diese werden nach dem Zufallsprinzip mit Hotspots rund um Touristenattraktionen und Großstädte verteilt.


Aufgrund von HTTPS kann Ihr Internetprovider die genaue Anfrage nicht sehen, nur dass Sie einen Server kontaktiert haben.


Die API approximiert Koordinaten, codiert sie mit [S2] (https://s2geometry.io/resources/s2cell_statistics.html) und kümmert sich nicht um die Straßen- oder Hausnummer:

![](https://pbs.twimg.com/media/EN9AoYdWkAIqVDD?format=jpg&name=medium)

## Performance ##

Erste [Benchmarks] (https://github.com/tsliwowicz/go-wrk) zeigen, dass bis zu 2500 Anforderungen bearbeitet werden können. Vergleichen Sie dies mit den Preisen kommerzieller Anbieter und Sie werden den Wert sehen. Die Antwortzeiten liegen je nach Abfrage und Cache zwischen 10 ms und 7 μs.


Wenn Sie dies lieber vor Ort ausführen möchten: Wir verwenden einen 6-Kern-Intel Xeon-Prozessor, 320 GB SSD und 16 GB Speicher.
Außerdem müssen Sie ~ 100 GB Daten herunterladen.
Aufgrund der Eigenschaften von S2-Zellen-IDs sollte das Skalieren und Sharding bei Bedarf einfach sein.
