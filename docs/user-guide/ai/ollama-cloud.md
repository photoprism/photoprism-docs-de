# Ollama Cloud einrichten

Hier erfährst du, wie du PhotoPrism mit [Ollama Cloud](https://ollama.com/blog/ollama-cloud) verbindest, um detaillierte Bildunterschriften und präzise Kategorien zu erzeugen – ohne eine lokale Ollama Instanz betreiben zu müssen.

## Schritt 1: API‑Key erstellen

Um Ollama Cloud nutzen zu können, benötigst du ein Konto bei [ollama.com](https://ollama.com) und einen gültigen API‑Key, den du unter <https://ollama.com/settings/keys> erstellen kannst.

## Schritt 2: Umgebung konfigurieren

Füge die Umgebungsvariablen `OLLAMA_BASE_URL` und `OLLAMA_API_KEY` zum `photoprism`‑Dienst in deiner `compose.yaml` (oder `docker-compose.yml`) Datei hinzu, wie im folgenden Beispiel gezeigt.[^1]

!!! example "compose.yaml"
    ```yaml
    services:
      photoprism:
        image: photoprism/photoprism:latest
        environment:
          OLLAMA_BASE_URL: "https://ollama.com"
          OLLAMA_API_KEY: "your-api-key"
          ...
    ```

Mit diesen Variablen verwendet PhotoPrism automatisch den Ollama Cloud Endpunkt für alle Ollama‑basierten Modelle, die in deiner [`vision.yml`](index.md#visionyml-reference) konfiguriert sind. Du musst weder `Service.Uri` noch `Service.Key` in der Modellkonfiguration angeben – beides wird aus den Umgebungsvariablen übernommen.

!!! info ""
    Wenn `OLLAMA_BASE_URL` auf `https://ollama.com` gesetzt ist, wechselt PhotoPrism automatisch zu den Cloud‑Standardeinstellungen. Ein API‑Key allein erzwingt keine Cloud‑Nutzung. Da der aktuell veröffentlichte Ollama Cloud Modellname `qwen3-vl:235b-instruct-cloud` lautet, empfehlen wir, ihn explizit in `vision.yml` festzulegen.

## Schritt 3: Modelle konfigurieren

Erstelle eine neue Datei `vision.yml` in deinem Konfigurationspfad (Standard: `storage/config`) oder bearbeite die vorhandene Datei im [*storage/config*‑Verzeichnis](https://docs.photoprism.app/getting-started/docker-compose/#photoprismstorage) deiner PhotoPrism‑Instanz, wie im folgenden Beispiel.

Da die Service‑URI aus `OLLAMA_BASE_URL` übernommen wird, kannst du den `Service`‑Block weglassen:

!!! example "vision.yml"
    ```yaml
    Models:
    - Type: labels
      Model: qwen3-vl:235b-instruct-cloud
      Engine: ollama
      Run: auto
      Service:
        Think: "false"
    - Type: caption
      Model: qwen3-vl:235b-instruct-cloud
      Engine: ollama
      Run: auto
      Service:
        Think: "false"
    ```

Stelle sicher, dass die konfigurierten Modelle [auf Ollama Cloud verfügbar](https://ollama.com/search?c=cloud) sind. Du kannst die [Liste der unterstützten Cloud‑Modelle](https://ollama.com/search?c=cloud) durchsuchen, um zu sehen, welche verwendet werden können. Ein manuelles Herunterladen ist nicht nötig – Cloud‑Modelle werden remote bereitgestellt.

Die optionale Einstellung `Service.Think: "false"` deaktiviert die Reasoning‑Ausgabe bei Modellen, die dies unterstützen. Das ist für Captions und Kategorien oft sinnvoll, da es die Latenz reduziert und verhindert, dass Output‑Tokens für internes Reasoning statt für das eigentliche Ergebnis verbraucht werden.

Zum Zeitpunkt dieser Dokumentation verwendet PhotoPrism intern immer noch `qwen3-vl:235b-instruct` als Ollama Cloud Standardmodell. Durch das explizite Festlegen von `Model: qwen3-vl:235b-instruct-cloud` werden Unklarheiten vermieden, bis dieser Standardwert im Code aktualisiert wird.

[Mehr erfahren ›](ollama-models.md)

### Scheduling Optionen

- `Run: auto` (empfohlen) führt das Modell automatisch aus, nachdem die Indexierung abgeschlossen ist, damit der Import bzw. die Indexierung nicht ausgebremst wird. Gleichzeitig bleiben [manuelle Aufrufe](cli.md#vision-modelle-ausfuhren) und [zeitgesteuerte Ausführungen](https://docs.photoprism.app/getting-started/config-options/#computer-vision) möglich.
- `Run: manual` deaktiviert die automatische Ausführung, sodass du das Modell [nur manuell](cli.md#vision-modelle-ausfuhren) über `photoprism vision run -m caption` oder `photoprism vision run -m labels` startest.

[Mehr erfahren ›](index.md#run-modes)

### Konfigurations Tipps

PhotoPrism wertet Modelle von unten nach oben in der Liste aus. Wenn du die Ollama Einträge unterhalb anderer Modelle platzierst, werden Ollama‑Modelle bevorzugt, während andere als Fallback erhalten bleiben.

Von Ollama generierte Captions und Labels werden automatisch mit der Source `ollama` gespeichert. Du musst daher keinen speziellen `source`‑Wert angeben, außer du möchtest die Quelle explizit überschreiben.

!!! tip "Prompt‑Lokalisierung"
    Wenn du Ausgaben in anderen Sprachen erzeugen möchtest, lasse die Basisanweisungen im Prompt auf Englisch und ergänze nur die gewünschte Sprache (z.B. „Respond in German"). Dieses Vorgehen funktioniert sowohl für [Caption‑Prompts](ollama-models.md#qwen3-vl-caption) als auch für [Label‑Prompts](ollama-models.md#qwen3-vl-labels).

## Schritt 4: PhotoPrism neu starten

Führe die folgenden Befehle aus, um `photoprism` neu zu starten und die neuen Einstellungen zu übernehmen:

```bash
docker compose stop photoprism
docker compose up -d
```

Anschließend kannst du die `photoprism vision` [CLI‑Befehle](./cli.md#vision-modelle-ausfuhren) [im Terminal](https://docs.photoprism.app/getting-started/docker-compose/#opening-a-terminal) verwenden, z.B. `photoprism vision run -m caption` zum Erzeugen von Captions oder `photoprism vision run -m labels` zum Erzeugen von Kategorien.

[Mehr erfahren ›](cli.md#vision-modelle-ausfuhren)

## Troubleshooting

### Konfiguration überprüfen

Wenn Probleme auftreten, prüfe zuerst, wie PhotoPrism deine [`vision.yml`](index.md#visionyml-reference)‑Konfiguration geladen hat. Das geht mit folgendem Befehl:

```bash
docker compose exec photoprism photoprism vision ls
```

Der Befehl gibt die Einstellungen aller unterstützten und konfigurierten Modelltypen aus. Vergleiche das Ergebnis mit deiner [`vision.yml`](index.md#visionyml-reference)‑Datei, um zu bestätigen, dass die Konfiguration korrekt geladen wurde, und um Parsing‑Fehler oder Fehlkonfigurationen zu erkennen.

### Test Runs durchführen

Die folgenden [Terminal‑Befehle](https://docs.photoprism.app/getting-started/docker-compose/#opening-a-terminal) führen jeweils einen einzelnen Lauf für den angegebenen Modelltyp aus:

```bash
photoprism vision run -m labels --count 1 --force
photoprism vision run -m caption --count 1 --force
```

Wenn du nicht die erwarteten Ergebnisse erhältst oder Fehler bemerkst, kannst du die Befehle erneut mit aktiviertem Trace‑Log‑Modus ausführen, um Anfrage und Antwort zu untersuchen:

```bash
photoprism --log-level=trace vision run -m labels --count 1 --force
photoprism --log-level=trace vision run -m caption --count 1 --force
```

[^1]: Nicht relevante Konfigurationsdetails wurden zur besseren Lesbarkeit ausgelassen.
