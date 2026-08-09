# Ollama Modelle #

Wir empfehlen, ein [Vision Modell](https://ollama.com/search?c=vision) zu wählen, das Geschwindigkeit, Genauigkeit und Zuverlässigkeit gut ausbalanciert. Drei Modellfamilien erfüllen diese Kriterien und können wir empfehlen — [Gemma 4](https://ollama.com/library/gemma4), [Qwen3-VL](https://ollama.com/library/qwen3-vl) und [Qwen 3.5](https://ollama.com/library/qwen3.5):

| Modell       | Anwendungsfall                                                       | Anmerkungen                                                                                                                                               |
|--------------|----------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Gemma 4**  | Standard-Generierung von Bildunterschriften und Labels auf Englisch  | Leichte, zuverlässige JSON-Ausgabe; guter Standard. Für eine nicht‑englische Bibliothek keine gute Wahl — siehe [Sprachunterstützung](#language-support). |
| **Qwen3-VL** | Fortgeschrittene Bilderkennung und Reasoning (OCR, komplexe Prompts) | Beste Motiv‑Abdeckung in unserem Benchmark, wenn der Prompt eine Anzahl an Labels vorgibt. Verwende einen `-instruct`‑Tag.                                |
| **Qwen 3.5** | Leichtgewichtige Alternative für Captions und Labels                 | Starke Ergebnisse mit dem eingebauten Prompt bei weniger als der Hälfte der Prompt‑Tokens von Qwen3-VL. Kein `-instruct`‑Tag nötig.                       |

[**Gemma 4**](https://ollama.com/library/gemma4) ist in Bezug auf Performance sehr konsistent; Fehler treten nur selten auf. Für sehr lange oder komplexe Prompts und Captions ist es jedoch weniger geeignet. Für die meisten [Anwendungsfälle](#gemma-4-labels) empfehlen wir die [Standard‑Variante](https://ollama.com/library/gemma4/tags) `gemma4:latest` (aktuell ein Alias für `gemma4:e4b`). Die kleinere Variante [`gemma4:e2b`](https://ollama.com/library/gemma4/tags) ist spürbar schneller und liefert sogar *mehr* Labels pro Bild, bei etwas geringerer Motiv‑Abdeckung — eine gute Wahl, wenn Tempo und Label‑Anzahl wichtiger sind als das eine treffendste Motiv. Wenn du bereits [Gemma 3](https://ollama.com/library/gemma3) konfiguriert hast, funktioniert das weiterhin – Gemma 4 ist ein Drop‑in‑Ersatz mit vergleichbarer Latenz (ca. 2 Sekunden für die Label‑Generierung auf einer NVIDIA RTX 4060 in unseren Tests).

Schwächer ist Gemma 4 beim Erkennen von Motiven, bei denen es sich nicht sicher ist: Statt allgemein zu bleiben, rät es selbstbewusst. In unserem Benchmark bezeichneten beide Varianten einen Gepard als "Leopard" — bei jedem Durchlauf und in jeder getesteten Sprache, also auch auf Deutsch. Das ist kein Übersetzungsproblem, sondern eine Fehlerkennung: Das Modell meint tatsächlich das falsche Tier. Ebenso wurde eine Pinguinkolonie als "Robben" beschrieben und ein Skispringer als Snowboarder. Wenn deine Bibliothek viele Tieraufnahmen oder andere weniger verbreitete Motive enthält, ist das der Grund, stattdessen Qwen3-VL oder Qwen 3.5 in vergleichbarer Größe auszuprobieren.

[**Qwen3‑VL**](https://ollama.com/library/qwen3-vl) verhält sich in den kleineren `2b`‑ und `4b`‑[Varianten](https://ollama.com/library/qwen3-vl/tags) weniger vorhersehbar; Leistung und Fehlerrate können stark schwanken – [es sei denn, du steuerst es wie in den Beispielen](#qwen3-vl-labels) weiter unten. Die Standardversion `qwen3-vl:latest` (`8b`) funktioniert im Allgemeinen ohne größere Anpassungen gut. Die Label‑Generierung auf einer NVIDIA RTX 4060 dauert typischerweise [2–3 Sekunden](#qwen3-vl-labels) und ist damit in etwa vergleichbar mit [Gemma 4](#gemma-4-labels).

[**Qwen 3.5**](https://ollama.com/library/qwen3.5) ist die leichtere der beiden Qwen‑Optionen und benötigt keinen speziellen Tag: `qwen3.5:4b` verhält sich bereits wie ein Instruct‑Build, erzeugt Captions in etwa einer Sekunde und hält mehrwortige Label‑Namen nahe null. Mit dem eingebauten Label‑Prompt erreichte es die höchste Motiv‑Abdeckung aller von uns gemessenen selbst gehosteten Modelle, und es kodiert ein 720‑px‑Bild in weniger als der Hälfte der Prompt‑Tokens von Qwen3-VL, was es an einem abgerechneten Endpunkt spürbar günstiger macht. Sobald der Prompt eine [Label‑Anzahl](#qwen3-vl-labels) vorgibt, zieht Qwen3-VL wieder vorbei — wähle also Qwen 3.5 für ein leichtes, günstiges Setup und Qwen3-VL, wenn die Motiv‑Abdeckung am wichtigsten ist. Beachte, dass die [`2b`‑ und `9b`‑Varianten](https://ollama.com/library/qwen3.5/tags) bei Labels beide deutlich schlechter abschnitten als `4b` — größer ist hier nicht besser.

Wie bei allen Qwen‑Modellen müssen für beide die strikten Options und das Prompt‑Schema "AT MOST N labels" beibehalten werden — ohne sie erzeugen sie zu viele Tokens und die JSON‑Antwort wird abgeschnitten.

Die Performance hängt außerdem von deiner Hardware ab, und die Rangfolge kann sich damit ändern. Unsere Werte stammen von einer einzelnen NVIDIA RTX 4060 — betrachte sie als Ausgangspunkt, nicht als Urteil, und probiere die Kandidaten auf deiner eigenen Maschine aus. Ein Grund für die Verschiebung: Was ein Bild an Prompt‑Tokens kostet, unterscheidet sich zwischen den Modellfamilien um mehr als das Fünffache. Eine Maschine, die das Bild langsam kodiert — ohne GPU, mit in den System‑RAM ausgelagerten Layern oder mit einer GPU ohne Flash Attention — bestraft daher ein Modell mit schwerem Vision‑Encoder wie Qwen3-VL weit stärker als ein leichtes wie Gemma 4, selbst wenn beide auf einer schnellen GPU nah beieinander liegen.

Wenn du sowohl Captions als auch Labels erzeugst, verwende dasselbe Modell für beides, damit Ollama nicht zwischen Modellen hin‑ und herschalten muss.

!!! tldr ""
    Ohne GPU‑Beschleunigung sind Ollama‑Modelle deutlich langsamer und benötigen zwischen 10 Sekunden und über einer Minute pro Bild. Das kann in Ordnung sein, wenn du nur wenige Bilder verarbeiten möchtest oder Wartezeiten akzeptabel sind.

!!! warning "Reasoning bei Thinking-Modellen deaktivieren"
    Viele aktuelle Vision-Modelle – die Qwen3.5-Familie, `qwen3-vl:*` und andere – sind **Thinking- bzw. Reasoning-Modelle**. Bei aktiviertem Reasoning geben neuere Ollama-Versionen dieses im Ergebnis aus: Captions beginnen mit Text wie *"The user wants a concise description of the provided image…"* und das Label-JSON lässt sich nicht mehr parsen. **Setze `Service.Think: "false"`** für diese Modelle (wie in den Beispielen unten), um die Reasoning-Ausgabe abzuschalten – auf PhotoPrism [260601](https://github.com/photoprism/photoprism/releases/tag/260601-a7d098548) und älter ist dies erforderlich, damit das Reasoning nicht in Captions und Kategorien landet. Spätere Releases deaktivieren das Ollama-Reasoning standardmäßig, sodass es dort eher eine Absicherung als eine Voraussetzung ist; es bleibt überall harmlos, weshalb die Beispiele es immer enthalten. Aktiviere Reasoning nur bewusst wieder mit `Service.Think: "true"`.

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

## Normalisierung der Label‑Namen { #label-name-normalization }

Sprachmodelle liefern Label‑Namen in der Form, die der Prompt nahelegt. PhotoPrism vereinheitlicht sie deshalb vor dem Speichern. Die Eigenschaft `Normalize` eines **Labels**-Modells legt fest, wie:[^1]

| Wert              | `ferris wheel` wird gespeichert als | Verhalten                                                                                                                                   |
|-------------------|-------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| *(nicht gesetzt)* | Engine-Standard                     | `phrase` für gehostete Modelle, sonst `single-word`.                                                                                        |
| `single-word`     | *Ferris*                            | Reduziert auf das erste Token, das im Label‑Vokabular auflösbar ist, sonst auf das erste Token.                                             |
| `phrase`          | *Ferris Wheel*                      | Behält die Wortgruppe und gleicht sie samt Singularform zuerst als Ganzes gegen das Vokabular ab, sodass aus `sea lions` *Sea Lion* wird.   |
| `false`           | *Ferris Wheel*                      | Behält exakt das, was das Modell zurückgegeben hat, ohne Vokabular‑Zuordnung — `carousel` bleibt *Carousel* und wird nicht zu *Theme Park*. |

Ein Name in einer **nicht-lateinischen Schrift** bleibt in jedem Modus vollständig erhalten, auch unter `single-word` — die Einstellung kann ihn nicht zusammenziehen.

`off`, `none`, `no` und `disabled` werden als Aliase für `false` akzeptiert.

Nur der *Name* hängt vom Modus ab. Schwellenwerte für Confidence und Topicality, Kategorien und Prioritäten gelten in allen Modi gleich, ein wenig aussagekräftiger Name wie `background` wird also weiterhin verworfen. Was sich ändert, ist die gefundene Vokabular‑Regel: `ski-lift` erbt den strengeren `ski`-Schwellenwert, wenn es zu *Ski* reduziert wird, und den allgemeinen Schwellenwert, wenn es als *Ski Lift* erhalten bleibt.

**Die Standardwerte unterscheiden sich aus einem gemessenen Grund.** Jeder mehrteilige Label‑Name, den die gehosteten Modelle in unserem Benchmark zurückgaben, war ein echtes Kompositum — 0–2,1 % aller Labels. Sie behalten Wortgruppen daher standardmäßig bei. Modelle, die in 8 GB VRAM passen, lieferten 3–19 % mehrteilige Namen und mischten echte Komposita mit Füllwörtern wie `city_name`, `text_on_sign` und `photo list` — sie bleiben deshalb bei `single-word`, und die Rate mehrteiliger Namen lohnt einen Blick, bevor du ein Modell auf `phrase` umstellst.

**Namen in einer anderen Schrift sind automatisch geschützt.** Das Label‑Vokabular ist englisch. Einen Namen ohne lateinische Buchstaben in Token zu zerlegen, kann daher nichts treffen und kürzt nur das Motiv weg — aus dem arabischen `حمار وحشي` (Zebra) würde `حمار` (Esel), aus dem hebräischen `גלגל ענק` (Riesenrad) würde `גלגל` (Rad). PhotoPrism behält solche Namen deshalb auch unter `single-word` vollständig bei; für eine arabische, hebräische, chinesische, japanische, koreanische, griechische oder kyrillische Bibliothek musst du dafür nichts einstellen.

Maßgeblich ist die **Schrift, nicht die Sprache**: Ein Name in lateinischer Schrift lässt sich weiterhin Token für Token auflösen, und das dabei behaltene Hauptwort ist meist das richtige — aus dem spanischen `noria gigante` wird *Noria*, also weiterhin ein Riesenrad. Ein Name, der Schriften mischt, folgt der konfigurierten Einstellung, sodass `شاطئ beach` über das Vokabular zu *Beach* aufgelöst wird. **Für eine deutsche Bibliothek ist es damit eine echte Abwägung und keine Notwendigkeit:** `single-word` behält das Hauptwort, `phrase` das vollständige Kompositum — bei deutschen Komposita, die ohnehin oft ein einzelnes Wort sind (`Riesenrad`), fällt der Unterschied ohnehin kaum ins Gewicht.

Um zusammengesetzte Namen zu behalten, setze `Normalize: phrase` am Modell **und** verwende einen `System`-Prompt, der keine Einzelwort-Substantive verlangt — sonst liefert das Modell kaum je eine Wortgruppe, die erhalten bleiben könnte:

```yaml
Models:
- Type: labels
  Model: qwen3-vl:4b-instruct
  Engine: ollama
  Normalize: phrase
  Service:
    Uri: http://ollama:11434/api/generate
    Think: "false"
```

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
    Der eingebaute Label‑Prompt gibt bewusst keine Anzahl vor. Eine kurze Liste zuverlässiger Labels ist nützlicher — und günstiger — als eine lange: Die Anzahl wirkt sich auf die Datenbank, die API‑Antwort und die Oberfläche aus, die sie laden und darstellen muss, und ein Modell, das ein Bild schlecht erfasst, liefert vor allem Rauschen, wenn man mehr von ihm verlangt.

    Wie viele du bekommst, hängt daher vom Modell ab und ist kein Verfehlen einer Vorgabe. In unserem Benchmark gaben gehostete Modelle sieben bis zwölf Labels pro Bild von sich aus zurück, Modelle mit 8 GB VRAM ein bis vier — beim selben Prompt.

    Du *kannst* eine Anzahl anfordern — siehe das [Qwen3-VL Label‑Beispiel](#qwen3-vl-labels) weiter unten —, aber betrachte das als Feineinstellung pro Modell, die du überprüfst, nicht als Behebung eines Mangels. Sie verdoppelt die Label‑Latenz ungefähr und erhöht den Anteil mehrteiliger Namen bei jedem Modell, das nicht ohnehin bei null lag. Ob diese verloren gehen, hängt vom [Normalisierungs-Modus](#label-name-normalization) des Modells ab.

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

- **Model:** [`qwen3-vl:4b-instruct`](https://ollama.com/library/qwen3-vl/tags) ist eine leichtere Qwen3‑VL‑Variante. Alternativ kannst du [`huihui_ai/qwen3-vl-abliterated:4b-instruct`](https://ollama.com/huihui_ai/qwen3-vl-abliterated), [`qwen3-vl:latest`](https://ollama.com/library/qwen3-vl) oder andere [Varianten](https://ollama.com/search?c=vision&q=qwen3-vl) ausprobieren.
- **Engine:** Wendet sinnvolle Standardwerte für **Resolution**, **Format** und **Options** an.
- **Run:** `on-demand` erlaubt manuelle Läufe, Ausführungen durch den Metadata‑Worker und geplante Jobs ￫ [Run Modes](index.md#run-modes).
- **Prompt:** Begrenzte Latenz, keine Wiederholungen und klare Kontrolle über Art und Anzahl der zurückgegebenen Labels. Für andere Sprachen siehe [Sprachunterstützung](#language-support).
- **`Return AT MOST 3 labels`:** Eine bewusste Obergrenze und der Grund, warum die strikten Options nicht aus dem Ruder laufen. Sie ist zugleich restriktiv: In unserem Benchmark lieferte `qwen3-vl:4b-instruct` mit diesem Prompt rund drei Labels pro Bild, mit einer Vorgabe von 8–15 dagegen rund zehn, wobei die Motiv‑Abdeckung von 75 % auf 97 % stieg. Wenn du reichhaltigere Labels möchtest, erhöhe die Obergrenze — und rechne mit etwa der zwei‑ bis dreifachen Latenz. Den Zuwachs bei der Abdeckung solltest du dabei einordnen: Sie misst die Trefferquote, belohnt also das Benennen des erwarteten Motivs und erkennt kein zusätzliches, falsches Label. Ein Modell, das um mehr Labels gebeten wird, schneidet teilweise allein durch Raten besser ab.
- **`single-word noun in canonical singular form`:** Behalte diese Anweisung bei, sofern du nicht zusätzlich `Normalize: phrase` setzt. Mit der Standard-Normalisierung für selbst gehostete Modelle wird ein zusammengesetzter Name auf ein einzelnes Token reduziert — meist das falsche: `ferris wheel` wird als *Ferris* gespeichert, `amusement park` als *Park*. Siehe [Normalisierung der Label‑Namen](#label-name-normalization).
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

- **Model:** Die Verwendung von [`qwen3-vl:4b-instruct`](https://ollama.com/library/qwen3-vl/tags) für Labels und Captions vermeidet zeitaufwändige Modellwechsel in Ollama. Alternativ kannst du [`huihui_ai/qwen3-vl-abliterated:4b-instruct`](https://ollama.com/huihui_ai/qwen3-vl-abliterated), [`qwen3-vl:latest`](https://ollama.com/library/qwen3-vl) oder andere [Varianten](https://ollama.com/search?c=vision&q=qwen3-vl) testen.
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

[^1]: Verfügbar ab dem nächsten Preview-Build und dem darauf folgenden stabilen Release. Frühere Versionen reduzieren einen Label‑Namen immer auf ein einzelnes Token und ignorieren diese Eigenschaft.
