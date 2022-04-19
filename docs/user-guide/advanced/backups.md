# Backup Erstellen

Ein komplettes Backup deiner PhotoPrism-Instanz umfasst:

1. Alle Inhalte aus dem "Originals"-Ordner
2. Ein SQL-Dump der Datenbank

Um einen SQL Dump der Datenbank zu erstellen führe folgenden Befehl im Terminal aus:

```
photoprism backup -i [filename]
```

Oder für [docker-compose](https://docs.photoprism.app/getting-started/docker-compose/):

```
docker-compose exec -T photoprism photoprism backup -i - > photoprism-db.sql
```

Wie oben zu sehen, kann man `-` als Dateinamen verwenden, um das Datenbank-Backup nach stdout zu schreiben.
Damit wird sichergestellt, dass die Backup-Datei außerhalb der Containerumgebung gespeichert wird.

Wenn Sie den Dateinamen leer lassen, wird die Backup-Datei in den Standard-Backup-Ordner geschrieben, der über [`PHOTOPRISM_BACKUP_PATH`](https://docs.photoprism.app/getting-started/config-options/#storage-folders) konfiguriert ist.

Optional, können auch die [Cache und Thumbnail Ordner](./folders.md)  gesichert werden, dies spart Zeit bei der Wiederherstellung, da nicht alle Thumbnails neu generiert werden müssen.
