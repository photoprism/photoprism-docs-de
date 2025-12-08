# Computer‑Vision Befehle #

## Modellkonfiguration anzeigen

Mit dem folgenden Terminal‑Befehl kannst du die aktuell geladene Modellkonfiguration einsehen:

```bash
docker compose exec photoprism photoprism vision ls
```

### Befehlsoptionen

Du kannst den Befehl mit diesen Flags kombinieren, um das Ausgabeformat zu ändern:

| Befehls-Flag | Beschreibung                           |
|--------------|----------------------------------------|
| `--md, -m`   | als maschinenlesbares Markdown formatieren |
| `--csv, -c`  | als Semikolon-getrennte Werte exportieren |
| `--tsv, -t`  | als Tabulator-getrennte Werte exportieren |

## Vision-Modelle ausführen 

Sobald du deine bevorzugten Computer‑Vision‑Modelle und Dienste in der Datei `vision.yml` konfiguriert hast, kannst du sie mit folgendem Befehl auf eine per Suchfilter ausgewählte Bildmenge anwenden:

```bash
photoprism vision run [options] [filter]
```

### Befehlsoptionen

| Befehls-Flag                   | Beschreibung                                                                                                         |
|--------------------------------|----------------------------------------------------------------------------------------------------------------------|
| `--models MODELS`, `-m MODELS` | auszuführende Computer-Vision-MODELLE, z.B. caption, labels oder nsfw (Standard: "caption")                          |
| `--count value`, `-c value`    | maximale Anzahl der zu verarbeitenden Bilder (Standard: 100000)                                                      | 
| `--source TYPE`, `-s TYPE`     | benutzerdefinierter Datenquellen-TYP, z.B. estimate, image, meta oder manual (Standard: "image")                     |
| `--force`, `-f`                | Aktualisierung vorhandener Daten erzwingen, wenn die Quellpriorität gleich oder höher als die aktuelle ist (Standard: false) |

Um Captions für alle Fotos deiner Bibliothek zu generieren, kannst du zum Beispiel ausführen:

```bash
docker compose exec photoprism photoprism vision run --models=caption
```

Hinweis: Die Laufzeit hängt stark von der Größe deiner Bibliothek und der verfügbaren Hardware ab und kann bei großen Sammlungen entsprechend hoch sein.

Wenn du ein Label‑Modell in `vision.yml` konfiguriert hast, kannst du mit folgendem Befehl Labels erzeugen:

```bash
docker compose exec photoprism photoprism vision run --models=labels
```

Um Captions nur für Bilder zu erzeugen, die einem bestimmten Suchfilter entsprechen (z.B. einem Album), kannst du:

```bash
docker compose exec photoprism photoprism vision run --models=caption album:Holidays
```

Wenn du Captions für Bilder neu generieren möchtest, die bereits welche haben, ergänze das Flag `--force`:

```bash
docker compose exec photoprism photoprism vision run --models=caption --force
```

Das ist besonders hilfreich, wenn du unterschiedliche Modelle oder Prompts testen möchtest. Beachte, dass die konfigurierte Quelle eine gleich hohe oder höhere Priorität haben muss als die Quelle der vorhandenen Daten, damit sie überschrieben werden.

## Vision‑Daten zurücksetzen

Der Befehl `photoprism vision reset` setzt durch Computer‑Vision‑Modelle erzeugte Daten für alle Bilder zurück, die dem angegebenen Suchfilter entsprechen. Das ist nützlich, wenn du KI‑Daten entfernen und neu beginnen oder auf andere Modelle umsteigen möchtest.

```bash
photoprism vision reset [options] [filter]
```

### Befehlsoptionen

| Befehls-Flag                   | Beschreibung                                                                                      |
|--------------------------------|---------------------------------------------------------------------------------------------------|
| `--models MODELS`, `-m MODELS` | zurückzusetzende Computer-Vision-MODELLE, z.B. caption oder labels                                |
| `--count NUMBER`, `-n NUMBER`  | maximale ANZAHL der zu verarbeitenden Bilder (Standard: 100000)                                   |
| `--source TYPE`, `-s TYPE`     | benutzerdefinierter Datenquellen-TYP (auto, default, image, marker, ollama, openai, vision) (Standard: "image") |
| `--yes`, `-y`                  | führt den Befehl nicht-interaktiv aus (Standard: false)                                           |

!!! warning ""
    Du solltest immer das Flag `--source` setzen, um Daten einer bestimmten Quelle zurückzusetzen. Ohne dieses Flag werden ggf. keine Bilder zurückgesetzt. Verwende die Quelle, aus der deine Daten stammen (z.B. `ollama` oder `image`).

### Beispiele

Um von Ollama generierte Captions für alle Fotos deiner Bibliothek zurückzusetzen:

```bash
docker compose exec photoprism photoprism vision reset --models=caption --source=ollama --yes
```

Um Labels für Fotos in einem bestimmten Album zurückzusetzen:

```bash
docker compose exec photoprism photoprism vision reset --models=labels --source=ollama album:TestAlbum
```

!!! note ""
    Das Flag `--yes` führt den Befehl nicht‑interaktiv ohne Rückfrage aus. Lass es weg, wenn du vor dem Zurücksetzen eine Bestätigung möchtest.

## Befehle für die Gesichtserkennung

PhotoPrism stellt spezielle Befehle zum Verwalten von Gesichtserkennung, Clustering und Optimierung bereit. Diese sind besonders hilfreich, wenn du zwischen verschiedenen Erkennungs‑Engines wechselst oder Probleme mit der Gesichtserkennung analysieren möchtest.

### Gesichter indexieren

Erkennt Gesichter in deinen Fotos:

```bash
docker compose exec photoprism photoprism faces index [subfolder]
```

### Gesichts‑Daten prüfen

Prüft die Integrität von Face‑Embeddings und Cluster‑Statistiken:

```bash
docker compose exec photoprism photoprism faces audit
```

Um Normalisierungsprobleme automatisch zu korrigieren und Abstände zu aktualisieren:

```bash
docker compose exec photoprism photoprism faces audit --fix
```

Um eine bestimmte Person zu prüfen:

```bash
docker compose exec photoprism photoprism faces audit --subject=<person-uid>
```

Der Befehl liefert u.a. folgende Informationen:

- Anzahl der Wiederholungsversuche beim Mergen von Clustern
- Stichproben‑Statistiken
- Offene Cluster, die Aufmerksamkeit benötigen

### Gesichts‑Cluster optimieren

Führt den Optimierungs‑Algorithmus aus, um ähnliche Gesichts‑Cluster zusammenzuführen:

```bash
docker compose exec photoprism photoprism faces optimize
```

Wenn du problematische Cluster manuell bereinigt hast und das Mergen erneut versuchen möchtest:

```bash
docker compose exec photoprism photoprism faces optimize --retry
```

Dadurch werden Wiederholungszähler zurückgesetzt und der Optimierer kann Cluster erneut verarbeiten, die zuvor nicht zusammengeführt werden konnten.

### Gesichtserkennung zurücksetzen

Setzt alle Gesichts‑Daten zurück und beginnt von vorne:

```bash
docker compose exec photoprism photoprism faces reset
```

!!! danger ""
    Der Befehl `faces reset` löscht alle vorhandenen Gesichts‑Marker und Cluster. Stelle sicher, dass du bei Bedarf Backups hast – dieser Vorgang kann nicht rückgängig gemacht werden.

[Mehr über Gesichtserkennung ›](face-recognition.md)


