# OpenAI API verwenden #

Hier erfährst du, wie du PhotoPrism mit den GPT‑5‑Modellen von OpenAI verwendest, um hochwertige Bildunterschriften und Labels für deine Bilder zu erzeugen.

## Setup

### Voraussetzungen

- Um OpenAI‑Dienste nutzen zu können, benötigst du einen gültigen API‑Key, der über `OPENAI_API_KEY` oder `OPENAI_API_KEY_FILE` konfiguriert wird.
- PhotoPrism muss außerdem Netzwerkzugriff auf `api.openai.com` haben.

### Konfiguration

Füge deiner `vision.yml`‑Datei die folgenden Caption‑ und/oder Label‑Modelle hinzu:

```yaml
Models:
  - Type: caption
    Model: gpt-5-nano
    Engine: openai
    Run: auto
    Options:
      Detail: low           # optional: Standard ist low
      MaxOutputTokens: 512  # optional: Token-Limit ändern
    Service:
      Key: ${OPENAI_API_KEY}
  - Type: labels
    Model: gpt-5-mini
    Engine: openai
    Run: auto
    Options:
      MaxOutputTokens: 1024 # optional: Token-Limit ändern
    Service:
      Key: ${OPENAI_API_KEY}
```

Empfehlungen:

- Lass den Modellnamen (`Model` / `Name`) exakt so, wie er von OpenAI veröffentlicht wurde. Das Default Modell ist `gpt-5-mini`.
- `Service.Key` kann entfallen, wenn `OPENAI_API_KEY` bzw. `_FILE` bereits in der Umgebung gesetzt ist. Optional kannst du `Service.Org` und `Service.Project` setzen, falls dein Account diese Header erfordert.
- PhotoPrism wertet Modelle von unten nach oben aus. Wenn du die OpenAI‑Einträge ans Ende der Liste setzt, werden sie bevorzugt, während andere Modelle als Fallback dienen.

!!! tldr ""
    Standardmäßig verwendet PhotoPrism den OpenAI‑Responses‑Endpunkt `https://api.openai.com/v1/responses` mit einem einzelnen 720 px Thumbnail (`detail: low`). Der Endpunkt lässt sich über `Service.Url` auf einen eigenen Wert ändern.

## Nutzungs Tipps

### Run Modes

Um unerwartete Kosten zu vermeiden – insbesondere beim Testen neuer Modelle oder Prompts – setze `Run: manual` und [führe die Modelle manuell aus](cli.md#vision-modelle-ausfuhren), z.B. mit `photoprism vision run -m caption` oder `photoprism vision run -m labels`.
`Run: auto` führt das Modell automatisch aus, nachdem die Indexierung abgeschlossen ist, um den Import nicht auszubremsen. Gleichzeitig bleiben [manuelle](cli.md#vision-modelle-ausfuhren) und [geplante Ausführungen](https://docs.photoprism.app/getting-started/config-options/#computer-vision) möglich.

[Learn more ›](index.md#run-modes)

### Existierende Kategorien ersetzen
Um Kategorien, die vom eingebauten Klassifizierungsmodell erstellt wurden, zu entfernen, kann folgender Befehl in einem Terminal ausgeführt werden 

```
photoprism vision reset -m labels -s image
```

bevor neue Kategorien mit OpenAI erstellt werden

```
photoprism vision run -m labels
```

[Learn more ›](cli.md)

### Benutzerdefinierte Kategorien erstellen

Um die generierten Kategorien an deine Bedürfnisse anzupassen, können die Defaults für `System` oder `Prompt` in der [`vision.yml`](index.md#visionyml-reference) überschrieben werden:

- **System:** You are a PhotoPrism vision model. Emit JSON that matches the provided schema and keep label names short, singular nouns.
- **Prompt:** Analyze the image and return label objects with name, confidence (0-1), and topicality (0-1).

Halte die Prompts kurz und **behalte die Erinnerung an das JSON-Schema** für Kategorien. Für Bildunterschriften und Kategorien in anderen Sprachen solltest du die Basisanweisungen im Prompt auf Englisch belassen und nur die gewünschte Sprache ergänzen (z.B. „Respond in German“). Das funktioniert sowohl für Captions als auch für Label‑Prompts.

Beispiel:

```yaml
Models:
  - Type: labels
    Model: gpt-5-mini
    Engine: openai
    Run: auto
    Prompt: >
      Analyze the image and return up to 3 label objects with
      German singular name, confidence (0-1), and topicality (0-1).
```

### Caption Prompt anpassen

Wenn du längere Captions, andere Sprachen oder branchenspezifische Beschreibungen benötigst, kannst du die Defaults für `System` oder `Prompt` in der [`vision.yml`](index.md#visionyml-reference) überschreiben.

- **System:** You are a PhotoPrism vision model. Return concise, user-friendly captions that describe the main subjects accurately.
- **Prompt:** Provide exactly one sentence describing the key subject and action in the image. Avoid filler words and technical jargon.

Example:

```yaml
Models:
  - Type: caption
    Model: gpt-5-mini
    Engine: openai
    Run: auto
    Prompt: >
      Provide one or two German sentences describing the key subject and
      action in the image. Avoid filler words and technical jargon.
```
## Troubleshooting ##

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

