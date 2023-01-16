# Backup Erstellen

Ein Backup von PhotoPrism sollte mindestens die Dateien in [deinem *originals* Ordner](https://docs.photoprism.app/getting-started/docker-compose/#photoprismoriginals) und eine Kopie der Indexdatenbank enthalten. Wir empfehlen außerdem, eine Sicherungskopie des [*storage* Ordners](https://docs.photoprism.app/getting-started/docker-compose/#photoprismstorage) zu erstellen, damit du keine Thumbnail- oder Sidecar-Dateien neu erstellen musst und deine Sicherungskopie die komplette Konfiguration enthält.

=== "MariaDB"

    1. Der einfachste Weg, ein vollständiges Backup zu erstellen, ist, zuerst den Backup-Befehl auszuführen, um einen MariaDB-Datenbank-Dump zu erzeugen (siehe unten).
    2. Dann sichere die Ordner *originals* und *storage* mit einem normalen Datensicherungsprogramm.

=== "SQLite"

    Ein vollständiges Backup beider Ordner ist obligatorisch, aber es ist nicht notwendig, zuerst [einen Dump zu erstellen](https://docs.photoprism.app/getting-started/advanced/backups/#sqlite-backups), da sich bereits eine Kopie der Indexdatenbank im Ordner *storage* befindet.

## Backup Command

Der einfachste Weg, einen Index-SQL-Dump von MariaDB zu erstellen, ist, den Backup-Befehl in einem Terminal auszuführen:

```
docker compose exec photoprism photoprism backup -i -f
```

Wenn du Podman auf einer Red Hat-kompatiblen Linux-Distribution verwendest:

```
podman-compose exec photoprism photoprism backup -i -f
```

Standardmäßig wird ein Backup in `storage/backup/mysql/[JJJJ-MM-TT].sql` erstellt. Ein eigener Backup-Ordner kann mit [`PHOTOPRISM_BACKUP_PATH`](https://docs.photoprism.app/getting-started/config-options/#storage) konfiguriert werden.

Lass das `-f` Flag weg, wenn du keine bestehenden Dateien überschreiben willst. Du kannst auch einen eigenen Dateinamen als Argument angeben (oder `-`, um den SQL-Dump nach [stdout](https://docs.photoprism.app/getting-started/advanced/backups/) zu schreiben):

```
docker compose exec photoprism photoprism backup -i [filename]
```

Wie du SQL-Dumps von SQLite erstellst, erfährst du in unserer [erweiterten Backup-Anleitung](https://docs.photoprism.app/getting-started/advanced/backups).

!!! tldr ""
    Beachte, dass unsere Anleitungen jetzt standardmäßig den neuen Befehl `docker compose` verwenden. Wenn dein Server diesen Befehl noch nicht unterstützt, kannst du trotzdem `docker-compose` verwenden.

## Wichtige Ordner

### Originals

Der Ordner [*originals*](https://docs.photoprism.app/getting-started/docker-compose/#photoprismoriginals) enthält deine originalen Foto- und Videodateien. Du kannst diesen Ordner mit einem Standard-Dateisicherungsprogramm sichern und wiederherstellen, wenn du das noch nicht eingerichtet hast.

### Storage

SQLite-, Config-, Cache-, Thumbnail- und Sidecar-Dateien werden im Ordner [*storage*](https://docs.photoprism.app/getting-started/docker-compose/#photoprismstorage) gespeichert. Wie beim *originals* Ordner hängt der genaue Pfad auf deinem Computer [von deiner Konfiguration ab](https://docs.photoprism.app/getting-started/config-options/#storage).

Wir empfehlen dir, auch diesen Ordner zu sichern, damit du die Vorschaubilder nicht neu erstellen musst und eine vollständige Sicherung deiner Konfiguration hast. Dafür kannst du ein beliebiges Standardprogramm zur Dateisicherung verwenden.

!!! example ""
    Abhängig von den [uns zur Verfügung stehenden Ressourcen](https://photoprism.app/kb/oss) kann eine zukünftige Version zusätzliche Funktionen enthalten, damit du nicht mehr auf externe Tools angewiesen bist, um Dateisicherungen durchzuführen, sondern ein Webinterface nutzen kannst.