# KI Modelle verwenden #

Als Ergänzung zu den integrierten TensorFlow-Modellen kannst du mit PhotoPrism Bildunterschriften (captions) und Kategorien mithilfe von [Ollama](using-ollama.md) oder der [OpenAI API](using-openai.md) generieren. Unsere Schritt-für-Schritt-Anleitungen erklären die Einrichtung und enthalten getestete Beispielkonfigurationen, die du als Ausgangspunkt verwenden kannst.

[Mehr erfahren ›](using-ollama.md)

## Modell Engines

PhotoPrism unterstützt derzeit die folgende Dienste:

| Engine                                                                                     | Auflösung | Ausführung      | Geeignet für                                                                                                 |
|--------------------------------------------------------------------------------------------|-----------|-----------------|--------------------------------------------------------------------------------------------------------------|
| [TensorFlow](https://docs.photoprism.app/developer-guide/vision/tensorflow/custom-models/) | 224 px    | Integriert      | Schnelle Offline-Standardmodelle für Kernfunktionen (Kategorien, Gesichter, NSFW)                            |
| [Ollama](using-ollama.md)                                                                  | 720 px    | Selbst gehostet | Gut für hochwertige Bildunterschriften & Kategorien; Server mit GPU empfohlen                                |
| [OpenAI API](using-openai.md)                                                              | 720 px    | Cloud           | Höchste Qualität bei Bildunterschriften & Kategorien, auch ohne GPU; API-Key und Internetzugang erforderlich |

### Performance

- **TensorFlow:** Unsere integrierten Modelle liefern auf praktisch jeder Hardware gute Ergebnisse.
- **Ollama:** [Das Generieren von Kategorien](ollama-models.md#gemma-4-labels) für ein Bild dauert auf einer NVIDIA RTX 4060 in der Regel 1–4 Sekunden – je nach verwendetem Modell und [Anzahl der Kategorien](ollama-models.md#qwen3-vl-labels).
- **OpenAI:** Die Verarbeitung eines Bildes dauert etwa 3 Sekunden, abhängig von Modell, Region und aktueller Auslastung.

Zwei Dinge hinter diesen Zahlen solltest du kennen, bevor du auf Geschwindigkeit optimierst:

- **Was ein Bild an Prompt‑Tokens kostet, ist eine Eigenschaft des Modells, nicht des Thumbnails.** Dasselbe 720‑px‑Bild kostete in unserem Benchmark bei einem Modell 208 Prompt‑Tokens und bei einem anderen 1.182 — ein Unterschied um das Fünffache bei identischer Eingabe, verursacht vom Vision‑Encoder des Modells. Ein Modellwechsel kann die Zeit bis zum ersten Token daher stärker senken als eine niedrigere `Resolution`.
- **Zeiten gehosteter Modelle sind Näherungswerte.** Eine Wiederholung desselben Benchmarks wenige Stunden später verschob die Label‑Latenz eines Cloud‑Modells um mehr als das Sechsfache, während sich seine Ausgabe kaum änderte. Die Zeiten selbst gehosteter Modelle waren über dasselbe Laufpaar hinweg gut reproduzierbar. Wähle ein gehostetes Modell nach Ausgabequalität und miss die Latenz dann, wenn sie für dich zählt, statt einer veröffentlichten Zahl zu vertrauen.

!!! tldr ""
    Ohne GPU-Beschleunigung sind Ollama-Modelle deutlich langsamer und benötigen zwischen 10 Sekunden und über einer Minute pro Bild. Das kann in Ordnung sein, wenn du nur wenige Bilder verarbeiten möchtest oder Wartezeiten akzeptabel sind.

## `vision.yml` Referenz { #visionyml-reference }

KI-Engines, Modelle und Laufmodi können in einer `vision.yml`-Datei in deinem Konfigurationsverzeichnis konfiguriert werden (Standard: `storage/config`). Darin wird festgelegt, welche Modelle und Schwellenwerte verwendet werden sollen, zum Beispiel:

!!! info ""
    Wenn PhotoPrism deine Konfigurationsdatei nicht lesen kann, stelle sicher, dass sie unter dem für deine Instanz konfigurierten Konfigurationspfad existiert. Ältere Installationen verwenden möglicherweise `storage/settings`.

    Führe `docker compose exec photoprism photoprism show config | grep config-path` aus, um deinen konfigurierten Konfigurationspfad zu ermitteln.

```yaml
Models:
- Type: caption
  Model: gemma4:latest
  Engine: ollama
  Run: auto
  Options:
    Temperature: 0.05
  Service:
    Uri: http://ollama:11434/api/generate
    Think: "false"
- Type: labels
  Model: qwen3-vl:latest
  Engine: ollama
  Service:
    Uri: http://ollama:11434/api/generate
    Think: "false"
Thresholds:
  Confidence: 10
  Topicality: 0
  NSFW: 75
```

Wenn ein Modelltyp nicht definiert ist, verwendet PhotoPrism die eingebauten Standardmodelle für `labels`, `nsfw`, `face` oder `caption`. Der optionale Block `Thresholds` kann verwendet werden, um Kategorien mit niedriger Wahrscheinlichkeit herauszufiltern oder die Schwelle für NSFW-Erkennung anzupassen.

| Field                   | Default                                | Notes                                                                                     |
|-------------------------|----------------------------------------|-------------------------------------------------------------------------------------------|
| `Type` (required)       | —                                      | `labels`, `caption`, `face`, `nsfw`. Drives routing & scheduling.                         |
| `Model`                 | `""`                                   | Model identifier in the format `<name>:<version>`.                                        |
| `Name`                  | derived from `Model`                   | Model name.                                                                               |
| `Version`               | `latest` (non-OpenAI)                  | Model version, not used by OpenAI.                                                        |
| `Engine`                | inferred from service/alias            | Aliases set formats, file scheme, resolution. Explicit `Service` values still win.        |
| `Run`                   | `auto`                                 | See Run modes table below.                                                                |
| `Default`               | `false`                                | Keep one per type for TensorFlow fallbacks.                                               |
| `Disabled`              | `false`                                | Registered but inactive.                                                                  |
| `Resolution`            | 224 (TensorFlow) / 720 (Ollama/OpenAI) | Thumbnail edge in px; TensorFlow models default to 224 unless you override.               |
| `System` / `Prompt`     | engine defaults / empty                | Override prompts per model.                                                               |
| `Format`                | `""`                                   | Response hint (`json`, `text`, `markdown`).                                               |
| `Schema` / `SchemaFile` | engine defaults / empty                | Inline vs file JSON schema (labels).                                                      |
| `Normalize`[^2]         | engine default                         | Normalisierung der Label‑Namen; `single-word`, `phrase` oder `false`. Nur Labels‑Modelle. |
| `TensorFlow`            | engine defaults / empty                | Local TF model info (paths, tags).                                                        |
| [`Options`](#options)   | engine defaults / empty                | Sampling/settings merged with engine defaults.                                            |
| [`Service`](#service)   | engine defaults / empty                | Remote endpoint config (see below).                                                       |

### Run Modes

| Value           | When it runs                                                     | Recommended use                                |
|-----------------|------------------------------------------------------------------|------------------------------------------------|
| `auto`          | TensorFlow defaults during index; external via metadata/schedule | Leave as-is for most setups.                   |
| `manual`        | Only when explicitly invoked (CLI/API)                           | Experiments and diagnostics.                   |
| `on-index`      | During indexing + manual                                         | Fast built-in models only.                     |
| `newly-indexed` | Metadata worker after indexing + manual                          | External/Ollama/OpenAI without slowing import. |
| `on-demand`     | Manual, metadata worker, and scheduled jobs                      | Broad coverage without index path.             |
| `on-schedule`   | Scheduled jobs + manual                                          | Nightly/cron-style runs.                       |
| `always`        | Indexing, metadata, scheduled, manual                            | High-priority models; watch resource use.      |
| `never`         | Never executes                                                   | Keep definition without running it.            |

!!! tldr ""
    Aus Performance-Gründen wird `on-index` nur von den integrierten TensorFlow-Modellen unterstützt.

### Options

Über `Options` kannst du Modellparameter wie Temperatur oder Top‑P sowie weitere Einschränkungen für [Ollama](using-ollama.md) und [OpenAI](using-openai.md) festlegen:

| Option             | Engines        | Default             | Description                                                                             |
|--------------------|----------------|---------------------|-----------------------------------------------------------------------------------------|
| `Temperature`      | Ollama, OpenAI | engine default      | Controls randomness with a value between `0.01` and `2.0`; not used for OpenAI's GPT-5. |
| `TopK`             | Ollama         | engine default      | Limits sampling to the top K tokens to reduce rare or noisy outputs.                    |
| `TopP`             | Ollama, OpenAI | engine default      | Nucleus sampling; keeps the smallest token set whose cumulative probability ≥ `p`.      |
| `MinP`             | Ollama         | engine default      | Drops tokens whose probability mass is below `p`, trimming the long tail.               |
| `TypicalP`         | Ollama         | engine default      | Keeps tokens with typicality under the threshold; combine with TopP/MinP for flow.      |
| `TfsZ`             | Ollama         | engine default      | Tail free sampling parameter; lower values reduce repetition.                           |
| `Seed`             | Ollama         | random per run      | Fix for reproducible outputs; unset for more variety between runs.                      |
| `NumKeep`          | Ollama         | engine default      | How many tokens to keep from the prompt before sampling starts.                         |
| `RepeatLastN`      | Ollama         | engine default      | Number of recent tokens considered for repetition penalties.                            |
| `RepeatPenalty`    | Ollama         | engine default      | Multiplier >1 discourages repeating the same tokens or phrases.                         |
| `PresencePenalty`  | OpenAI         | engine default      | Increases the likelihood of introducing new tokens by penalizing existing ones.         |
| `FrequencyPenalty` | OpenAI         | engine default      | Penalizes tokens in proportion to their frequency so far.                               |
| `PenalizeNewline`  | Ollama         | engine default      | Whether to apply repetition penalties to newline tokens.                                |
| `Stop`             | Ollama, OpenAI | engine default      | Array of stop sequences (e.g., `["\\n\\n"]`).                                           |
| `Mirostat`         | Ollama         | engine default      | Enables Mirostat sampling (`0` off, `1/2` modes).                                       |
| `MirostatTau`      | Ollama         | engine default      | Controls surprise target for Mirostat sampling.                                         |
| `MirostatEta`      | Ollama         | engine default      | Learning rate for Mirostat adaptation.                                                  |
| `NumPredict`       | Ollama         | engine default      | Ollama-specific max output tokens; synonymous intent with `MaxOutputTokens`.            |
| `MaxOutputTokens`  | Ollama, OpenAI | engine default      | Upper bound on generated tokens; adapters raise low values to defaults.                 |
| `ForceJson`        | Ollama, OpenAI | engine default      | Forces structured output when enabled.                                                  |
| `SchemaVersion`    | Ollama, OpenAI | derived from schema | Override when coordinating schema migrations.                                           |
| `CombineOutputs`   | OpenAI         | engine default      | Controls whether multi-output models combine results automatically.                     |
| `Detail`           | OpenAI         | engine default      | Controls OpenAI vision detail level (`low`, `high`, `auto`).                            |
| `NumCtx`           | Ollama, OpenAI | engine default      | Context window length (tokens).                                                         |
| `NumThread`        | Ollama         | runtime auto        | Caps CPU threads for local engines.                                                     |
| `NumBatch`         | Ollama         | engine default      | Batch size for prompt processing.                                                       |
| `NumGpu`           | Ollama         | engine default      | Number of GPUs to distribute work across.                                               |
| `MainGpu`          | Ollama         | engine default      | Primary GPU index when multiple GPUs are present.                                       |
| `LowVram`          | Ollama         | engine default      | Enable VRAM-saving mode; may reduce performance.                                        |
| `VocabOnly`        | Ollama         | engine default      | Load vocabulary only for quick metadata inspection.                                     |
| `UseMmap`          | Ollama         | engine default      | Memory map model weights instead of fully loading them.                                 |
| `UseMlock`         | Ollama         | engine default      | Lock model weights in RAM to reduce paging.                                             |
| `Numa`             | Ollama         | engine default      | Enable NUMA-aware allocations when available.                                           |

### Service

Unter `Service` konfigurierst du Endpunkt‑URL, HTTP-Methode, Format und Authentifizierung für [Ollama](using-ollama.md), [OpenAI](using-openai.md) und andere Engines, die HTTP Anfragen machen:

| Field                              | Default                  | Notes                                                                                                                                                                                                                                                                                                             |
|------------------------------------|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `Uri`                              | engine default           | Service endpoint URL. Empty for local models.                                                                                                                                                                                                                                                                     |
| `Method`                           | `POST`                   | Override only if provider needs it.                                                                                                                                                                                                                                                                               |
| `Key`                              | `""`                     | Bearer token; supports env expansion (OpenAI: `OPENAI_API_KEY`, Ollama: `OLLAMA_API_KEY`[^1]).                                                                                                                                                                                                                    |
| `Username` / `Password`            | `""`                     | Injected as basic auth when `Uri` lacks userinfo.                                                                                                                                                                                                                                                                 |
| `Model`                            | `""`                     | Endpoint-specific override; wins over model/name.                                                                                                                                                                                                                                                                 |
| `Org` / `Project`                  | `""`                     | Organization / Project ID when using OpenAI.                                                                                                                                                                                                                                                                      |
| `Think`                            | `""` (Ollama: `"false"`) | Reasoning-Hint für Ollama. Die Ollama-Engine setzt ihn standardmäßig auf `"false"` (Reasoning aus), damit Thinking-Modelle (Qwen3.5, `qwen3-vl:*`, …) kein Reasoning in Captions/Kategorien ausgeben; mit `"true"` wieder aktivieren. Als String übergebene `"true"`/`"false"` werden als JSON-Booleans gesendet. |
| `Tier`                             | `""`                     | OpenAI Service Tier, gesendet als `service_tier` (z.B. `flex` für günstigere, langsamere Verarbeitung). Nur OpenAI; unterstützt `${ENV}`-Expansion.                                                                                                                                                               |
| `RequestFormat` / `ResponseFormat` | engine default           | Explicit values win over engine defaults.                                                                                                                                                                                                                                                                         |
| `FileScheme`                       | engine default           | Controls image transport e.g. `data` or `base64`.                                                                                                                                                                                                                                                                 |
| `Disabled`                         | `false`                  | Disables the endpoint without removing the model.                                                                                                                                                                                                                                                                 |

!!! tldr ""
    **Authentifizierung:** Alle Zugangsdaten und Kennungen unterstützen `${ENV_VAR}`‑Ersetzung. `Service.Key` setzt z.B. den HTTP‑Header `Authorization: Bearer <token>`, während `Username`/`Password` für Basic Auth verwendet werden, falls die `Uri` keine Zugangsdaten enthält. Wenn `Service.Key` leer ist, verwendet PhotoPrism standardmäßig `OPENAI_API_KEY` (OpenAI Engine) bzw. `OLLAMA_API_KEY`[^1] (Ollama Engine) und berücksichtigt auch die jeweiligen `_FILE`‑Varianten.

[^1]: Verfügbar seit dem [Release vom 5. März 2026](https://docs.photoprism.app/release-notes/#march-5-2026).
[^2]: Verfügbar in unseren [Preview-Builds](https://docs.photoprism.app/getting-started/updates/#development-preview) und dem kommenden stabilen Release.
