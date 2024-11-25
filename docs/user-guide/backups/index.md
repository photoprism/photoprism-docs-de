# Backup Erstellen

Ein Backup von PhotoPrism sollte mindestens die Dateien in [deinem *originals* Ordner](https://docs.photoprism.app/getting-started/docker-compose/#photoprismoriginals) und eine Kopie der Indexdatenbank enthalten. Wir empfehlen außerdem, eine Sicherungskopie des [*storage* Ordners](https://docs.photoprism.app/getting-started/docker-compose/#photoprismstorage) zu erstellen, damit du keine Thumbnail- oder Sidecar-Dateien neu erstellen musst und deine Sicherungskopie die komplette Konfiguration enthält.

!!! tldr ""
    Der einfachste Weg, ein vollständiges Backup zu erstellen, besteht darin, zunächst den Backup-Befehl auszuführen, um einen Datenbank-Dump zu erstellen, wie unten beschrieben.
    Erstelle dann ein Backup deiner „*originals*“- und „*storage*“-Ordner mit einem beliebigen handelsüblichen Dateibackup-Programm.

## Automatische Backups

Standardmäßig erstellt PhotoPrism ab Version [PhotoPrism 240523-923ee0cf7](https://docs.photoprism.app/release-notes/#may-23-2024) automatisch tägliche Datenbanksicherungen für dich, wobei bis zu 3 Backups aufbewahrt werden. Der Zeitplan, die Art der Backups und die Anzahl der aufzubewahrenden Backups können in der [Konfiguration geändert werden](https://docs.photoprism.app/getting-started/config-options/#backup).

Wir empfehlen, dass du manuell eine vollständige Sicherung aller Dateien erstellst, einschließlich deiner Konfiguration und Indexdatenbank, bevor du eine [Servermigration](#mariadb-server-migration) startest oder andere größere Änderungen vornimmst.

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

[Erfahre mehr ›](folders.md#originals)

### Storage

SQLite-, Config-, Cache-, Thumbnail- und Sidecar-Dateien werden im Ordner [*storage*](https://docs.photoprism.app/getting-started/docker-compose/#photoprismstorage) gespeichert. Wie beim *originals* Ordner hängt der genaue Pfad auf deinem Computer [von deiner Konfiguration ab](https://docs.photoprism.app/getting-started/config-options/#storage).

Wir empfehlen dir, auch diesen Ordner zu sichern, damit du die Vorschaubilder nicht neu erstellen musst und eine vollständige Sicherung deiner Konfiguration hast. Dafür kannst du ein beliebiges Standardprogramm zur Dateisicherung verwenden.

[Erfahre mehr ›](folders.md#storage)

### Database
Wenn du [MariaDB](https://docs.photoprism.app/getting-started/troubleshooting/mariadb) oder [einen anderen dedizierten Datenbankserver](https://docs.photoprism.app/getting-started/faq/#should-i-use-sqlite-mariadb-or-mysql) anstelle von [SQLite](https://docs.photoprism.app/getting-started/troubleshooting/sqlite) verwendest, werden die Daten in einem separaten *Datenbank*-Ordner gespeichert, dessen Speicherort von [deiner Konfiguration abhängt](https://docs.photoprism.app/getting-started/docker-compose/#database).

## MariaDB Server Migration

Detaillierte Informationen darüber, wie du deine [MariaDB-Datenbank](#database) auf einen anderen Server oder eine andere virtuelle Maschine verschieben kannst, findest du im Abschnitt [Server-Migration](https://docs.photoprism.app/getting-started/troubleshooting/mariadb/#server-migration) in unserem [MariaDB-Fehlerbehebungsleitfaden](https://docs.photoprism.app/getting-started/troubleshooting/mariadb.md).

[Erfahre mehr ›](https://docs.photoprism.app/getting-started/troubleshooting/mariadb/#server-migration)
