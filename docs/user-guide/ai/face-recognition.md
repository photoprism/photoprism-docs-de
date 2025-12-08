# Gesichtserkennung (Technische Details) #

PhotoPrism verwendet eine mehrstufige KI‑Pipeline, um Gesichter zu erkennen, Embeddings zu erzeugen und ähnliche Gesichter zu Clustern zusammenzufassen, damit sie später [einfach nach Personen organisiert werden können](https://docs.photoprism.app/user-guide/organize/people/):

1. **Detection** – die Engines *Pigo* oder *ONNX SCRFD* erkennen Gesichter in Bildern.
2. **Embedding** – 512‑dimensionale Vektoren beschreiben jedes erkannte Gesicht.
3. **Clustering** – ähnliche Gesichter werden gruppiert, sodass sie einer Person zugeordnet werden können.

## Detection‑Engines

Du kannst zwischen zwei Erkennungs‑Engines wählen, die unterschiedliche Eigenschaften haben:

### Pigo

[Pigo](https://github.com/esimov/pigo) ist ein schneller, rein CPU‑basierter Cascade‑Classifier, der auf [Pixel‑Intensitätsvergleichen](https://dl.photoprism.app/pdf/publications/20140820-Pixel_Intensity_Comparisons.pdf) basiert. Er liefert eine gute Performance in einfachen Szenarien und entspricht dem klassischen Erkennungsverhalten älterer PhotoPrism‑Versionen.

**Geeignet für:**

- Schnelle Verarbeitung gut ausgeleuchteter Porträts mit frontaler Ansicht
- Geringen Ressourcenverbrauch auf kleinen Geräten

### ONNX SCRFD 0.5g

Ein [CNN‑Modell](https://dl.photoprism.app/onnx/models/) auf Basis von [ONNX Runtime](https://onnxruntime.ai/), das bei schwierigen Gesichtern eine **höhere Trefferquote** bietet. Diese Engine:

- erkennt teilweise verdeckte Gesichter (z.B. durch Hände oder Objekte)
- funktioniert besser bei schrägen oder außerhalb der Achse aufgenommenen Gesichtern
- kommt besser mit schwierigen Lichtverhältnissen zurecht
- verwendet 720 px‑Thumbnails als Eingabe (Modell‑Input 640 px)
- führt Berechnungen über die Meta/Vision‑Worker aus
- nutzt standardmäßig die Hälfte der verfügbaren CPU‑Kerne (mindestens 1 Thread)

Die ONNX‑Engine wird automatisch aktiviert, wenn `FACE_ENGINE=auto` gesetzt ist und das mitgelieferte SCRFD‑Modell verfügbar ist. Der vorgebaute Runtime‑Build zielt auf glibc ≥ 2.27 auf x86_64‑ und arm64‑Systemen.

**Geeignet für:**

- Maximale Erkennungsgenauigkeit
- Fotos mit schwierigen Winkeln oder Beleuchtung
- Gruppenfotos mit teilweise verdeckten Gesichtern

## Face‑Embeddings

### FaceNet

Nach der Erkennung verwendet PhotoPrism [TensorFlow](index.md#modell-engines), um [FaceNet](https://en.wikipedia.org/wiki/FaceNet) auszuführen, das 512‑dimensionale Embedding‑Vektoren für jedes Gesicht erzeugt. Diese Vektoren werden genutzt, um:

1. **Gesichter über verschiedene Bilder hinweg zu matchen**,
2. **ähnliche Gesichter per DBSCAN‑Algorithmus zu Clustern zu gruppieren** und
3. **Gesichter Personen zuzuordnen**, nachdem du sie bestätigt hast.

Alle Face‑Embeddings werden auf Einheitslänge L2‑normalisiert (‖x‖₂ = 1):

- beim Erzeugen (nach dem TensorFlow‑Lauf)
- bei der Berechnung von Mittelwerten beim Mergen von Clustern
- beim Laden aus der Datenbank

So werden euklidische Distanzen äquivalent zur Cosine‑Similarity ausgewertet, wie es in der FaceNet‑Forschung üblich ist.

## Config‑Optionen

!!! example ""
    Wir empfehlen, diese Parameter nur zu ändern, wenn du dich mit den technischen Details gut auskennst oder PhotoPrism entwickelst.

### Detection Settings

| Umgebungsvariable              | CLI-Flag              | Standard                | Beschreibung                                                               |
|--------------------------------|-----------------------|-------------------------|----------------------------------------------------------------------------|
| PHOTOPRISM_FACE_ENGINE         | --face-engine         | auto                    | Erkennungs-Engine (`auto`, `pigo`, `onnx`). `auto` nutzt ONNX wenn verfügbar |
| PHOTOPRISM_FACE_ENGINE_THREADS | --face-engine-threads | runtime.NumCPU()/2 (≥1) | Anzahl der ONNX-Inference-Threads; von Pigo ignoriert                      |
| PHOTOPRISM_FACE_ANGLE          | --face-angle          | -0.3,0,0.3              | Erkennungswinkel in Radiant für Pigo Multi-Angle-Scanning                  |
| PHOTOPRISM_FACE_SIZE           | --face-size           | 50                      | Minimale Größe von Gesichtern in `PIXELN` (20–10000)                       |
| PHOTOPRISM_FACE_SCORE          | --face-score          | 9.0                     | Minimaler Gesichts-`QUALITÄTS`-Score (1–100)                               |
| PHOTOPRISM_FACE_OVERLAP        | --face-overlap        | 42                      | Schwellwert für Gesichtsüberlappung in `PROZENT` (1–100)                   |

### Clustering Settings

!!! danger ""
    Nach Änderungen an diesen Parametern solltest du im Terminal den Befehl `photoprism faces reset` ausführen, um vorhandene Cluster und Zuordnungen zu löschen. Andernfalls können Inkonsistenzen zu unerwartetem Verhalten oder Fehlern führen.

| Umgebungsvariable              | CLI-Flag               | Standard | Beschreibung                                                                           |
|--------------------------------|------------------------|----------|----------------------------------------------------------------------------------------|
| PHOTOPRISM_FACE_CLUSTER_SIZE   | --face-cluster-size    | 80       | Minimale Größe automatisch geclusterter Gesichter in `PIXELN` (20–10000)               |
| PHOTOPRISM_FACE_CLUSTER_SCORE  | --face-cluster-score   | 15       | Minimaler `QUALITÄTS`-Score automatisch geclusterter Gesichter (1–100)                 |
| PHOTOPRISM_FACE_CLUSTER_CORE   | --face-cluster-core    | 4        | `ANZAHL` der Gesichter, die einen Cluster-Kern bilden (1–100)                          |
| PHOTOPRISM_FACE_CLUSTER_DIST   | --face-cluster-dist    | 0.64     | Ähnlichkeits-`DISTANZ` von Gesichtern, die einen Cluster-Kern bilden (0.1–1.5)         |
| PHOTOPRISM_FACE_MATCH_DIST     | --face-match-dist      | 0.46     | Ähnlichkeits-`OFFSET` zum Abgleich von Gesichtern mit bestehenden Clustern (0.1–1.5)   |

### Tuning‑Tipps

- Ein sinnvoller Bereich für die Distanz zwischen Face‑Embeddings liegt zwischen 0,60 und 0,70. Höhere Werte sind aggressiver und führen zu größeren Clustern mit mehr False Positives.
- Wenn du kleinere Cluster bevorzugst, kannst du den Kernel auf 3 oder 2 ähnliche Gesichter reduzieren.
- Die ONNX‑Engine liefert in schwierigen Situationen (Winkel, Verdeckungen, Licht) in der Regel bessere Ergebnisse als Pigo.
- Setze `FACE_ENGINE=auto`, um automatisch die bestmögliche verfügbare Engine zu wählen.

## CLI‑Referenz

- `photoprism faces stats` — zeigt Statistiken und Informationen zur verwendeten Engine.
- `photoprism faces audit [--subject UID] [--fix]` — prüft und repariert Gesichts‑Daten bei Bedarf.
- `photoprism faces reset [--engine auto|pigo|onnx] [--force]` — löscht Personen und Marker und baut sie mit der gewählten Engine neu auf.
- `photoprism faces index` — (re)erkennt Gesichter in den Originalen.
- `photoprism faces update [--force]` — clustert und matched erkannte Gesichter.
- `photoprism faces optimize` — räumt Cluster nach Updates auf.

### Versions‑Upgrade

Um von den [Verbesserungen bei der Gesichtserkennung](https://github.com/photoprism/photoprism/issues/5167) zu profitieren, empfehlen wir, zunächst `photoprism faces audit --fix` und `photoprism faces index` [im Terminal](https://docs.photoprism.app/getting-started/docker-compose/#opening-a-terminal) auszuführen, bevor zusätzliche Gesichter erkannt und gematched werden:

```bash
photoprism faces audit --fix # resolve inconsistencies
photoprism faces index       # detect new faces
photoprism faces update      # cluster and match
photoprism faces optimize    # optional tidy-up
```

!!! note ""
    Ein [vollständiger Rescan](https://docs.photoprism.app/user-guide/library/originals/#when-should-complete-rescan-be-selected) erkennt ebenfalls zusätzliche Gesichter, dauert aber länger, da mehr Indexierungsaufgaben ausgeführt werden.


