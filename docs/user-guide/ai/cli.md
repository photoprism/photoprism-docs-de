# Computer‑Vision Befehle #

## Modellkonfiguration anzeigen

Mit dem folgenden Terminal‑Befehl kannst du die aktuell geladene Modellkonfiguration einsehen:

```bash
docker compose exec photoprism photoprism vision ls
```

### Befehlsoptionen

Du kannst den Befehl mit diesen Flags kombinieren, um das Ausgabeformat zu ändern:

| Command Flag | Description                            |
|--------------|----------------------------------------|
| `--md, -m`   | format as machine-readable Markdown    |
| `--csv, -c`  | export as semicolon separated values   |
| `--tsv, -t`  | export as tab separated values         |

## Vision-Modelle ausführen

Sobald du deine bevorzugten Computer‑Vision‑Modelle und Dienste in der Datei `vision.yml` konfiguriert hast, kannst du sie mit folgendem Befehl auf eine per Suchfilter ausgewählte Bildmenge anwenden:

```bash
photoprism vision run [options] [filter]
```

### Befehlsoptionen

| Command Flag                  | Description                                                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| `--models MODELS`, `-m MODELS`| computer vision MODELS to run, e.g. caption, labels, or nsfw (default: "caption")                                               |
| `--count NUMBER`, `-n NUMBER` | maximum NUMBER of pictures to be processed (default: 100000)                                                                    |
| `--source TYPE`, `-s TYPE`    | custom data source TYPE (auto, default, image, marker, ollama, openai, vision) (default: "image")                              |
| `--force`, `-f`               | force existing data to be updated if the model supports it and the source priority is equal to or higher (default: false)      |

Um Captions für alle Fotos deiner Bibliothek zu generieren, kannst du folgenden Befehl ausführen:

```bash
docker compose exec photoprism photoprism vision run --models=caption
```

Hinweis: Die Laufzeit hängt stark von der Größe deiner Bibliothek und der verfügbaren Hardware ab und kann bei großen Sammlungen entsprechend hoch sein.

Wenn du ein Label‑Modell in deiner `vision.yml` konfiguriert hast, kannst du mit folgendem Befehl Labels erzeugen:

```bash
docker compose exec photoprism photoprism vision run --models=labels
```

Um Captions nur für Bilder zu erzeugen, die einem bestimmten Suchfilter entsprechen (z.B. einem Album), kannst du folgenden Befehl verwenden:

```bash
docker compose exec photoprism photoprism vision run --models=caption album:Holidays
```

Wenn du Captions für Bilder neu generieren möchtest, die bereits Captions haben, ergänze das Flag `--force`:

```bash
docker compose exec photoprism photoprism vision run --models=caption --force
```

Das ist besonders hilfreich, wenn du unterschiedliche Modelle oder Prompts testen möchtest. Beachte, dass die konfigurierte Source eine gleich hohe oder höhere Priorität haben muss als die Source der vorhandenen Daten, damit sie überschrieben werden.

## Vision‑Daten zurücksetzen

Der Befehl `photoprism vision reset` setzt durch Computer‑Vision‑Modelle erzeugte Daten für alle Bilder zurück, die dem angegebenen Suchfilter entsprechen. Das ist nützlich, wenn du KI‑Daten entfernen und neu beginnen oder auf andere Modelle umsteigen möchtest.

```bash
photoprism vision reset [options] [filter]
```

### Befehlsoptionen

| Command Flag                   | Description                                                                                       |
|--------------------------------|---------------------------------------------------------------------------------------------------|
| `--models MODELS`, `-m MODELS` | computer vision MODELS to reset, e.g. caption or labels                                           |
| `--count NUMBER`, `-n NUMBER`  | maximum NUMBER of pictures to be processed (default: 100000)                                      |
| `--source TYPE`, `-s TYPE`     | custom data source TYPE (auto, default, image, marker, ollama, openai, vision) (default: "image") |
| `--yes`, `-y`                  | runs the command non-interactively (default: false)                                               |

!!! warning ""
    Du solltest immer das Flag `--source` setzen, um Daten einer bestimmten Source zurückzusetzen. Ohne dieses Flag werden ggf. keine Bilder zurückgesetzt. Verwende die Source, aus der deine Daten stammen (z.B. `ollama` oder `image`).

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

!!! info "Über das Web-UI manuell gelöschte Bildunterschriften neu generieren"
    Bildunterschriften, die über den Bearbeitungs- oder Batch-Bearbeitungsdialog gelöscht wurden, haben Source `manual` oder `batch`. Der `photoprism vision reset` Befehl setzt diese nicht zurück.

    Um Bildunterschriften für diese Fotos dennoch neu zu erzeugen, führe das Caption‑Modell mit source `vision ` aus:

    ```bash
    docker compose exec photoprism photoprism vision run --models=caption --source=vision
    ```

    Die Source `vision` hat eine hohe Priorität (64) und kann leere Bildunterschriften mit Source `manual` und `batch` überschreiben.
    Eine Übersicht aller verfügbaren Sources und ihrer Prioritäten erhältst du mit:

    ```bash
    docker compose exec photoprism photoprism vision sources show
    ```

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
