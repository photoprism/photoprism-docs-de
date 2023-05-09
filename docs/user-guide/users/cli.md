# Benutzerverwaltung Command-Line Interface

Alternativ zur Web-Benutzeroberfläche kannst du Benutzerkonten auch verwalten, indem du die folgenden Befehle in einem Terminal ausführst:

| CLI Command                                 | Description                                  |
|---------------------------------------------|----------------------------------------------|
| `photoprism users ls [search]`              | Searches existing user accounts              |
| `photoprism users legacy [search]`          | Searches legacy user accounts                |
| `photoprism users add [options] [username]` | Adds a new user account                      |
| `photoprism users show [username]`          | Displays user account information            |
| `photoprism users mod [options] [username]` | Modifies an existing user account            |
| `photoprism users rm [username]`            | Removes a user account                       |
| `photoprism users reset`                    | Removes all accounts and resets the database |

#### Hinzufügen und Ändern von Konten

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

Du könntest zum Beispiel wie folgt vorgehen, um einen neuen Admin mit dem Benutzernamen "bob" und dem Passwort "mysecret" hinzuzufügen:

```
docker compose exec photoprism photoprism users add -p mysecret -n "Bob" bob
```

!!! example ""
    Benutzer-Rollen und das Admin-Web-UI sind derzeit nur in [PhotoPrism® Plus](https://www.photoprism.app/editions#compare) verfügbar.

!!! info ""
    Beachte, dass unsere Anleitungen jetzt standardmäßig den neuen Befehl "docker compose" verwenden. Wenn dein Server diesen Befehl noch nicht unterstützt, funktioniert der alte Befehl "docker-compose" weiterhin.

#### Kontodetails anzeigen

Um alle Kontoeigenschaften eines bestimmten Benutzers zu sehen, verwende den Unterbefehl `show`:

```
docker compose exec photoprism photoprism users show bob
```

#### Benutzerkonten suchen

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
