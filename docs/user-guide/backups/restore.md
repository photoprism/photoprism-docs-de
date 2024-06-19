# Wiederherstellung anhand eines Backups

Um deine Instanz wiederherzustellen, brauchst du die Dateien in [deinem *originals* Ordner](https://docs.photoprism.app/getting-started/docker-compose/#photoprismoriginals) und eine Kopie der Index-Datenbank. Wir empfehlen außerdem, [eine Sicherungskopie](./index.md) des Ordners [*storage*](https://docs.photoprism.app/getting-started/docker-compose/#photoprismstorage) anzulegen, damit du keine Thumbnail- oder Sidecar-Dateien neu erstellen musst und deine Sicherungskopie die komplette Konfiguration enthält:

- Wenn du eine Sicherungskopie deiner Ordner *storage* und *originals* hast, ist es am einfachsten, zuerst diese Ordner wiederherzustellen und dann den Befehl restore auszuführen, falls du MariaDB verwendest
- Andernfalls musst du zusätzlich einen [kompletten Rescan deiner Bibliothek](../../user-guide/library/indexing.md) durchführen, um fehlende Sidecar- und Thumbnail-Dateien wiederherzustellen
- Einige der Metadaten und deine Alben können auch [aus YAML-Sidecar-Dateien](export.md) wiederhergestellt werden, selbst wenn du keine Kopie der Indexdatenbank hast, es sei denn, du hast [diese Funktion deaktiviert](https://docs.photoprism.app/getting-started/config-options/#feature-flags)

## Restore Command

Um den Index aus einem bestehenden MariaDB-Dump wiederherzustellen, kannst du den folgenden Befehl ausführen:
```
docker compose exec photoprism photoprism restore -i -f
```

Wenn du Podman auf einer Red Hat-kompatiblen Linux-Distribution verwendest:

```
podman-compose exec photoprism photoprism restore -i -f
```

Dadurch wird der Backup-Ordner automatisch nach dem neuesten Index-Dump durchsucht und dieser wiederhergestellt. Ein benutzerdefinierter Backup-Basis-Ordner kann mit [`PHOTOPRISM_BACKUP_PATH`](https://docs.photoprism.app/getting-started/config-options/#storage) konfiguriert werden.

Lass das `-f`-Flag weg, um das Überschreiben eines bestehenden Index zu verhindern. Wie beim Backup-Befehl kannst du auch einen bestimmten Dateinamen für den Dump als Argument angeben:

```
docker compose exec photoprism photoprism restore -i [filename]
```

Wenn die Datenbank wiederhergestellt wird, werden auch alle Benutzerkonten und Passwörter wiederhergestellt. Wenn du dein Passwort geändert hast, musst du dich also mit dem alten Passwort anmelden.

!!! tldr ""
    Beachte, dass unsere Anleitungen jetzt standardmäßig den neuen Befehl `docker compose` verwenden. Wenn dein Server diesen Befehl noch nicht unterstützt, kannst du trotzdem `docker-compose` verwenden.
