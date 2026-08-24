# Gesichtserkennung (Technische Details) #

PhotoPrism verwendet eine mehrstufige KI‑Pipeline, um Gesichter zu erkennen, Embeddings zu erzeugen und ähnliche Gesichter zu Clustern zusammenzufassen, damit sie später [einfach nach Personen organisiert werden können](../organize/people.md):

1. **Detection** – ein Erkennungsmodell findet Gesichter in den Bildern.
2. **Embedding** – für jedes erkannte Gesicht wird ein Embedding erzeugt.
3. **Clustering** – ähnliche Gesichter werden gruppiert, sodass sie einer Person zugeordnet werden können.

Detection und Embedding verwenden getrennte Modelle, die unabhängig voneinander gewählt und aktualisiert werden können.

## Detection

PhotoPrism liefert **YuNet** mit, ein kompaktes Erkennungsmodell, das auf der [ONNX Runtime](https://onnxruntime.ai/) läuft. Es:

- erkennt teilweise verdeckte Gesichter (z.B. durch Hände oder Objekte)
- funktioniert gut bei schrägen oder außerhalb der Achse aufgenommenen Gesichtern
- kommt gut mit schwierigen Lichtverhältnissen zurecht
- bestimmt Gesichtsmerkmale (Landmarks), mit denen jedes Gesicht vor dem Embedding ausgerichtet wird
- verwendet 720 px‑Thumbnails als Eingabe (Modell‑Input 640 px)
- führt Berechnungen über die Meta/Vision‑Worker aus

Das Erkennungsmodell wird über `FACE_DETECTOR` ausgewählt. Wenn du die Variable nicht setzt, wird es vom verwendeten Gesichtsmodell abgeleitet, sodass standardmäßig eine zueinander passende Kombination läuft. Der vorgebaute Runtime‑Build zielt auf glibc ≥ 2.27 auf x86_64‑ und arm64‑Systemen.

!!! info ""
    `FACE_ENGINE` ist **veraltet**: Die Variable hat eine Runtime ausgewählt und kein Modell. Nur `FACE_ENGINE=none` hat noch eine Wirkung, und `FACE_DETECTOR` hat Vorrang. Bestehende Konfigurationen funktionieren weiterhin.

### Kleine Gesichter auf Gruppenfotos

`FACE_SIZE` bezieht sich auf das 720 px‑Thumbnail, das für die Erkennung verwendet wird, nicht auf das Originalbild. Auf einem Foto mit vielen Personen kann dadurch jedes Gesicht unter die Mindestgröße fallen. PhotoPrism führt deshalb automatisch einen zweiten Durchlauf mit kleinerer Mindestgröße aus, wenn in einem Bild sonst gar kein Gesicht gefunden würde. Mit `FACE_SIZE_RETRY` auf `-1` schaltest du das ab.

## Face‑Embeddings

Nach der Erkennung erzeugt PhotoPrism für jedes Gesicht ein Embedding. Diese Embeddings werden genutzt, um:

1. **Gesichter über verschiedene Bilder hinweg zu matchen**,
2. **ähnliche Gesichter per DBSCAN‑Algorithmus zu Clustern zu gruppieren** und
3. **Gesichter Personen zuzuordnen**, nachdem du sie bestätigt hast.

Neue Bibliotheken verwenden **SFace** und damit 128‑dimensionale Vektoren. Bibliotheken, die vor dessen Einführung angelegt wurden, behalten **FaceNet** mit 512‑dimensionalen Vektoren: Ein Wechsel würde alle bereits zugeordneten Gesichter mit neu indexierten unvergleichbar machen. Einen Überblick über die verfügbaren [Modell‑Engines](index.md#modell-engines) findest du auf der Übersichtsseite.

`FACE_MODEL` ändert das Modell einer Bibliothek nicht, die bereits eines hat. Dafür gibt es `photoprism faces migrate`: Der Befehl erzeugt alle Embeddings neu und behält deine Personenzuordnungen. Siehe [CLI‑Referenz](#cli-referenz) weiter unten.

Alle Face‑Embeddings werden auf Einheitslänge L2‑normalisiert (‖x‖₂ = 1):

- beim Erzeugen (nach dem Modell‑Lauf)
- bei der Berechnung von Mittelwerten beim Mergen von Clustern
- beim Laden aus der Datenbank

So werden euklidische Distanzen äquivalent zur Cosine‑Similarity ausgewertet.

## Config‑Optionen

!!! example ""
    Wir empfehlen, diese Parameter nur zu ändern, wenn du dich mit den technischen Details gut auskennst oder PhotoPrism entwickelst.

### Detection Settings

| Umgebungsvariable          | CLI-Flag          | Standard                 | Beschreibung                                                           |
|----------------------------|-------------------|--------------------------|------------------------------------------------------------------------|
| PHOTOPRISM_FACE_DETECTOR   | --face-detector   | *(vom Gesichtsmodell)*   | Erkennungsmodell (`auto`, `none`, `yunet`)                             |
| PHOTOPRISM_FACE_MODEL      | --face-model      | *(einmalig ermittelt)*   | Embedding‑Modell (`detect`, `none`, `facenet`, `sface`, `auraface`)    |
| PHOTOPRISM_FACE_SIZE       | --face-size       | 25                       | Minimale Größe von Gesichtern in `PIXELN` (10–10000)                   |
| PHOTOPRISM_FACE_SIZE_RETRY | --face-size-retry | 10                       | Minimale Größe in `PIXELN` für den zweiten Durchlauf, `-1` deaktiviert |
| PHOTOPRISM_FACE_SCORE      | --face-score      | *(vom Erkennungsmodell)* | Minimaler Gesichts-`QUALITÄTS`-Score (1–100)                           |
| PHOTOPRISM_FACE_OVERLAP    | --face-overlap    | 42                       | Schwellwert für Gesichtsüberlappung in `PROZENT` (1–100)               |

### Clustering Settings

!!! danger ""
    Nach Änderungen an diesen Parametern solltest du im Terminal den Befehl `photoprism faces reset` ausführen, um vorhandene Cluster und Zuordnungen zu löschen. Andernfalls können Inkonsistenzen zu unerwartetem Verhalten oder Fehlern führen.

| Umgebungsvariable             | CLI-Flag             | Standard                 | Beschreibung                                                             |
|-------------------------------|----------------------|--------------------------|--------------------------------------------------------------------------|
| PHOTOPRISM_FACE_CLUSTER_SIZE  | --face-cluster-size  | 60                       | Minimale Größe automatisch geclusterter Gesichter in `PIXELN` (20–10000) |
| PHOTOPRISM_FACE_CLUSTER_SCORE | --face-cluster-score | *(vom Erkennungsmodell)* | Minimaler `QUALITÄTS`-Score automatisch geclusterter Gesichter (1–100)   |
| PHOTOPRISM_FACE_CLUSTER_CORE  | --face-cluster-core  | 4                        | `ANZAHL` der Gesichter, die einen Cluster-Kern bilden (1–100)            |
| PHOTOPRISM_FACE_CLUSTER_DIST  | --face-cluster-dist  | *(vom Modell)*           | Ähnlichkeits-`DISTANZ` von Gesichtern, die einen Cluster-Kern bilden     |
| PHOTOPRISM_FACE_MATCH_DIST    | --face-match-dist    | *(vom Modell)*           | Ähnlichkeits-`OFFSET` zum Abgleich mit bestehenden Clustern              |

Die Distanz‑Schwellwerte sind für jedes Embedding‑Modell einzeln kalibriert und werden automatisch daraus abgeleitet, denn die Modelle teilen sich keinen gemeinsamen Vektorraum: Ein Abstand, der unter einem Modell zwei Personen trennt, kann sie unter einem anderen zusammenführen.

### Tuning‑Tipps

- Ändere einen Distanz‑Schwellwert **relativ zu dem Wert, den dein Modell verwendet**, statt eine Zahl von einem anderen Modell zu übernehmen. Höhere Werte sind aggressiver und führen zu größeren Clustern mit mehr False Positives.
- Wenn du kleinere Cluster bevorzugst, kannst du den Kernel auf 3 oder 2 ähnliche Gesichter reduzieren.
- Lass `FACE_DETECTOR` ungesetzt, sofern du keinen Grund hast, es festzulegen – so bleibt die Erkennung zum Embedding‑Modell passend.

## CLI‑Referenz { #cli-referenz }

- `photoprism faces config` — zeigt, welche Optionen tatsächlich wirksam sind, einschließlich der vom Erkennungs‑ oder Embedding‑Modell abgeleiteten.
- `photoprism faces stats` — zeigt Statistiken und Informationen zum verwendeten Modell.
- `photoprism faces audit [--subject UID] [--fix]` — prüft und repariert Gesichts‑Daten bei Bedarf.
- `photoprism faces reset [--detector auto|none|yunet] [--force]` — löscht Personen und Marker und baut sie mit dem gewählten Erkennungsmodell neu auf.
- `photoprism faces index` — (re)erkennt Gesichter in den Originalen.
- `photoprism faces update [--force]` — clustert und matched erkannte Gesichter.
- `photoprism faces optimize` — räumt Cluster nach Updates auf.
- `photoprism faces migrate [--to MODELL] [--dry-run]` — erzeugt alle Embeddings mit einem anderen Modell neu. **Stoppe vorher den Server.**

### Das Gesichtsmodell wechseln

`photoprism faces migrate` ist der Weg, das Embedding‑Modell zu wechseln. Der Befehl erzeugt alle Embeddings neu, behält die bereits identifizierten Personen und hinterlegt das neue Modell als das verwendete. Führe ihn zuerst mit `--dry-run` aus, um den Umfang zu sehen:

```bash
photoprism faces migrate --to sface --dry-run
```

!!! danger ""
    Stoppe den Server, bevor du migrierst. Die Migration ersetzt alle Gesichts‑Cluster in einer einzigen Transaktion und kann nicht berücksichtigen, was eine laufende Instanz zeitgleich in dieselben Datensätze schreibt.

### Versions‑Upgrade

Um von den [Verbesserungen bei der Gesichtserkennung](https://github.com/photoprism/photoprism/issues/5167) zu profitieren, empfehlen wir, zunächst `photoprism faces audit --fix` und `photoprism faces index` [im Terminal](https://docs.photoprism.app/getting-started/docker-compose/#opening-a-terminal) auszuführen, bevor zusätzliche Gesichter erkannt und gematched werden:

```bash
photoprism faces audit --fix # resolve inconsistencies
photoprism faces index       # detect new faces
photoprism faces update      # cluster and match
photoprism faces optimize    # optional tidy-up
```

Wenn du alle Gesichter für einen sauberen Stand neu erkennen lassen möchtest, kannst du dafür `photoprism faces reset -f` und anschließend `photoprism faces index` ausführen. Danach müssen alle erkannten Gesichter neu zugeordnet werden.

!!! note ""
    Ein [vollständiger Rescan](../library/originals.md#index-vollstandig-aktualisieren) erkennt ebenfalls zusätzliche Gesichter, dauert aber länger, da mehr Indexierungsaufgaben ausgeführt werden.
