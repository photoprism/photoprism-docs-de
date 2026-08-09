# Ollama Modelle #

Wir empfehlen, ein [Vision Modell](https://ollama.com/search?c=vision) zu wählen, das Geschwindigkeit, Genauigkeit und Zuverlässigkeit gut ausbalanciert. Drei Modellfamilien erfüllen diese Kriterien und können wir empfehlen — [Gemma 4](https://ollama.com/library/gemma4), [Qwen3-VL](https://ollama.com/library/qwen3-vl) und [Qwen 3.5](https://ollama.com/library/qwen3.5):

| Modell       | Anwendungsfall                                             | Anmerkungen                                                          |
|--------------|------------------------------------------------------------|----------------------------------------------------------------------|
| **Gemma 4**  | Standard-Generierung von Bildunterschriften und Labels auf Englisch | Leichte, zuverlässige JSON-Ausgabe; guter Standard. Für eine nicht‑englische Bibliothek keine gute Wahl — siehe [Sprachunterstützung](#language-support). |
| **Qwen3-VL** | Fortgeschrittene Bilderkennung und Reasoning (OCR, komplexe Prompts) | Beste Motiv‑Abdeckung in unserem Benchmark, wenn der Prompt eine Anzahl an Labels vorgibt. Verwende einen `-instruct`‑Tag. |
| **Qwen 3.5** | Leichtgewichtige Alternative für Captions und Labels        | Starke Ergebnisse mit dem eingebauten Prompt bei weniger als der Hälfte der Prompt‑Tokens von Qwen3-VL. Kein `-instruct`‑Tag nötig. |

[**Gemma 4**](https://ollama.com/library/gemma4) ist in Bezug auf Performance sehr konsistent; Fehler treten nur selten auf. Für sehr lange oder komplexe Prompts und Captions ist es jedoch weniger geeignet. Für die meisten [Anwendungsfälle](#gemma-4-labels) empfehlen wir die [Standard‑Variante](https://ollama.com/library/gemma4/tags) `gemma4:latest` (aktuell ein Alias für `gemma4:e4b`). Die kleinere Variante [`gemma4:e2b`](https://ollama.com/library/gemma4/tags) ist spürbar schneller und liefert sogar *mehr* Labels pro Bild, bei etwas geringerer Motiv‑Abdeckung — eine gute Wahl, wenn Tempo und Label‑Anzahl wichtiger sind als das eine treffendste Motiv. Wenn du bereits [Gemma 3](https://ollama.com/library/gemma3) konfiguriert hast, funktioniert das weiterhin – Gemma 4 ist ein Drop‑in‑Ersatz mit vergleichbarer Latenz (ca. 2 Sekunden für die Label‑Generierung auf einer NVIDIA RTX 4060 in unseren Tests).

[**Qwen3‑VL**](https://ollama.com/library/qwen3-vl) verhält sich in den kleineren `2b`‑ und `4b`‑[Varianten](https://ollama.com/library/qwen3-vl/tags) weniger vorhersehbar; Leistung und Fehlerrate können stark schwanken – [es sei denn, du steuerst es wie in den Beispielen](#qwen3-vl-labels) weiter unten. Die Standardversion `qwen3-vl:latest` (`8b`) funktioniert im Allgemeinen ohne größere Anpassungen gut. Die Label‑Generierung auf einer NVIDIA RTX 4060 dauert typischerweise [2–3 Sekunden](#qwen3-vl-labels) und ist damit in etwa vergleichbar mit [Gemma 4](#gemma-4-labels).

[**Qwen 3.5**](https://ollama.com/library/qwen3.5) ist die leichtere der beiden Qwen‑Optionen und benötigt keinen speziellen Tag: `qwen3.5:4b` verhält sich bereits wie ein Instruct‑Build, erzeugt Captions in etwa einer Sekunde und hält mehrwortige Label‑Namen nahe null. Mit dem eingebauten Label‑Prompt erreichte es die höchste Motiv‑Abdeckung aller von uns gemessenen selbst gehosteten Modelle, und es kodiert ein 720‑px‑Bild in weniger als der Hälfte der Prompt‑Tokens von Qwen3-VL, was es an einem abgerechneten Endpunkt spürbar günstiger macht. Sobald der Prompt eine [Label‑Anzahl](#qwen3-vl-labels) vorgibt, zieht Qwen3-VL wieder vorbei — wähle also Qwen 3.5 für ein leichtes, günstiges Setup und Qwen3-VL, wenn die Motiv‑Abdeckung am wichtigsten ist. Beachte, dass die [`2b`‑ und `9b`‑Varianten](https://ollama.com/library/qwen3.5/tags) bei Labels beide deutlich schlechter abschnitten als `4b` — größer ist hier nicht besser.

Eine Community‑Variante, [`frob/qwen3.5-instruct:4b`](https://ollama.com/frob/qwen3.5-instruct), ist eine fähige Alternative, die dasselbe Options‑Profil wie `qwen3-vl:4b-instruct` nutzt (siehe [unten](#qwen3-vl-labels)) und eine vergleichbare Latenz liefert. Im direkten Vergleich mit dem offiziellen [`qwen3.5:4b`](https://ollama.com/library/qwen3.5) auf denselben Bildern folgt sie ihrem Basismodell sehr eng — gleiche Familie, Größe und Quantisierung, 7 von 16 Label‑Sets identisch und die übrigen Unterschiede kosmetisch. Beide sind eine sinnvolle Wahl; das offizielle Modell aus der Library ist einfacher aktuell zu halten. Wie bei allen Qwen‑Modellen müssen die strikten Options und das Prompt‑Schema "AT MOST N labels" beibehalten werden – ohne sie erzeugt das Modell zu viele Tokens und die JSON‑Antwort wird abgeschnitten.

Die Performance hängt außerdem von deiner Hardware ab, und die Rangfolge kann sich damit ändern. Unsere Werte stammen von einer einzelnen NVIDIA RTX 4060 — betrachte sie als Ausgangspunkt, nicht als Urteil, und probiere die Kandidaten auf deiner eigenen Maschine aus. Ein Grund für die Verschiebung: Was ein Bild an Prompt‑Tokens kostet, unterscheidet sich zwischen den Modellfamilien um mehr als das Fünffache. Eine Maschine, die das Bild langsam kodiert — ohne GPU, mit in den System‑RAM ausgelagerten Layern oder mit einer GPU ohne Flash Attention — bestraft daher ein Modell mit schwerem Vision‑Encoder wie Qwen3-VL weit stärker als ein leichtes wie Gemma 4, selbst wenn beide auf einer schnellen GPU nah beieinander liegen.

Wenn du sowohl Captions als auch Labels erzeugst, verwende dasselbe Modell für beides, damit Ollama nicht zwischen Modellen hin‑ und herschalten muss.

!!! tldr ""
    Ohne GPU‑Beschleunigung sind Ollama‑Modelle deutlich langsamer und benötigen zwischen 10 Sekunden und über einer Minute pro Bild. Das kann in Ordnung sein, wenn du nur wenige Bilder verarbeiten möchtest oder Wartezeiten akzeptabel sind.

!!! warning "Reasoning bei Thinking-Modellen deaktivieren"
    Viele aktuelle Vision-Modelle – die Qwen3.5-Familie, `qwen3-vl:*`, `frob/qwen3.5-instruct:4b` und andere – sind **Thinking- bzw. Reasoning-Modelle**. Bei aktiviertem Reasoning geben neuere Ollama-Versionen dieses im Ergebnis aus: Captions beginnen mit Text wie *"The user wants a concise description of the provided image…"* und das Label-JSON lässt sich nicht mehr parsen. **Setze `Service.Think: "false"`** für diese Modelle (wie in den Beispielen unten), um die Reasoning-Ausgabe abzuschalten – auf PhotoPrism [260601](https://github.com/photoprism/photoprism/releases/tag/260601-a7d098548) und älter ist dies erforderlich, damit das Reasoning nicht in Captions und Kategorien landet. Spätere Releases deaktivieren das Ollama-Reasoning standardmäßig, sodass es dort eher eine Absicherung als eine Voraussetzung ist; es bleibt überall harmlos, weshalb die Beispiele es immer enthalten. Aktiviere Reasoning nur bewusst wieder mit `Service.Think: "true"`.

!!! tip "Bei Qwen3-VL zusätzlich einen `-instruct`‑Tag verwenden"
    `Service.Think: "false"` hält das Reasoning **aus der Ausgabe** heraus. Es hindert einen Reasoning‑Build aber nicht daran, es überhaupt zu *erzeugen* — der Aufwand bleibt also größtenteils bestehen. Gemessen an `qwen3-vl:4b` mit deaktiviertem Reasoning: rund 414 Ausgabe‑Tokens und 6,6 Sekunden für eine Caption aus zwölf Wörtern, während [`qwen3-vl:4b-instruct`](https://ollama.com/library/qwen3-vl/tags) eine längere Caption in etwa 1,2 Sekunden mit 24 Tokens lieferte. Der Reasoning‑Build gab außerdem 21 % mehrwortige Label‑Namen zurück, gegenüber 0 % beim Instruct‑Build. Betrachte das Flag als Korrektheits‑Absicherung und den Tag als Performance‑Entscheidung — das sind zwei getrennte Dinge.

    Das gilt speziell für Qwen3-VL. `qwen3.5:4b` braucht keinen `-instruct`‑Tag: Schon mit dem normalen Tag antwortete es in etwa einer Sekunde mit 21 Ausgabe‑Tokens und unter 2 % mehrwortigen Label‑Namen. Gemma 4 ist kein Reasoning‑Modell und davon ohnehin nicht betroffen.

## Sprachunterstützung { #language-support }

Für andere Sprachen als Englisch sollten die Basisanweisungen im Prompt auf Englisch bleiben; ergänze nur die gewünschte Sprache (z.B. "Respond in German"). Das funktioniert für Caption‑ und Label‑Prompts gleichermaßen und ist zuverlässiger, als die Anweisungen selbst zu übersetzen.

!!! warning "Labels und Captions getrennt prüfen"
    Ein Modell kann die gewünschte Sprache für **Captions** befolgen und sie bei **Kategorien** stillschweigend ignorieren. In unseren Tests lieferte `gemma4:e2b` korrekte arabische und hebräische Captions, gab die Labels aber bei *jeder* Anfrage auf Englisch zurück — auch bei Deutsch, ohne Fehlermeldung und ohne Eintrag im Log.

    Die richtige Schrift bedeutet außerdem nicht, dass der Inhalt stimmt. Ein 4B‑Modell erzeugte flüssiges Hebräisch, benannte darin aber das falsche Motiv und beschrieb das Foto eines Elefanten als "der Löwe zerquetscht die Vögel".

    Prüfe also beide Modelltypen — und prüfe den **Inhalt**, nicht nur das Alphabet. Erzeuge ein paar Bilder mit `photoprism vision run -m labels --count 1 --force` sowie `-m caption` und lies die Ergebnisse.

Die Unterstützung schwankt stark je nach Modell und folgt weder der Größe noch der allgemeinen Qualität. Gehostete Modelle beherrschten Deutsch, Arabisch und Hebräisch deutlich besser als jedes von uns gemessene selbst gehostete Modell, das in 8 GB VRAM passt. Unter den selbst gehosteten Optionen war Gemma 4 bei nicht‑englischen **Kategorien** am schwächsten, obwohl es unser empfohlener Standard für Englisch ist — eine nicht‑englische Bibliothek ist also einer der Fälle, in denen sich [Qwen3-VL](#qwen3-vl-labels) oder ein [Cloud‑Modell](ollama-cloud.md) zu testen lohnt.

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

Für andere Sprachen sollten die Basisanweisungen im Prompt auf Englisch bleiben; ergänze nur die gewünschte Sprache (z.B. "Respond in German") und prüfe das Ergebnis wie unter [Sprachunterstützung](#language-support) beschrieben.

!!! tldr ""
    Halte Prompts so kurz wie möglich. Übermäßig lange Prompts erhöhen die Halluzinationsrate und die Latenz.

## Konfigurations Beispiele

Die folgenden Beispiele kannst du direkt in deiner `vision.yml` verwenden. Die Datei liegt im Verzeichnis `storage/config`. [Mehr erfahren ›](index.md#visionyml-reference).

!!! tldr "Wie viele Labels zu erwarten sind"
    Selbst gehostete Modelle erzeugen zu wenige Labels, wenn der Prompt keine Anzahl vorgibt. In unserem Benchmark lieferten Modelle, die in 8 GB VRAM passen, ein bis vier Labels pro Bild mit dem eingebauten Prompt, während gehostete Modelle sieben bis zwölf von sich aus zurückgaben. Wenn du mehr möchtest, frage die Anzahl ausdrücklich ab — siehe das [Qwen3-VL Label‑Beispiel](#qwen3-vl-labels) weiter unten.

### Gemma 4: Labels

```yaml
Models:
- Type: labels
  Model: gemma4:latest
  Engine: ollama
  Run: auto
  Service:
    Uri: http://ollama:11434/api/generate
    Think: "false"
```

Warum das funktioniert:

- **Engine:** Verwendet sinnvolle Standardwerte für **Resolution**, **Format**, **Prompt** und **Options** (720 px‑Thumbnails, JSON‑Prompts für Labels). Ein eigener Prompt ist nicht notwendig.
- **Run:** `auto` läuft automatisch nach der Indexierung und durch geplante Jobs. Kann zusätzlich manuell ausgeführt werden ￫ [Run Modes](index.md#run-modes).
- **Model:** `gemma4:latest` ist aktuell ein Alias für `gemma4:e4b` und lieferte in unserem Benchmark rund drei Labels pro Bild mit abgestufter Topicality, mit der besseren Motiv‑Abdeckung der beiden Varianten. Wechsle zu `gemma4:e2b`, wenn du Tempo und ein etwas größeres Label‑Set bevorzugst — es kam im Schnitt auf vier bis fünf Labels pro Bild bei geringfügig schlechterer Abdeckung.

### Gemma 4: Caption

```yaml
Models:
- Type: caption
  Model: gemma4:latest
  Engine: ollama
  Run: auto
  Prompt: >
    Create a caption with exactly one sentence in the active voice that
    describes the main visual content. Begin with the main subject and
    clear action. Avoid text formatting, meta-language, and filler words.
  Service:
    Uri: http://ollama:11434/api/generate
    Think: "false"
```

Warum das funktioniert:

- **Engine:** Verwendet 720 px‑Thumbnails und sinnvolle Standardwerte für **Format**, **Prompt** und **Options**. Ein [eigener Prompt](#caption-prompts) ist nicht erforderlich, aber möglich.
- **Run:** `auto` läuft automatisch nach der Indexierung und durch geplante Jobs. Kann zusätzlich manuell ausgeführt werden ￫ [Run Modes](index.md#run-modes).
- **Prompt:** Nutzt den eingebauten [Standard‑Prompt](#caption-prompts). Für andere Sprachen ergänze beispielsweise "Respond in German".

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
    Think: "false"
```

Warum das funktioniert:

- **Model:** [`qwen3-vl:4b-instruct`](https://ollama.com/library/qwen3-vl/tags) ist eine leichtere Qwen3‑VL‑Variante. Alternativ kannst du [`frob/qwen3.5-instruct:4b`](https://ollama.com/frob/qwen3.5-instruct) (eine neuere Community‑Variante; nutzt dasselbe Options‑Profil und hat in unseren Tests leicht bessere Ergebnisse bei weniger verbreiteten Motiven geliefert), [`huihui_ai/qwen3-vl-abliterated:4b-instruct`](https://ollama.com/huihui_ai/qwen3-vl-abliterated), [`qwen3-vl:latest`](https://ollama.com/library/qwen3-vl) oder andere [Varianten](https://ollama.com/search?c=vision&q=qwen3-vl) ausprobieren.
- **Engine:** Wendet sinnvolle Standardwerte für **Resolution**, **Format** und **Options** an.
- **Run:** `on-demand` erlaubt manuelle Läufe, Ausführungen durch den Metadata‑Worker und geplante Jobs ￫ [Run Modes](index.md#run-modes).
- **Prompt:** Begrenzte Latenz, keine Wiederholungen und klare Kontrolle über Art und Anzahl der zurückgegebenen Labels. Für andere Sprachen siehe [Sprachunterstützung](#language-support).
- **`Return AT MOST 3 labels`:** Eine bewusste Obergrenze und der Grund, warum die strikten Options nicht aus dem Ruder laufen. Sie ist zugleich restriktiv: In unserem Benchmark lieferte `qwen3-vl:4b-instruct` mit diesem Prompt rund drei Labels pro Bild, mit einer Vorgabe von 8–15 dagegen rund zehn, wobei die Motiv‑Abdeckung von 75 % auf 97 % stieg. Wenn du reichhaltigere Labels möchtest, erhöhe die Obergrenze — und rechne mit etwa der zwei‑ bis dreifachen Latenz.
- **`single-word noun in canonical singular form`:** Behalte diese Anweisung in jedem eigenen Prompt bei. PhotoPrism reduziert einen mehrwortigen Label‑Namen derzeit auf ein einzelnes Token und behält dabei meist das falsche — `ferris wheel` wird als *Ferris* gespeichert, `amusement park` als *Park* ([photoprism#5773](https://github.com/photoprism/photoprism/issues/5773)).
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
    Think: "false"
```

Warum das funktioniert:

- **Model:** Die Verwendung von [`qwen3-vl:4b-instruct`](https://ollama.com/library/qwen3-vl/tags) für Labels und Captions vermeidet zeitaufwändige Modellwechsel in Ollama. Alternativ kannst du [`frob/qwen3.5-instruct:4b`](https://ollama.com/frob/qwen3.5-instruct) (eine neuere Community‑Variante; nutzt dasselbe Options‑Profil und hat in unseren Tests leicht bessere Ergebnisse bei weniger verbreiteten Motiven geliefert), [`huihui_ai/qwen3-vl-abliterated:4b-instruct`](https://ollama.com/huihui_ai/qwen3-vl-abliterated), [`qwen3-vl:latest`](https://ollama.com/library/qwen3-vl) oder andere [Varianten](https://ollama.com/search?c=vision&q=qwen3-vl) testen.
- **Engine:** Wendet sinnvolle Standardwerte für **Resolution**, **Format** und **Options** an.
- **Run:** `on-schedule` erlaubt manuelle Läufe und geplante Jobs ￫ [Run Modes](index.md#run-modes).
- **System:** Weist das Modell an, Bilder in natürlicher Sprache zu beschreiben.
- **Prompt:** Fordert ein oder zwei Sätze an, die Motiv, Handlung und Umgebung beschreiben, und verbietet Meta‑Formulierungen wie "The image shows…", Listen und Zusatzkommentare. So entstehen saubere Alt‑Text‑ähnliche Captions, die direkt in UIs angezeigt werden können. Regeln wie "describe only what is clearly visible" und "do not invent names/ages/backstories" reduzieren Halluzinationen und halten die Beschreibungen sachlich.
- **Seed:** Sorgt für stabile, reproduzierbare Captions für dasselbe Bild‑/Prompt‑Paar – nützlich beim Indexieren oder erneuten Generieren. Für mehr Varianz kannst du den Seed weglassen oder variieren.
- **Temperature** und **MinP:** Entfernen den "langen Schwanz" sehr unwahrscheinlicher Tokens (ungewöhnliche Wörter, Bruchstücke) und halten die Auswahl nahe an den wahrscheinlichsten Formulierungen. So erhältst du eher einfache, verlässliche Captions als kreative Umschreibungen.
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
