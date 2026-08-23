# Externe Apps und Dienste authentifizieren

Um anderen Anwendungen und Diensten eingeschränkten Zugriff zu gewähren, können Administratoren mit den Unterbefehlen [`photoprism auth`](cli.md#sessions-verwalten) und [`photoprism clients`](#client-zugangsdaten) Authentifizierungs-Token für sie erzeugen. [App-Passwörter](#app-passworter) sind an Benutzerkonten gebunden und können [von allen Benutzern](../settings/account.md#apps-und-gerate) in der Benutzeroberfläche erstellt werden, während sich [OAuth2](https://docs.photoprism.app/developer-guide/api/oauth2/) [Access-Token](#access-token) und [Client-Zugangsdaten](#client-zugangsdaten) für den [Zugriff auf die REST API](https://docs.photoprism.app/developer-guide/api/) verwenden lassen, ohne an ein Benutzerkonto gebunden zu sein.

## App-Passwörter

Alle Benutzer können sich in der Weboberfläche eigene App-spezifische Passwörter erstellen, indem sie zu [*Einstellungen > Konto*](../settings/account.md) gehen und dort auf die Schaltfläche [*Apps und Geräte*](../settings/account.md#apps-und-gerate) klicken.

Alternativ erzeugt der folgende Befehl [in einem Terminal](https://docs.photoprism.app/getting-started/docker-compose/#command-line-interface) ein neues App-spezifisches Passwort, zum Beispiel für das Konto *admin*, damit WebDAV-kompatible Clients Dateien synchronisieren können, auch wenn [2FA für das Konto aktiviert ist](2fa.md) oder [das Kontopasswort geändert wird](../settings/account.md#passwort-andern):

```bash
docker compose exec photoprism photoprism auth add -n Sync -s "webdav" admin
```

Anschließend wird dir das erzeugte App-Passwort angezeigt, damit du es kopieren und sicher aufbewahren oder direkt in einer App eintragen kannst, denn du kannst es später nicht noch einmal einsehen:

```
|-----------------------------|---------------------|
| App Password                | Authorization Scope |
|-----------------------------|---------------------|
| HY8fxO-8hvNqB-43UV4q-1AZ0vu | webdav              |
|-----------------------------|---------------------|
```

Aus Sicherheitsgründen empfehlen wir, für die App-Passwörter und Access-Token, die du erzeugst, ein Ablaufdatum zu setzen. Übliche Berechtigungen für App-Passwörter sind `"*"` für vollen Zugriff oder `"webdav"` für [WebDAV-kompatible](../sync/webdav.md) [Apps zur Dateisynchronisierung](../sync/mobile-devices.md).

!!! note ""
    App-Passwörter können nicht nur über den Endpunkt `POST /api/v1/session` Sessions erstellen: Entwickler können sie auch [direkt als Access-Token](https://docs.photoprism.app/developer-guide/api/#client-authentication) im *Bearer Authorization* Header verwenden, ohne zuvor ein Session-Token zu erzeugen.

App-Passwörter authentifizieren sich als das Benutzerkonto, zu dem sie gehören, und unterliegen deshalb denselben Einschränkungen wie dieses Konto. Wenn die [Anmeldung für ein Konto deaktiviert](cli.md#optionen) ist, können seine App-Passwörter nur für die [WebDAV](../sync/webdav.md)-Synchronisierung verwendet werden, sofern WebDAV für das Konto aktiviert ist und das App-Passwort die Berechtigung `webdav` hat. Damit eine Anwendung ohne Benutzeranmeldung aus der [REST API](https://docs.photoprism.app/developer-guide/api/) lesen kann, erzeuge stattdessen ein [Access-Token](#access-token) oder [Client-Zugangsdaten](#client-zugangsdaten).

### Optionen

Die folgenden Flags können mit dem Befehl `photoprism auth add` verwendet werden (wenn du *name* oder *scope* weglässt, wirst du interaktiv danach gefragt):

| Command Flag                      | Description                                                                                                  |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------|
| `--name CLIENT, -n CLIENT`        | CLIENT name to help identify the application                                                                 |
| `--scope SCOPES, -s SCOPES`       | authorization SCOPES e.g. "metrics" or "photos albums" (`"*"` to allow all)                                  |
| `--expires LIFETIME, -e LIFETIME` | authentication LIFETIME in seconds, after which access expires (-1 to disable the limit) (default: 31536000) |

### Berechtigungen

Führe den folgenden Befehl aus, um die von deiner aktuellen Version unterstützten Berechtigungen anzuzeigen:

```bash
docker compose exec photoprism photoprism show scopes
```

Anschließend kannst du einen oder mehrere dieser Namen an `photoprism auth add` oder `photoprism clients add` übergeben, je nachdem, ob du ein App-Passwort, ein Access-Token oder OAuth2-Client-Zugangsdaten benötigst.

!!! note ""
    Clients, die sich mit App-Passwörtern authentifizieren, können weder das Kontopasswort ändern noch Benutzerkonten verwalten, selbst wenn du alle Berechtigungen angibst oder mit `"*"` alle erlaubst.

## Access-Token

Wenn du dem Befehl `photoprism auth add` keinen Benutzernamen als Argument übergibst, wird ein Client Access Token erzeugt (mit denselben Flags und Berechtigungen wie oben kannst du Autorisierung und Lebensdauer einschränken):

```
|--------------------------------------------------|---------------------|
| Access Token                                     | Authorization Scope |
|--------------------------------------------------|---------------------|
| 7dbfa37b5a3db2a9e9dd186479018bfe2e3ce5a71fc2f955 | files folders       |
|--------------------------------------------------|---------------------|
```

Access-Token sind eine gute Wahl für Entwickler und andere fortgeschrittene Benutzer, um Skripte und externe Dienste mit der PhotoPrism API zu verbinden, zum Beispiel Dienste, die Metriken sammeln, regelmäßig die Indexierung starten oder Bilder auf einem digitalen Bilderrahmen anzeigen.

Beachte jedoch, dass Client Access Token nicht zum Synchronisieren von Dateien über WebDAV verwendet werden können, selbst wenn die Berechtigung `"webdav"` oder `"*"` gesetzt ist, da dafür ein registriertes Benutzerkonto erforderlich ist. Access-Token können außerdem nicht als direkter Passwortersatz für Apps dienen, da Clients den Endpunkt `POST /api/v1/session` nicht verwenden dürfen, der für die Anmeldung über die Benutzeroberfläche erforderlich ist.

## Client-Zugangsdaten

Wenn Clients die Authentifizierung über [OAuth2 Client Credentials](https://www.oauth.com/oauth2-servers/access-tokens/client-credentials/) unterstützen, kannst du mit den folgenden Terminal-Befehlen eine `client_id` und ein `client_secret` für sie erzeugen, registrierte Clients auflisten und nicht mehr benötigte Zugangsdaten löschen:

| CLI Command                            | Description                                |
|----------------------------------------|--------------------------------------------|
| `photoprism clients ls [search]`       | Lists registered client applications       |
| `photoprism clients add [username]`    | Registers a new client application         |
| `photoprism clients show [identifier]` | Shows client configuration details         |
| `photoprism clients mod [identifier]`  | Updates client application settings        |
| `photoprism clients rm [identifier]`   | Deletes the specified client application   |
| `photoprism clients reset --yes`       | Removes all registered client applications |

Der folgende Befehl [in einem Terminal](https://docs.photoprism.app/getting-started/docker-compose/#command-line-interface) erzeugt zum Beispiel Zugangsdaten für [Prometheus](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#oauth2), deren Zugriff auf den Endpunkt *metrics* beschränkt ist:

```bash
docker compose exec photoprism photoprism clients add -n Prometheus -s metrics
```

Anschließend werden dir die erzeugte `client_id` und das `client_secret` angezeigt, damit du sie kopieren und sicher aufbewahren kannst:

```
|------------------|----------------------------------|
| Client ID        | Client Secret                    |
|------------------|----------------------------------|
| csce0w2joodmirvi | 5VKkBeZLDvojjpE9XzCMXShnrxmxHWvN |
|------------------|----------------------------------|
```

!!! note ""
    [OAuth2-Client-Zugangsdaten](https://www.oauth.com/oauth2-servers/access-tokens/client-credentials/) können nicht direkt zum Synchronisieren von Dateien über WebDAV, als [Passwortersatz für Apps](../settings/account.md#apps-und-gerate) oder für die Anmeldung an der Weboberfläche verwendet werden.

### Optionen

Die folgenden Parameter können mit dem Befehl `photoprism clients add` verwendet werden, zum Beispiel um die Anzahl der Access-Token zu begrenzen, die der Client anfordern kann:

| Command Flag                      | Description                                                                                         |
|-----------------------------------|-----------------------------------------------------------------------------------------------------|
| `--name CLIENT, -n CLIENT`        | CLIENT name to help identify the application                                                        |
| `--role ROLE, -r ROLE`            | client authorization ROLE (default: "client")                                                       |
| `--scope SCOPES, -s SCOPES`       | client authorization SCOPES e.g. "metrics" or "photos albums" (`"*"` to allow all)                  |
| `--expires LIFETIME, -e LIFETIME` | access token LIFETIME in seconds, after which a new token must be requested (default: 86400)        |
| `--tokens NUMBER, -t NUMBER`      | maximum NUMBER of access tokens that the client can request (-1 to disable the limit) (default: 10) |

Wenn du den Parameter *name* oder *scope* weglässt, wirst du interaktiv danach gefragt. Um die derzeit unterstützten Berechtigungen anzuzeigen, führe Folgendes aus:

```bash
docker compose exec photoprism photoprism show scopes
```

!!! note ""
    Beim Anfordern von Access-Token können Clients deren Berechtigungen weiter einschränken, indem sie den Parameter *scope* an den Endpunkt `POST /api/v1/oauth/token` übergeben.
