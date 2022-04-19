# Wiederherstellung anhand eines Backups

Ein komplettes Backup deiner PhotoPrism-Instanz umfasst:

1. Alle Inhalte aus dem "Originals"-Ordner
2. Ein [SQL-Dump der Datenbank](./backups.md)

Nachdem du dich vergewissert hast, dass du alles hast, was du brauchst, fahre mit der folgenden Wiederherstellungs-Schritten fort:

1. Stelle den Inhalt deines `originals` Ordners wieder her.
2. Führe `photoprism restore -i [filename-to-your-sql-dump]` im Terminal aus.
3. [Re-indexiere](../../user-guide/library/indexing.md) deine Bibliothek mit der Option "Index vollständig aktualisieren", um Thumbnails neu zu generieren.
