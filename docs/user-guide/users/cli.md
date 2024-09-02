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

## Passwort entfernen

Wenn du die Authentifizierung eines bestehenden Kontos auf einen passwortlosen Anbieter wie [*OIDC*](https://docs.photoprism.app/getting-started/advanced/openid-connect) änderst, wird ein zuvor vergebenes Passwort nicht entfernt, so dass es weiterhin zur Anmeldung verwendet werden kann (optional auch mit [2FA](2fa.md)).

Wenn für [ein solches Konto](https://docs.photoprism.app/getting-started/advanced/openid-connect#existing-accounts) ein lokales Passwort gesetzt wurde, das nicht mehr verwendet werden soll, kannst du es mit folgendem Befehl [in einem Terminal](https://docs.photoprism.app/getting-started/docker-compose#opening-a-terminal) entfernen:

```bash
photoprism passwd --rm [username]
```

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
| `photoprism users reset --yes`              | Removes all accounts and resets the database |

!!! tldr ""
    Benutzer, die nach einem Upgrade von [Entwicklungs-Builds](https://docs.photoprism.app/getting-started/updates/#development-preview) oder [alten Versionen von vor November 2022](https://docs.photoprism.app/known-issues/#new-user-management) Probleme bei der Anmeldung haben, können den Befehl `photoprism users reset --yes` ausführen, um [die Sitzung](#sessions-verwalten) und die Datenbanktabellen der Benutzerverwaltung neu zu erstellen, damit sie mit der aktuellen Version kompatibel sind. Beachte, dass alle [Client Access Token](https://docs.photoprism.app/user-guide/users/client-credentials/#access-tokens) und [App-Passwörter](../settings/account.md#apps-und-gerate), die Benutzer möglicherweise erstellt haben, ebenfalls gelöscht werden und neu erstellt werden müssen.

### Optionen

Du kannst die Unterbefehle `add` und `mod` mit diesen Flags kombinieren, um Kontoeigenschaften zu setzen oder zu ändern:

| Command Flag                         | Description                                                      |
|--------------------------------------|------------------------------------------------------------------|
| `--name NAME`, `-n NAME`             | full NAME for display in the interface                              |
| `--email EMAIL`, `-m EMAIL`          | unique EMAIL address of the user                                    |
| `--password PASSWORD`, `-p PASSWORD` | PASSWORD for local authentication (8-72 characters)                 |
| `--role value`, `-r value`           | user account ROLE (admin, user, viewer or guest) (default: "admin") |
| `--auth PROVIDER`, `-A PROVIDER`     | authentication PROVIDER (default, local, oidc or none)              |
| `--auth-id ID`                       | authentication ID e.g. Subject ID or Distinguished Name (DN)        |
| `--superadmin`, `-s`                 | make user super admin with full access                              |
| `--no-login`, `-l`                   | disable login on the web interface                                  |
| `--webdav`, `-w`                     | allow to sync files via WebDAV                                      |
| `--upload-path value`, `-u value`    | upload files to this sub-folder                                     |
| `--disable-2fa`                      | deactivate two-factor authentication                                |

### Neuen Benutzer erstellen

Du könntest zum Beispiel wie folgt vorgehen, um einen neuen Admin mit dem Benutzernamen "bob" und dem Passwort "mysecret" hinzuzufügen:

```
docker compose exec photoprism photoprism users add -p mysecret -n "Bob" bob
```

!!! example ""
    Einige Benutzer Rollen wie Benutzer und Betrachter sind derzeit [nur mit einer Mitgliedschaft](https://www.photoprism.app/editions#compare) verfügbar, um die Entwicklung und Pflege des Projekts zu unterstützen.

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
docker compose exec photoprism photoprism audit logins [username]
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
    Führe `photoprism auth reset --yes` aus, um alle aufgezeichneten Einträge zu löschen und die Datenbank auf einen sauberen Zustand zurückzusetzen.

## Sessions verwalten

Folgende Befehle können verwendet werden, um Access Token für die Authentifizierung von Browsern und anderen Clients (inklusive [App Passwörtern](2fa.md#schritt-3-app-passworter)) zu erstellen, anzuzeigen und falls notwendig zu löschen:

| CLI Command                         | Description                                              |
|-------------------------------------|----------------------------------------------------------|
| `photoprism auth ls [search]`       | Lists currently authenticated users and clients          |
| `photoprism auth add [username]`    | Adds a new authentication secret for client applications |
| `photoprism auth show [identifier]` | Shows detailed information about a session               |
| `photoprism auth rm [identifier]`   | Deletes a session by id or access token                  |
| `photoprism auth reset --yes`       | Resets the authentication of all users and clients       |

Um anderen Anwendungen und Diensten eingeschränkten API-Zugang zu gewähren, kannst du mit dem Befehl `photoprism clients add` [OAuth2-Client-Zugangsdaten](https://docs.photoprism.app/user-guide/users/client-credentials/#client-credentials) für sie generieren. Den Befehl `photoprism auth add` kannst du verwenden, um [Access-Token](https://docs.photoprism.app/user-guide/users/client-credentials/#access-tokens) mit [eingeschränkter Berechtigung](https://docs.photoprism.app/user-guide/users/client-credentials/#authorization-scopes) und einer begrenzten Lebensdauer zu generieren.

!!! tldr ""
    Wenn beim Login Probleme auftreten, z. B. nach einem Upgrade von einer [früheren Version](https://docs.photoprism.app/release-notes/) oder [Entwicklungsversion](https://docs.photoprism.app/getting-started/updates/#development-preview), empfehlen wir, den Befehl `photoprism auth reset --yes` [in einem Terminal](https://docs.photoprism.app/getting-started/docker-compose/#command-line-interface) auszuführen, um die Tabelle `auth_sessions` auf einen sauberen Zustand zurückzusetzen und eine Neuanmeldung aller Benutzer zu erzwingen. Beachte, dass dadurch auch alle Client Access Token und alle [App-Passwörter](2fa.md#schritt-3-app-passworter) gelöscht werden, die Benutzer/innen möglicherweise erstellt haben.