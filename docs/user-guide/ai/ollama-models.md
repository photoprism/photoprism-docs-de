# Ollama Modelle #

Wir empfehlen, ein [Vision Modell](https://ollama.com/search?c=vision) zu wählen, das Geschwindigkeit, Genauigkeit und Zuverlässigkeit gut ausbalanciert. Zwei Modelle, die diese Kriterien erfüllen und die wir besonders empfehlen können, sind [Gemma 3](https://ollama.com/library/gemma3) und [Qwen3‑VL](https://ollama.com/library/qwen3-vl):

| Modell       | Anwendungsfall                                             | Anmerkungen                                                          |
|--------------|------------------------------------------------------------|----------------------------------------------------------------------|
| **Gemma 3**  | Standard-Generierung von Bildunterschriften und Labels     | Leichte, zuverlässige JSON-Ausgabe; guter Standard.                  |
| **Qwen3-VL** | Fortgeschrittene Bilderkennung und Reasoning (OCR, komplexe Prompts) | Bessere visuelle Verankerung (Grounding) und Multi-Language-Support; benötigt mehr VRAM. |

[**Gemma 3**](https://ollama.com/library/gemma3) ist in Bezug auf Performance sehr konsistent; Fehler treten nur selten auf. Für sehr lange oder komplexe Prompts und Captions ist es jedoch weniger geeignet. Für die meisten [Anwendungsfälle](#gemma-3-labels) empfehlen wir die Standard‑Variante `gemma3:latest`.

[**Qwen3‑VL**](https://ollama.com/library/qwen3-vl) verhält sich in den kleineren `2b`‑ und `4b`‑[Varianten](https://ollama.com/library/qwen3-vl/tags) weniger vorhersehbar; Leistung und Fehlerrate können stark schwanken – [es sei denn, du steuerst es wie in den Beispielen](#qwen3-vl-labels) weiter unten. Die Standardversion `qwen3-vl:latest` (`8b`) funktioniert im Allgemeinen ohne größere Anpassungen gut. Auf einer NVIDIA RTX 4060 ist Qwen3‑VL bei der [Label‑Generierung mit 2–3 Sekunden](#qwen3-vl-labels) pro Bild etwas langsamer als Gemma 3 mit [1–2 Sekunden](#gemma-3-labels).

Die Performance hängt außerdem von deiner Hardware ab. Auf Apple Silicon oder NVIDIA‑Blackwell‑GPUs können z.B. bestimmte [Qwen3‑VL‑Varianten](https://ollama.com/search?q=qwen3-vl) schneller sein als Gemma 3. Am besten testest du beide Modelle und entscheidest, welches für deinen Anwendungsfall besser funktioniert. Wenn du sowohl Captions als auch Labels erzeugst, solltest du möglichst dasselbe Modell verwenden, damit Ollama nicht zwischen Modellen hin‑ und herschalten muss.

!!! tldr ""
    Ohne GPU‑Beschleunigung sind Ollama‑Modelle deutlich langsamer und benötigen zwischen 10 Sekunden und über einer Minute pro Bild. Das kann in Ordnung sein, wenn du nur wenige Bilder verarbeiten möchtest oder Wartezeiten akzeptabel sind.

## Temperature, TopK und TopP

Wenn du die Optionen `Temperature`, `TopK` und `TopP` bei Ollama Modellen setzt, kannst du Zufälligkeit und Kreativität generativer [Large Language Modelle](https://en.wikipedia.org/wiki/Large_language_model) gezielt steuern:

| Parameter   | Effect on Output                           | When to Use                                    |
|-------------|--------------------------------------------|------------------------------------------------|
| Temperature | Adjusts overall randomness                 | Control creativity without limiting vocabulary |
| TopK        | Restricts choices to most probable tokens  | Prevent rare or irrelevant tokens              |
| TopP        | Adapts vocabulary size based on confidence | Dynamic control over diversity                 |

### Techniken kombinieren

Diese Methoden lassen sich kombinieren, um das Ausgabe‑Verhalten weiter zu verfeinern, zum Beispiel:

- **Temperature + TopK:** steuert die Zufälligkeit, während nur die wahrscheinlichsten Tokens gewählt werden.
- **Temperature + TopP:** regelt die Kreativität über die Temperatur und begrenzt gleichzeitig dynamisch den Token‑Raum.

Zusätzlich kannst du **MinP** setzen, um Tokens mit sehr geringer Wahrscheinlichkeit auszuschließen – typischerweise seltene Labels oder seltsame Formulierungen, die du für Klassifizierungsaufgaben nicht möchtest.

## Caption Prompts

Mit den meisten Modellen erzeugt folgender Prompt prägnante Captions mit genau einem Satz:

> Create a caption with exactly one sentence in the active voice that describes the main visual content. Begin with the main subject and clear action. Avoid text formatting, meta-language, and filler words.

**Beispiel:** *A sleek pool extends over a dramatic cliffside overlooking turquoise waters.*

Für detailliertere Bildbeschreibungen kannst du diesen Prompt verwenden (bis zu drei Sätze):

> Write a descriptive caption in 3 sentences or fewer that captures the essence of the visual content. Avoid text formatting, meta-language, and filler words. Do not start captions with phrases such as "This image", "The picture", or "Here are". Begin with the subject(s), then describe the surroundings, and finally add atmosphere (e.g., time of day). If possible, include the subject's gender and general age group.

**Beispiel:** *A gray cat with a fluffy coat is lounging on a cushion, its eyes closed in a peaceful slumber. The background features a blurred view of trees and a blue sky, suggesting it's daytime. The cat's relaxed posture and the serene outdoor setting create a tranquil and cozy atmosphere.*

Für andere Sprachen sollten die Basisanweisungen im Prompt auf Englisch bleiben; ergänze nur die gewünschte Sprache (z.B. „Respond in German“). Das funktioniert sowohl für Captions als auch für Label‑Prompts.

!!! tldr ""
    Halte Prompts so kurz wie möglich. Übermäßig lange Prompts erhöhen die Halluzinationsrate und die Latenz.

## Konfigurations Beispiele

Die folgenden Beispiele kannst du direkt in deiner `vision.yml` verwenden. Die Datei liegt im Verzeichnis `storage/config`. [Mehr erfahren ›](index.md#visionyml-referenz).

### Gemma 3: Labels

```yaml
Models:
- Type: labels
  Model: gemma3:latest
  Engine: ollama
  Run: auto
  Service:
    Uri: http://ollama:11434/api/generate
```

Warum das funktioniert:

- **Engine:** Verwendet sinnvolle Standardwerte für **Resolution**, **Format**, **Prompt** und **Options** (720 px‑Thumbnails, JSON‑Prompts für Labels). Ein eigener Prompt ist nicht notwendig.
- **Run:** `auto` läuft automatisch nach der Indexierung und durch geplante Jobs. Kann zusätzlich manuell ausgeführt werden ￫ [Run Modes](index.md#run-modes).

### Gemma 3: Caption

```yaml
Models:
- Type: caption
  Model: gemma3:latest
  Engine: ollama
  Run: auto
  Prompt: >
    Create a caption with exactly one sentence in the active voice that
    describes the main visual content. Begin with the main subject and
    clear action. Avoid text formatting, meta-language, and filler words.
  Service:
    Uri: http://ollama:11434/api/generate
```

Warum das funktioniert:

- **Engine:** Verwendet 720 px‑Thumbnails und sinnvolle Standardwerte für **Format**, **Prompt** und **Options**. Ein [eigener Prompt](#caption-prompts) ist nicht erforderlich, aber möglich.
- **Run:** `auto` läuft automatisch nach der Indexierung und durch geplante Jobs. Kann zusätzlich manuell ausgeführt werden ￫ [Run Modes](index.md#run-modes).
- **Prompt:** Nutzt den eingebauten [Standard‑Prompt](#caption-prompts). Für andere Sprachen ergänze beispielsweise „Respond in German“.

### Qwen3-VL: Labels

```yaml
Models:
- Type: labels
  Model: qwen3-vl:4b-instruct
  Engine: ollama
  Run: on-demand
  Prompt: |
    Analyze the image and return JSON label objects with name, confidence (0-1), and topicality (0-1):
    - Return AT MOST 3 labels.
    - Each label name MUST be a single-word noun in canonical singular form.
    - Do NOT repeat the same label name more than once.
    - Do NOT add any fields other than name, confidence, topicality.
    - Do NOT output any text before or after the JSON.
  Options:
    Seed: 3407           # Modell-Standard, siehe https://github.com/QwenLM/Qwen3-VL
    Temperature: 0.01    # geringe Zufälligkeit, weniger Halluzinationen
    TopK: 40             # berücksichtigt nur die Top ~40 Token
    TopP: 0.9            # schneidet das Ende der Verteilung ab
    MinP: 0.05           # verwirft seltene Token
    TypicalP: 1.0        # effektiv deaktiviert
    RepeatLastN: 128     # schaut zurück, um Wiederholungen zu vermeiden
    RepeatPenalty: 1.2   # Strafe zur Vermeidung einfacher Schleifen
    NumPredict: 512      # verhindert ausufernde Ausgaben
  Service:
    Uri: http://ollama:11434/api/generate
```

Warum das funktioniert:

- **Model:** [`qwen3-vl:4b-instruct`](https://ollama.com/library/qwen3-vl/tags) ist eine leichtere Qwen3‑VL‑Variante. Alternativ kannst du [`huihui_ai/qwen3-vl-abliterated:4b-instruct`](https://ollama.com/huihui_ai/qwen3-vl-abliterated), [`qwen3-vl:latest`](https://ollama.com/library/qwen3-vl) oder andere [Varianten](https://ollama.com/search?c=vision&q=qwen3-vl) ausprobieren.
- **Engine:** Wendet sinnvolle Standardwerte für **Resolution**, **Format** und **Options** an.
- **Run:** `on-demand` erlaubt manuelle Läufe, Ausführungen durch den Metadata‑Worker und geplante Jobs ￫ [Run Modes](index.md#run-modes).
- **Prompt:** Begrenzte Latenz, keine Wiederholungen und klare Kontrolle über Art und Anzahl der zurückgegebenen Labels. Für andere Sprachen ergänze „Respond in …“ im Prompt.
- **Seed:** Sorgt für stabile, reproduzierbare Labels. Im Beispiel wird der Default‑Seed der [instruct‑Variante](https://github.com/QwenLM/Qwen3-VL?tab=readme-ov-file#instruct-models) verwendet.
- **Temperature, TopP und TopK:** Erzwingen eher häufige, hochwahrscheinliche Wörter statt kreativer Synonyme.
- **MinP:** Schließt unwahrscheinliche Tokens aus, also jene seltenen Labels und merkwürdigen Formulierungen, die du für Klassifizierung nicht brauchst.
- **RepeatLastN** und **RepeatPenalty:** Stellen sicher, dass Labels eindeutig bleiben, indem Wiederholungen vermieden werden.
- **NumPredict:** Begrenzt die maximale Ausgabelänge, um Endloswiederholungen zu vermeiden.

### Qwen3-VL: Caption

```yaml
Models:
- Type: caption
  Model: qwen3-vl:4b-instruct
  Engine: ollama
  Run: on-schedule
  System: You are an image captioning assistant.
  Prompt: |
    Write one or two concise sentences that describe the main subject, key actions, and setting of the image:
    - Describe only what is clearly visible in the image; do not invent names, ages, or backstories.
    - Use natural, fluent language without bullet points or lists.
    - Do NOT start with phrases like "The image shows" or "In this picture".
    - Do NOT mention camera settings, image quality, filters, or art style unless they are essential to understanding the content.
    - Do NOT include quotation marks around the caption.
    - Respond with the caption text only, and nothing else.
  Options:
    Seed: 3407           # Modell-Standard, siehe https://github.com/QwenLM/Qwen3-VL
    Temperature: 0.25    # reduziert Zufälligkeit für weniger Halluzinationen
    TopK: 20             # entspricht dem Modell-Standard
    TopP: 0.8            # entspricht dem Modell-Standard
    MinP: 0.05           # schneidet sehr unwahrscheinliche, seltsame Token ab
    TypicalP: 1.0        # effektiv deaktiviert; TopP/MinP dominieren
    RepeatLastN: 64      # kurze Historie für 1–2 Sätze
    RepeatPenalty: 1.1   # Strafe gegen Schleifen ohne den Sprachfluss zu stören
    NumPredict: 128      # verhindert ausufernde Ausgaben
  Service:
    Uri: http://ollama:11434/api/generate
```

Warum das funktioniert:

- **Model:** Die Verwendung von [`qwen3-vl:4b-instruct`](https://ollama.com/library/qwen3-vl/tags) für Labels und Captions vermeidet zeitaufwändige Modellwechsel in Ollama. Alternativ kannst du [`huihui_ai/qwen3-vl-abliterated:4b-instruct`](https://ollama.com/huihui_ai/qwen3-vl-abliterated), [`qwen3-vl:latest`](https://ollama.com/library/qwen3-vl) oder andere [Varianten](https://ollama.com/search?c=vision&q=qwen3-vl) testen.
- **Engine:** Wendet sinnvolle Standardwerte für **Resolution**, **Format** und **Options** an.
- **Run:** `on-schedule` erlaubt manuelle Läufe und geplante Jobs ￫ [Run Modes](index.md#run-modes).
- **System:** Weist das Modell an, Bilder in natürlicher Sprache zu beschreiben.
- **Prompt:** Fordert ein oder zwei Sätze an, die Motiv, Handlung und Umgebung beschreiben, und verbietet Meta‑Formulierungen wie „The image shows…“, Listen und Zusatzkommentare. So entstehen saubere Alt‑Text‑ähnliche Captions, die direkt in UIs angezeigt werden können. Regeln wie „describe only what is clearly visible“ und „do not invent names/ages/backstories“ reduzieren Halluzinationen und halten die Beschreibungen sachlich.
- **Seed:** Sorgt für stabile, reproduzierbare Captions für dasselbe Bild‑/Prompt‑Paar – nützlich beim Indexieren oder erneuten Generieren. Für mehr Varianz kannst du den Seed weglassen oder variieren.
- **Temperature** und **MinP:** Entfernen den „langen Schwanz“ sehr unwahrscheinlicher Tokens (ungewöhnliche Wörter, Bruchstücke) und halten die Auswahl nahe an den wahrscheinlichsten Formulierungen. So erhältst du eher einfache, verlässliche Captions als kreative Umschreibungen.
- **TopK** und **TopP:** Erhöhen Stabilität und senken das Halluzinationsrisiko im Caption‑Kontext.
- **RepeatPenalty** und **RepeatLastN:** Verhindern Wiederholungen, ohne den natürlichen Sprachfluss zu stören.
- **NumPredict:** Hoch genug für ein bis zwei Sätze, aber niedrig genug, um Abschweifungen zu vermeiden.

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

bevor neue Kategorien mit Ollama erstellt werden

```
photoprism vision run -m labels
```

[Learn more ›](cli.md)
