# KI-Modelle verwenden #

Als Ergänzung zu den integrierten TensorFlow-Modellen kannst du mit PhotoPrism Bildunterschriften (captions) und Labels mithilfe von [Ollama](using-ollama.md) und der [OpenAI API](using-openai.md) generieren. Die Schritt-für-Schritt-Anleitungen erklären die Einrichtung und bieten getestete Beispielkonfigurationen, die du als Ausgangspunkt verwenden kannst.

[Mehr erfahren ›](using-ollama.md)

## Modell-Engines

PhotoPrism unterstützt derzeit die folgenden Laufzeiten und Dienste:

| Engine                                                                 | Auflösung | Ausführung        | Geeignet für                                                                                                      |                      
|------------------------------------------------------------------------|------------|-------------|---------------------------------------------------------------------------------------------------------------|
| [TensorFlow](https://docs.photoprism.app/developer-guide/vision/tensorflow/custom-models/) | 224 px     | Integriert    | Schnelle Offline-Standardmodelle für Kernfunktionen (Labels, Gesichter, NSFW)                                         | 
| [Ollama](using-ollama.md)                                              | 720 px     | Selbst gehostet | Gut für hochwertige Bildunterschriften & Labels; Server mit GPU empfohlen                               | 
| [OpenAI API](using-openai.md)                                          | 720 px     | Cloud       | Höchste Qualität bei Bildunterschriften & Labels, auch ohne GPU; API-Key und Internetzugang erforderlich | 

### Performance

- **TensorFlow:** Die integrierten Modelle liefern auf allen unterstützten Plattformen zuverlässige Ergebnisse und bilden die Grundlage für Kernfunktionen wie Labels und Gesichtserkennung.
- **Ollama:** [Das Generieren von Labels](ollama-models.md#gemma-3-labels) für ein Bild dauert auf einer NVIDIA RTX 4060 in der Regel 1–4 Sekunden – je nach verwendetem Modell und [Anzahl der Labels](ollama-models.md#qwen3-vl-labels).
- **OpenAI:** Die Verarbeitung eines Bildes dauert etwa 3 Sekunden, abhängig von Modell, Region und aktueller Auslastung.

!!! tldr ""
    Ohne GPU-Beschleunigung sind Ollama-Modelle deutlich langsamer und benötigen zwischen 10 Sekunden und über einer Minute pro Bild. Das kann in Ordnung sein, wenn du nur wenige Bilder verarbeiten möchtest oder Wartezeiten akzeptabel sind.

## `vision.yml` Referenz

Eigene KI-Engines, Modelle und Laufmodi konfigurierst du in einer Datei `vision.yml` im Verzeichnis `storage/config`. Darin wird festgelegt, welche Modelle und Schwellwerte verwendet werden sollen, zum Beispiel:

```yaml
Models:
- Type: caption
  Model: gemma3:latest
  Engine: ollama
  Run: auto
  Options:
    Temperature: 0.05
  Service:
    Uri: http://ollama:11434/api/generate
- Type: labels
  Model: qwen3-vl:latest
  Engine: ollama
  Service:
    Uri: http://ollama:11434/api/generate
Thresholds:
  Confidence: 10
  Topicality: 0
  NSFW: 75
```

Wenn kein Modelltyp angegeben ist, verwendet PhotoPrism die eingebauten Standardmodelle für `labels`, `nsfw`, `face` oder `caption`. Der optionale Block `Thresholds` kann verwendet werden, um Labels mit niedriger Wahrscheinlichkeit herauszufiltern oder die Schwelle für NSFW-Erkennung anzupassen.

| Feld                   | Standard                                | Anmerkungen                                                                              |
|-------------------------|----------------------------------------|------------------------------------------------------------------------------------|
| `Type` (required)       | —                                      | `labels`, `caption`, `face`, `nsfw`. Steuert Routing & Zeitplanung.                  |
| `Model`                 | `""`                                   | Überschreibt die Rohkennung; Vorrang: `Service.Model` → `Model` → `Name`.           |
| `Name`                  | derived from type/version              | Anzeigename; wird intern in Kleinbuchstaben umgewandelt.                                              |
| `Version`               | `latest` (non-OpenAI)                  | OpenAI-Payloads ignorieren Version.                                                      |
| `Engine`                | inferred from service/alias            | Aliase setzen Formate, Datei-Schema, Auflösung. Explizite `Service`-Werte haben Vorrang. |
| `Run`                   | `auto`                                 | Siehe Tabelle „Run Modes“ (Laufmodi) unten.                                                         |
| `Default`               | `false`                                | Einen pro Typ für TensorFlow-Fallbacks behalten.                                        |
| `Disabled`              | `false`                                | Registriert, aber inaktiv.                                                           |
| `Resolution`            | 224 (TensorFlow) / 720 (Ollama/OpenAI) | Thumbnail-Kante in px; TensorFlow-Modelle standardmäßig 224, sofern nicht überschrieben.        |
| `System` / `Prompt`     | engine defaults / empty                | Prompts pro Modell überschreiben.                                                        |
| `Format`                | `""`                                   | Antwort-Hinweis (`json`, `text`, `markdown`).                                        |
| `Schema` / `SchemaFile` | engine defaults / empty                | Inline- vs. Datei-JSON-Schema (Labels).                                               |
| `TensorFlow`            | engine defaults / empty                | Lokale TF-Modell-Infos (Pfade, Tags).                                                 |
| [`Options`](#options)   | engine defaults / empty                | Sampling/Einstellungen mit Engine-Standards zusammengeführt.                                     |
| [`Service`](#service)   | engine defaults / empty                | Konfiguration des Remote-Endpunkts (siehe unten).                                                |

### Run Modes

| Wert           | Ausführung                                                     | Empfohlene Nutzung                                |
|-----------------|------------------------------------------------------------------|------------------------------------------------|
| `auto`          | TensorFlow-Standard beim Indexieren; extern über Metadaten/Zeitplan | Für die meisten Setups so belassen.                   |
| `manual`        | Nur bei explizitem Aufruf (CLI/API)                           | Experimente und Diagnose.                   |
| `on-index`      | Während Indexierung + manuell                                         | Nur schnelle, integrierte Modelle.                     |
| `newly-indexed` | Metadata-Worker nach Indexierung + manuell                          | Extern/Ollama/OpenAI ohne den Import zu verlangsamen. |
| `on-demand`     | Manuell, Metadata-Worker und geplante Jobs                      | Breite Abdeckung ohne Index-Pfad.             |
| `on-schedule`   | Geplante Jobs + manuell                                          | Nächtliche/Cron-artige Ausführungen.                       |
| `always`        | Indexierung, Metadaten, geplant, manuell                            | Modelle mit hoher Priorität; Ressourcenverbrauch beachten.      |
| `never`         | Wird nie ausgeführt                                                   | Definition behalten, ohne sie auszuführen.            |

!!! tldr ""
    Aus Performance-Gründen wird `on-index` nur von den integrierten TensorFlow-Modellen unterstützt.

### Options

Über `Options` kannst du Modellparameter wie Temperatur oder Top‑P sowie weitere Einschränkungen für [Ollama](using-ollama.md) und [OpenAI](using-openai.md) festlegen:

| Option             | Engines          | Standard              | Beschreibung                                                                             |
|--------------------|------------------|----------------------|-----------------------------------------------------------------------------------------|
| `Temperature`      | Ollama, OpenAI   | engine default       | Steuert Zufälligkeit (Wert zwischen `0.01` und `2.0`); nicht genutzt bei OpenAI GPT-5. |
| `TopK`             | Ollama           | engine default       | Begrenzt Sampling auf die Top K Token, um seltene/ungewünschte Ausgaben zu reduzieren.                    |
| `TopP`             | Ollama, OpenAI   | engine default       | Nucleus Sampling; behält die kleinste Token-Menge, deren kumulative Wahrscheinlichkeit ≥ `p` ist.      |
| `MinP`             | Ollama           | engine default       | Verwirft Token, deren Wahrscheinlichkeitsmasse unter `p` liegt (schneidet Long Tail ab).               |
| `TypicalP`         | Ollama           | engine default       | Behält Token mit Typizität unter dem Schwellwert; kombinierbar mit TopP/MinP.      |
| `TfsZ`             | Ollama           | engine default       | Tail-Free-Sampling-Parameter; niedrigere Werte verringern Wiederholungen.                           |
| `Seed`             | Ollama           | random per run       | Fixiert für reproduzierbare Ausgaben; leer lassen für mehr Variabilität.                      |
| `NumKeep`          | Ollama           | engine default       | Anzahl der Token des Prompts, die vor dem Sampling behalten werden.                         |
| `RepeatLastN`      | Ollama           | engine default       | Anzahl der letzten Token, die für Wiederholungsstrafen berücksichtigt werden.                            |
| `RepeatPenalty`    | Ollama           | engine default       | Multiplikator >1 bestraft Wiederholung gleicher Token oder Phrasen.                         |
| `PresencePenalty`  | OpenAI           | engine default       | Erhöht Wahrscheinlichkeit für neue Token durch Bestrafung vorhandener.         |
| `FrequencyPenalty` | OpenAI           | engine default       | Bestraft Token proportional zu ihrer bisherigen Häufigkeit.                               |
| `PenalizeNewline`  | Ollama           | engine default       | Ob Wiederholungsstrafen auf Newline-Token angewendet werden.                                |
| `Stop`             | Ollama, OpenAI   | engine default       | Array von Stopp-Sequenzen (z. B. `["\\n\\n"]`).                                           |
| `Mirostat`         | Ollama           | engine default       | Aktiviert Mirostat Sampling (`0` aus, `1`/`2` Modi).                                       |
| `MirostatTau`      | Ollama           | engine default       | Steuert „Surprise“-Zielwert für Mirostat Sampling.                                         |
| `MirostatEta`      | Ollama           | engine default       | Lernrate für Mirostat-Anpassung.                                                  |
| `NumPredict`       | Ollama           | engine default       | Ollama-spezifische max. Ausgabe-Token; synonym zu `MaxOutputTokens`.            |
| `MaxOutputTokens`  | Ollama, OpenAI   | engine default       | Obergrenze für generierte Token; Adapter heben niedrige Werte auf Standards an.                 |
| `ForceJson`        | Ollama, OpenAI   | engine default       | Erzwingt strukturierte Ausgabe (wenn aktiviert).                                                  |
| `SchemaVersion`    | Ollama, OpenAI   | derived from schema  | Überschreiben, wenn Schema-Migrationen koordiniert werden.                                           |
| `CombineOutputs`   | OpenAI           | engine default       | Steuert, ob Modellergebnisse bei Mehrfach-Output automatisch kombiniert werden.                     |
| `Detail`           | OpenAI           | engine default       | Steuert Detailgrad für OpenAI Vision (`low`, `high`, `auto`).                            |
| `NumCtx`           | Ollama, OpenAI   | engine default       | Länge des Kontextfensters (Token).                                                         |
| `NumThread`        | Ollama           | runtime auto         | Begrenzt CPU-Threads für lokale Engines.                                                     |
| `NumBatch`         | Ollama           | engine default       | Batch-Größe für Prompt-Verarbeitung.                                                       |
| `NumGpu`           | Ollama           | engine default       | Anzahl der GPUs für die Arbeitsverteilung.                                               |
| `MainGpu`          | Ollama           | engine default       | Primärer GPU-Index bei mehreren GPUs.                                       |
| `LowVram`          | Ollama           | engine default       | Aktiviert VRAM-Sparmodus; kann Leistung verringern.                                        |
| `VocabOnly`        | Ollama           | engine default       | Lädt nur Vokabular (für schnelle Metadaten-Inspektion).                                     |
| `UseMmap`          | Ollama           | engine default       | Memory-Mapping für Modellgewichte statt vollständigem Laden.                                 |
| `UseMlock`         | Ollama           | engine default       | Modellgewichte im RAM sperren, um Paging zu reduzieren.                                             |
| `Numa`             | Ollama           | engine default       | Aktiviert NUMA-bewusste Speicherzuweisungen (falls verfügbar).                                           |

### Service

Unter `Service` konfigurierst du Endpunkt‑URL, HTTP-Methode, Format und Authentifizierung für [Ollama](using-ollama.md), [OpenAI](using-openai.md) und andere Engines, die per HTTP angesprochen werden:

| Feld                              | Standard        | Anmerkungen                                                                                          |
|------------------------------------|----------------|------------------------------------------------------------------------------------------------|
| `Uri`                              | engine default | Service-Endpunkt-URL. Leer für lokale Modelle.                                                  |
| `Method`                           | `POST`         | Nur überschreiben, wenn Anbieter es erfordert.                                                            |
| `Key`                              | `""`           | Bearer-Token; unterstützt Umgebungsvariablen (OpenAI: `OPENAI_API_KEY`, Ollama: `OLLAMA_API_KEY`[^1]). |
| `Username` / `Password`            | `""`           | Als Basic Auth verwendet, wenn `Uri` keine User-Infos enthält.                                              |
| `Model`                            | `""`           | Endpunkt-spezifischer Override; gewinnt vor Modell/Name.                                              |
| `Org` / `Project`                  | `""`           | Organisations- / Projekt-ID bei Verwendung von OpenAI.                                                   |
| `RequestFormat` / `ResponseFormat` | engine default | Explizite Werte haben Vorrang vor Engine-Standards.                                                      |
| `FileScheme`                       | engine default | Steuert Bildübertragung z.B. `data` oder `base64`.                                              |
| `Disabled`                         | `false`        | Deaktiviert den Endpunkt, ohne das Modell zu entfernen.                                              |

!!! tldr ""
    **Authentifizierung:** Alle Zugangsdaten und Kennungen unterstützen `${ENV_VAR}`‑Ersetzung. `Service.Key` setzt z.B. den HTTP‑Header `Authorization: Bearer <token>`, während `Username`/`Password` für Basic Auth verwendet werden, falls die `Uri` keine Zugangsdaten enthält. Wenn `Service.Key` leer ist, verwendet PhotoPrism standardmäßig `OPENAI_API_KEY` (OpenAI Engine) bzw. `OLLAMA_API_KEY`[^1] (Ollama Engine) und berücksichtigt auch die jeweiligen `_FILE`‑Varianten.

[^1]: Kann mit unserem [Preview Build](https://docs.photoprism.app/release-notes/#development-preview) und in der nächsten stabilen Version verwendet werden.


