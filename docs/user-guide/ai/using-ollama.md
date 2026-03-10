# Ollama einrichten #

In diesem Abschnitt erfährst du, wie du eine selbst gehostete Ollama Instanz einrichtest und mit PhotoPrism verbindest, um mit [vision‑fähigen LLMs](https://ollama.com/search?c=vision) detaillierte Bildunterschriften und präzise Kategorien zu erzeugen.

## Schritt 1: Ollama installieren

Um Ollama auf demselben Server wie PhotoPrism zu installieren, füge den Dienst `ollama` im Abschnitt `services` deiner `compose.yaml` (oder `docker-compose.yml`) Datei hinzu, wie im folgenden Beispiel gezeigt.[^1]

Alternativ ist Ollama in den meisten [`compose.yaml`](https://docs.photoprism.app/getting-started/docker-compose/) [Konfigurations Beispielen](https://dl.photoprism.app/docker/compose.yaml) auf unserem Download‑Server bereits vorkonfiguriert. In diesem Fall kannst du Ollama mit folgendem Befehl starten:

```bash
docker compose --profile ollama up -d
```

Wenn Ollama standardmäßeig ohne `--profile ollama` gestartet werden soll, entferne `profiles: ["ollama"]`.

!!! example "compose.yaml"
    ```yaml
    services:
      photoprism:
        ## The ":preview" build gives early access to new features:
        image: photoprism/photoprism:preview
        ...

      ## Ollama Large-Language Model Runner (optional)
      ## Run "ollama pull [name]:[version]" to download a vision model
      ## listed at <https://ollama.com/search?c=vision>, for example:
      ## docker compose exec ollama ollama pull gemma3:latest
      ollama:
        image: ollama/ollama:latest
        restart: unless-stopped
        stop_grace_period: 15s
        ## Insecurely exposes the Ollama service on port 11434
        ## without authentication (for private networks only):
        # ports:
        #  - "11434:11434"
        environment:
          ## Ollama Configuration Options:
          OLLAMA_HOST: "0.0.0.0:11434"
          OLLAMA_MODELS: "/root/.ollama"  # model storage path (see volumes section below)
          OLLAMA_MAX_QUEUE: "100"         # maximum number of queued requests
          OLLAMA_NUM_PARALLEL: "1"        # maximum number of parallel requests
          OLLAMA_MAX_LOADED_MODELS: "1"   # maximum number of loaded models per GPU
          OLLAMA_LOAD_TIMEOUT: "5m"       # maximum time for loading models (default "5m")
          OLLAMA_KEEP_ALIVE: "5m"         # duration that models stay in memory (default "5m")
          OLLAMA_CONTEXT_LENGTH: "4096"   # maximum input context length
          OLLAMA_MULTIUSER_CACHE: "false" # optimize prompt caching for multi-user scenarios
          OLLAMA_NOPRUNE: "false"         # disables pruning of model blobs at startup
          OLLAMA_NOHISTORY: "true"        # disables readline history
          OLLAMA_FLASH_ATTENTION: "false" # enables the experimental flash attention feature
          OLLAMA_KV_CACHE_TYPE: "f16"     # cache quantization (f16, q8_0, or q4_0)
          OLLAMA_SCHED_SPREAD: "false"    # allows scheduling models across all GPUs.
          OLLAMA_NEW_ENGINE: "true"       # enables the new Ollama engine
          # OLLAMA_DEBUG: "true"            # shows additional debug information
          # OLLAMA_INTEL_GPU: "true"        # enables experimental Intel GPU detection
          ## NVIDIA GPU Hardware Acceleration (optional):
          # NVIDIA_VISIBLE_DEVICES: "all"
          # NVIDIA_DRIVER_CAPABILITIES: "compute,utility"
        volumes:
          - "./ollama:/root/.ollama"
        ## NVIDIA GPU Hardware Acceleration (optional):
        # deploy:
        #  resources:
        #    reservations:
        #      devices:
        #        - driver: "nvidia"
        #          capabilities: [ gpu ]
        #          count: "all"
    ```

Beachte, dass das [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) installiert sein muss, damit GPU‑Beschleunigung funktioniert. Erfahrene Nutzer können Ollama auch auf einem separaten, leistungsstärkeren Server betreiben.

!!! danger ""
    Ollama erzwingt standardmäßig **keine Authentifizierung**. Öffne Port `11434` daher nur in vertrauenswürdigen Netzwerken oder betreibe Ollama hinter einem Reverse Proxy, der Zugriffskontrolle hinzufügt.

## Schritt 2: Modelle herunterladen

Sobald der Ollama Dienst läuft (siehe [Schritt 1](#schritt-1-ollama-installieren)), kannst du [beliebige Vision‑Modelle](https://ollama.com/search?c=vision) herunterladen, die zu deiner Hardware und deinen Anforderungen passen. Zum Beispiel:

```bash
docker compose exec ollama ollama pull gemma3:latest
```

[Mehr erfahren ›](ollama-models.md)

## Schritt 3: Modelle konfigurieren

Erstelle nun eine neue Datei `config/vision.yml` oder bearbeite die vorhandene Datei im *storage*‑Verzeichnis deiner PhotoPrism‑Instanz, wie im folgenden Beispiel. Aus Sicht des Containers befindet sich die Datei unter `/photoprism/storage/config/vision.yml`:

!!! example "vision.yml"
    ```yaml
    Models:
    - Type: caption
      Model: gemma3:latest
      Engine: ollama
      Run: auto
      Service:
        Uri: http://ollama:11434/api/generate
    - Type: labels
      Model: gemma3:latest
      Engine: ollama
      Run: auto
      Service:
        Uri: http://ollama:11434/api/generate
    ```

[Mehr erfahren ›](ollama-models.md#gemma-3-labels)

### Scheduling Optionen

- `Run: auto` (empfohlen) führt das Modell automatisch aus, nachdem die Indexierung abgeschlossen ist, damit der Import bzw die Indexierung nicht ausgebremst wird. Gleichzeitig bleiben [manuelle Aufrufe](cli.md#vision-modelle-ausfuhren) und [zeitgesteuerte Ausführungen](https://docs.photoprism.app/getting-started/config-options/#computer-vision) möglich.
- `Run: manual` deaktiviert die automatische Ausführung, sodass du das Modell [nur manuell](cli.md#vision-modelle-ausfuhren) über `photoprism vision run -m caption` oder `photoprism vision run -m labels` startest.

[Mehr erfahren ›](index.md#run-modes)

### Konfigurations Tipps

PhotoPrism wertet Modelle von unten nach oben in der Liste aus. Wenn du die Ollama Einträge unterhalb anderer Modelle platzierst, werden Ollama‑Modelle bevorzugt, während andere als Fallback erhalten bleiben.

Von Ollama generierte Captions und Labels werden automatisch mit der Source `ollama` gespeichert. Du musst daher keinen speziellen `source`‑Wert angeben, außer du möchtest die Quelle explizit überschreiben.

!!! tip "Prompt‑Lokalisierung"
    Wenn du Ausgaben in anderen Sprachen erzeugen möchtest, lasse die Basisanweisungen im Prompt auf Englisch und ergänze nur die gewünschte Sprache (z.B. „Respond in German“). Dieses Vorgehen funktioniert sowohl für [Caption‑Prompts](ollama-models.md#qwen3-vl-caption) als auch für [Label‑Prompts](ollama-models.md#qwen3-vl-labels).

## Schritt 4: PhotoPrism neu starten

Führe die folgenden Befehle aus, um `photoprism` neu zu starten und die neuen Einstellungen zu übernehmen:

```bash
docker compose stop photoprism
docker compose up -d
```

Anschließend kannst du die `photoprism vision` [CLI‑Befehle](./cli.md#vision-modelle-ausfuhren) [im Terminal](https://docs.photoprism.app/getting-started/docker-compose/#opening-a-terminal) verwenden, z.B. `photoprism vision run -m caption` zum Erzeugen von Captions oder `photoprism vision run -m labels` zum Erzeugen von Kategorien.

[Mehr erfahren ›](cli.md#vision-modelle-ausfuhren)

## Troubleshooting ##

### Konfiguration überprüfen

Wenn es Probleme gibt, solltest du zuerst prüfen, ob die `vision.yml` richtig geladen wurde.

```bash
docker compose exec photoprism photoprism vision ls
```

Der Befehl gibt die Einstellungen aller unterstützten und konfigurierten Modelltypen aus. Vergleiche das Ergebnis mit deiner `vision.yml`, um zu prüfen, ob die Konfiguration korrekt übernommen wurde oder Konfigurationsfehler vorliegen.

### Test Runs durchführen

Die folgenden [Terminal‑Befehle](https://docs.photoprism.app/getting-started/docker-compose/#opening-a-terminal) führen jeweils einen einzelnen Lauf für den angegebenen Modelltyp aus:

```bash
photoprism vision run -m labels --count 1 --force
photoprism vision run -m caption --count 1 --force
```

Wenn keine Ausgabe erzeugt wird, wiederhole den Aufruf mit einem höhreren Log Level.

```bash
photoprism --log-level=trace vision run -m labels --count 1 --force
photoprism --log-level=trace vision run -m caption --count 1 --force
```

### Unvollständige Captions bei Thinking‑Modellen

Wenn du ein Reasoning‑ oder „Thinking"‑Modell verwendest und unvollständige oder abgeschnittene Captions erhältst, verbraucht das Modell möglicherweise den Großteil seines Output‑Token‑Budgets für internes Reasoning – sodass zu wenige Tokens für die eigentliche Caption übrig bleiben.

Um das zu beheben, wechsle entweder zu einem Modell ohne Thinking oder erhöhe den Wert von `NumPredict` in den [`vision.yml`](index.md#visionyml-reference) [Optionen](index.md#options), um dem Modell mehr Spielraum zu geben:

```yaml
Options:
  NumPredict: 4096
```

### GPU Performance Probleme

Bei der Verwendung von Ollama mit GPU‑Beschleunigung kann es mit der Zeit zu Leistungseinbrüchen durch Probleme im VRAM‑Management kommen. Typische Anzeichen sind langsamere Verarbeitung und der Eindruck, dass der Dienst „abstürzt“, obwohl er noch Anfragen beantwortet – dann allerdings ohne GPU‑Nutzung.

Die Ursache ist, dass die VRAM‑Belegung nach vielen Anfragen nicht sauber aufgeräumt wird und es zu Fragmentierung sowie fehlgeschlagenen GPU‑Aufrufen kommt.

Der Ollama‑Dienst erholt sich von diesen VRAM‑Problemen nicht automatisch. Um die GPU‑Beschleunigung wiederherzustellen, starte den Container manuell neu:

```bash
docker compose down ollama
docker compose up -d ollama
```

Dadurch wird der VRAM geleert und die normale GPU‑beschleunigte Verarbeitung wiederhergestellt.

[^1]: Nicht relevante Konfigurationsdetails wurden zur besseren Lesbarkeit ausgelassen.


