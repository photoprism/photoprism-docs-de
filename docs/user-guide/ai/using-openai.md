# OpenAI API verwenden #

Hier erfährst du, wie du PhotoPrism mit den GPT‑5‑Modellen von OpenAI verwendest, um hochwertige Bildunterschriften und Labels für deine Bilder zu erzeugen.

## Setup

### Voraussetzungen

- Um OpenAI‑Dienste nutzen zu können, benötigst du einen gültigen API‑Schlüssel, der über `OPENAI_API_KEY` oder `OPENAI_API_KEY_FILE` konfiguriert wird.
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
      Detail: low           # optional: default is low
      MaxOutputTokens: 512  # optional: change token limit
    Service:
      Key: ${OPENAI_API_KEY}
  - Type: labels
    Model: gpt-5-mini
    Engine: openai
    Run: auto
    Options:
      MaxOutputTokens: 1024 # optional: change token limit
    Service:
      Key: ${OPENAI_API_KEY}
```

Empfehlungen:

- Lass den Modellnamen (`Model` / `Name`) exakt so, wie er von OpenAI veröffentlicht wurde, damit die Standardwerte korrekt angewendet werden.
- `Service.Key` kann entfallen, wenn `OPENAI_API_KEY` bzw. `_FILE` bereits in der Umgebung gesetzt ist.
- Optional kannst du `Service.Org` und `Service.Project` setzen, falls dein Account diese Header erfordert.

!!! tldr ""
    Standardmäßig verwendet PhotoPrism den OpenAI‑Responses‑Endpunkt `https://api.openai.com/v1/responses` mit einem einzelnen 720 px Thumbnail (`detail: low`).

## Nutzungstipps

- Um unerwartete Kosten zu vermeiden – insbesondere beim Testen neuer Modelle oder Prompts – setze `Run: manual` und [führe die Modelle manuell aus](cli.md#vision-modelle-ausfuhren), z.B. mit `photoprism vision run -m caption` oder `photoprism vision run -m labels`.
- `Run: auto` führt das Modell automatisch aus, nachdem die Indexierung abgeschlossen ist, um den Import nicht auszubremsen. Gleichzeitig bleiben [manuelle](cli.md#vision-modelle-ausfuhren) und [geplante Ausführungen](https://docs.photoprism.app/getting-started/config-options/#computer-vision) möglich.
- PhotoPrism wertet Modelle von unten nach oben aus. Wenn du die OpenAI‑Einträge ans Ende der Liste setzt, werden sie bevorzugt, während andere Modelle als Fallback dienen.
- Falls du domänenspezifische Formulierungen benötigst, kannst du `System` oder `Prompt` in `vision.yml` überschreiben – halte die Texte möglichst kurz und behalte den Schema‑Hinweis für Labels bei.
- Für andere Sprachen solltest du die Basisanweisungen im Prompt auf Englisch belassen und nur die gewünschte Sprache ergänzen (z.B. „Respond in German“). Das funktioniert sowohl für Captions als auch für Label‑Prompts.

## Troubleshooting ##

### Konfiguration überprüfen

Wenn es Probleme gibt, solltest du zuerst prüfen, wie PhotoPrism deine `vision.yml` geladen hat. Das geht mit:

```bash
docker compose exec photoprism photoprism vision ls
```

Der Befehl gibt die Einstellungen aller unterstützten und konfigurierten Modelltypen aus. Vergleiche das Ergebnis mit deiner `vision.yml`, um zu prüfen, ob die Konfiguration korrekt übernommen wurde und ob Parse‑Fehler oder Tippfehler vorliegen.

### Testruns durchführen 

Die folgenden [Terminal‑Befehle](https://docs.photoprism.app/getting-started/docker-compose/#opening-a-terminal) führen jeweils einen einzelnen Lauf für den angegebenen Modelltyp aus:

```bash
photoprism vision run -m labels --count 1 --force
photoprism vision run -m caption --count 1 --force
```

Wenn keine Ausgabe erzeugt wird, aktiviere testweise ausführliches Logging (`PHOTOPRISM_LOG_LEVEL=trace`) und wiederhole den Aufruf, um Anfrage und Antwort zu prüfen.


