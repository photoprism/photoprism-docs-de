# Backup Erstellen

Ein Backup von PhotoPrism sollte mindestens die Dateien in [deinem *originals* Ordner](https://docs.photoprism.app/getting-started/docker-compose/#photoprismoriginals) und eine Kopie der Indexdatenbank enthalten. Wir empfehlen außerdem, eine Sicherungskopie des [*storage* Ordners](https://docs.photoprism.app/getting-started/docker-compose/#photoprismstorage) zu erstellen, damit du keine Thumbnail- oder Sidecar-Dateien neu erstellen musst und deine Sicherungskopie die komplette Konfiguration enthält.

## Automatische Backups

Standardmäßig erstellt PhotoPrism ab Version [PhotoPrism 240523-923ee0cf7](https://docs.photoprism.app/release-notes/#may-23-2024) automatisch tägliche Datenbanksicherungen für dich, wobei bis zu 3 Backups aufbewahrt werden. Der Zeitplan, die Art der Backups und die Anzahl der aufzubewahrenden Backups können in der [Konfiguration geändert werden](https://docs.photoprism.app/getting-started/config-options/#backup).

## Backup Command
Du kannst folgenden Befehl in einem Terminal ausführen, um ein Datenbank-Backup von MariaDB oder Sqlite zu erstellen:

```
docker compose exec photoprism photoprism backup -i -f
```

Wenn du Podman auf einer Red Hat-kompatiblen Linux-Distribution verwendest:

```
podman-compose exec photoprism photoprism backup -i -f
```

Standardmäßig wird ein Backup in `storage/backup/mysql/[JJJJ-MM-TT].sql` erstellt. Ein benutzerdefinierter Backup-Basis-Ordner kann mit [`PHOTOPRISM_BACKUP_PATH`](https://docs.photoprism.app/getting-started/config-options/#storage) konfiguriert werden.

Lass das `-f` Flag weg, wenn du keine bestehenden Dateien überschreiben willst. Du kannst auch einen eigenen Dateinamen als Argument angeben (oder `-`, um den SQL-Dump nach [stdout](https://docs.photoprism.app/getting-started/advanced/backups/) zu schreiben):

```
docker compose exec photoprism photoprism backup -i [filename]
```

Alternative Möglichkeiten zur Erstellung von SQL-Dumps aus SQLite findest du in unserer [erweiterten Backup-Anleitung](https://docs.photoprism.app/getting-started/advanced/backups).

!!! tldr ""
    Beachte, dass unsere Anleitungen jetzt standardmäßig den neuen Befehl `docker compose` verwenden. Wenn dein Server diesen Befehl noch nicht unterstützt, kannst du trotzdem `docker-compose` verwenden.

## Wichtige Ordner

### Originals

Der Ordner [*originals*](https://docs.photoprism.app/getting-started/docker-compose/#photoprismoriginals) enthält deine originalen Foto- und Videodateien. Du kannst diesen Ordner mit einem Standard-Dateisicherungsprogramm sichern und wiederherstellen, wenn du das noch nicht eingerichtet hast.

### Storage

SQLite-, Config-, Cache-, Thumbnail- und Sidecar-Dateien werden im Ordner [*storage*](https://docs.photoprism.app/getting-started/docker-compose/#photoprismstorage) gespeichert. Wie beim *originals* Ordner hängt der genaue Pfad auf deinem Computer [von deiner Konfiguration ab](https://docs.photoprism.app/getting-started/config-options/#storage).

Wir empfehlen dir, auch diesen Ordner zu sichern, damit du die Vorschaubilder nicht neu erstellen musst und eine vollständige Sicherung deiner Konfiguration hast. Dafür kannst du ein beliebiges Standardprogramm zur Dateisicherung verwenden.

!!! example ""
    Abhängig von den [uns zur Verfügung stehenden Ressourcen](https://www.photoprism.app/oss/faq) kann eine zukünftige Version zusätzliche Funktionen enthalten, damit du nicht mehr auf externe Tools angewiesen bist, um Dateisicherungen durchzuführen, sondern ein Webinterface nutzen kannst.