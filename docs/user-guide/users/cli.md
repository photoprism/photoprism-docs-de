# Benutzerverwaltung Command-Line Interface

## Passwort ändern

Wenn du folgenden Befehl in einem Terminal ausführst, änderst du das Passwort eines bestehenden Benutzers, ohne andere Kontoeinstellungen zu beeinflussen, z. B. wenn du dich nicht mehr an das aktuell eingestellte Passwort erinnern kannst oder wenn es ein Problem [bei der Konfiguration des anfänglichen Admin-Kontos](https://docs.photoprism.app/getting-started/config-options/#authentication) gab (ersetze `[username]` durch den Benutzernamen des Kontos, das du aktualisieren möchtest):

```bash
photoprism passwd [username]
```

Beachte, dass du, wenn du [Docker Compose](https://docs.photoprism.app/getting-started/docker-compose/#command-line-interface) verwendest und nicht [bereits eine Terminal-Sitzung geöffnet hast](https://docs.photoprism.app/getting-started/docker-compose/#opening-a-terminal), `docker compose exec photoprism` voranstellen musst, damit der Befehl z.B. innerhalb des `photoprism` Containers ausgeführt wird:

```bash
docker compose exec photoprism photoprism passwd admin
```

Dies gilt auch für [andere Befehle](https://docs.photoprism.app/getting-started/docker-compose/#examples), einschließlich der unten aufgeführten.

!!! tldr ""
    Die Beispiele in unserer Dokumentation verwenden standardmäßig den neuen Befehl `docker compose`. Wenn dein Server ihn noch nicht unterstützt, kannst du trotzdem `docker-compose` oder alternativ `podman-compose` auf Red Hat-kompatiblen Linux-Distributionen verwenden.

## Benutzerkonten verwalten

Alternativ zur [Web-Benutzeroberfläche](index.md) kannst du Benutzerkonten auch verwalten, indem du die folgenden Befehle [in einem Terminal](https://docs.photoprism.app/getting-started/docker-compose/#command-line-interface) ausführst:

| CLI Command                                 | Description                                  |
|---------------------------------------------|----------------------------------------------|
| `photoprism users ls [search]`              | Searches existing user accounts              |
| `photoprism users legacy [search]`          | Searches legacy user accounts                |
| `photoprism users add [options] [username]` | Adds a new user account                      |
| `photoprism users show [username]`          | Displays user account information            |
| `photoprism users mod [options] [username]` | Modifies an existing user account            |
| `photoprism users rm [username]`            | Removes a user account                       |
| `photoprism users reset`                    | Removes all accounts and resets the database |

### Optionen

Du kannst die Unterbefehle `add` und `mod` mit diesen Flags kombinieren, um Kontoeigenschaften zu setzen oder zu ändern:

| Command Flag                         | Description                                     |
|--------------------------------------|-------------------------------------------------|
| `--name NAME`, `-n NAME`             | full NAME for display in the interface          |
| `--email EMAIL`, `-m EMAIL`          | unique EMAIL address of the user                |
| `--password PASSWORD`, `-p PASSWORD` | PASSWORD for authentication                     |
| `--role value`, `-r value`           | admin, user, viewer or guest (default: "admin") |
| `--superadmin`, `-s`                 | make user super admin with full access          |
| `--no-login`, `-l`                   | disable login on the web interface              |
| `--webdav`, `-w`                     | allow to sync files via WebDAV                  |
| `--upload-path value`, `-u value`    | upload files to this sub-folder                 |

### Neuen Benutzer erstellen

Du könntest zum Beispiel wie folgt vorgehen, um einen neuen Admin mit dem Benutzernamen "bob" und dem Passwort "mysecret" hinzuzufügen:

```
docker compose exec photoprism photoprism users add -p mysecret -n "Bob" bob
```

!!! example ""
    Zusätzliche [Benutzer Rollen](roles.md) wie user, viewer und guest sind derzeit [nur mit einer Mitgliedschaft](https://www.photoprism.app/editions#compare) verfügbar, um die Entwicklung und Pflege des Projekts zu unterstützen.

### Kontodetails anzeigen

Um alle Kontoeigenschaften eines bestimmten Benutzers zu sehen, verwende den Unterbefehl `show`:

```
docker compose exec photoprism photoprism users show bob
```

### Benutzerkonten suchen

Um alle bestehenden Konten aufzulisten, kannst du Folgendes ausführen:

```
docker compose exec photoprism photoprism users ls
```

Dieser Befehl kann das Ergebnis auch filtern, wenn du einen Suchbegriff als Argument angibst:

```
docker compose exec photoprism photoprism users ls bob
```

Um eine Beschreibung und die verfügbaren Optionen für einen Befehl anzuzeigen, verwende das `--help` Flag:

```
docker compose exec photoprism photoprism users ls --help
```

## Login Versuche anzeigen

Aus Sicherheitsgründen sind die Authentifizierungs-Logs nicht im regulären Web-UI sichtbar und können nur in den Anwendungs-Logs eingesehen oder in einem Terminal mit folgendem Befehl durchsucht werden:
```
photoprism logins ls [search]
```

### Optionen

Du kannst ihn mit folgenden Flags kombinieren, um das Ausgabeformat und die maximale Anzahl der Suchergebnisse zu ändern:

| Command Flag | Description                            |
|--------------|----------------------------------------|
| `--md, -m `  | format as machine-readable Markdown    |
| `--csv, -c`  | export as semicolon separated values   |
| `--tsv, -t`  | export as tab separated values         |
| `-n LIMIT`   | LIMIT number of results (default: 100) |

### Beispiel Bericht

| Client IP  | User Name | Realm | Status |     Last Login      | Failed At |
|------------|-----------|-------|--------|---------------------|-----------|
| 172.19.0.1 | user      | api   | OK     | 2023-02-03 07:17:46 |           |
| 172.19.0.1 | viewer    | api   | OK     | 2023-02-03 07:16:55 |           |
| 172.19.0.1 | admin     | api   | OK     | 2023-02-03 06:55:06 |           |

!!! tldr ""
    Führe `photoprism logins clear` aus, um alle aufgezeichneten Einträge zu löschen und die Datenbank auf einen sauberen Zustand zurückzusetzen.

## Siztungen überwachen

Du kannst die folgenden Befehle verwenden, um Browsersitzungen zu finden, zu untersuchen und ggf. zu löschen:

| CLI Command                   | Description                        |
|-------------------------------|------------------------------------|
| `photoprism sess ls [search]` | Finds and displays sessions        |
| `photoprism sess show [id]`   | Shows detailed session information |
| `photoprism sess rm [id]`     | Deletes the specified session      |
| `photoprism sess clear`       | Removes all sessions               |
