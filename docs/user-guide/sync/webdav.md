# Verbindung via WebDAV #

WebDAV Clients, wie der Microsoft Windows Explorer oder der Apple Finder, können sich direkt mit PhotoPrism verbinden.
Dazu wird der *Originals* Ordner als Netzwerklaufwerk verbunden, so kannst du Dateien von deinem Computer oder Smartphone aus öffnen, bearbeiten oder löschen.

Die Url des *Originals* Verzeichnis für öffentliche Server lautet:

```
https://admin@example.com/originals/
```

Bitte ersetze *example.com* mit deiner Domain.
Der `/` am Ende ist wichtig und darf nicht weggelassen werden.

Wenn du dich verbindest, musst du dich mit deinem Passwort authentifizieren.
Das Passwort kann in den *Einstellungen* geändert werden. Der Nutzername ist `admin`.

!!! Info
	Du kannst auch eine Verbindung zum *Import* Verzeichnis aufbauen, indem du in der URL `originals/` mit `import/` ersetzt.


Für Nutzer, die PhotoPrism lokal auf Port *2342* betreiben, ist die Url:

```
http://admin@localhost:2342/originals/
```

!!! Achtung
	Benutze WebDAV **niemals ohne https** außerhalb deines lokalen, privaten
	Netzwerks, da sonst das Passwort im Klartext über das Internet übertragen wird.

## Unter macOS mit einem WebDAV Server verbinden ##

1. Im **Finder** klicke "Gehe zu" > "Mit Server verbinden"
2. Trage die Url in das Feld **Serveradresse** ein
3. Klicke  **Verbinden**

## Unter Windows 10 mit einem WebDAV Server verbinden ##

1. Öffne den **Windows Explorer**
2. Klicke mit der rechten Maustaste auf **Mein PC**
3. Wähle **Netzwerklaufwerk hinzufügen...**
4. Wähle den Laufwerksbuchstaben sowie das Verzeichnis, dass mit WebDAV verknüpft werden soll
5. Wähle die Optionen **Verbindung bei Anmeldung wiederherstellen** und **Verbindung mit anderen Anmeldeinformationen herstellen** aus
6. Öffne folgenden Link: **Verbindung mit einer Webseite herstellen, auf der Sie Dokumente und Bilder speichern können**
7. Klicke  **Weiter**
8. Klicke **Eine benutzerdefinierte Netzwerkadresse auswählen** und dann auf **Weiter**
9. Trage die URL in das Feld **Internet oder Netzwerkadresse** ein
10. Klicke **Weiter** und dann **Fertig stellen**

Der *Originals* Ordner ist nun als Netzwerklaufwerk im Windows Explorer eingebunden und du kannst direkt Dateien oder Verzeichnisse hinzufügen, bearbeiten oder löschen.


Wenn du Probleme bei der Verbindung mit WebDav hast, musst du eventuell das Basic-Authentication Level in der Registry [aktualisieren](https://help.dreamhost.com/hc/en-us/articles/216473357-Accessing-WebDAV-with-Windows).