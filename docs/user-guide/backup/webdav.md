# Verbindung via WebDAV #

WebDAV Clients, wie Microsoft Windows Explorer oder Apple Finder, können sich direkt mit PhotoPrism verbinden.
Dazu werden der *originals Ordner* als Netzwerklaufwerk verbunden und man kann direkt Dateien bearbeiten, als wären sie lokal.

Der "originals" Ordner für einen öffentlichen Server sieht wie folgt aus:

```
https://admin@example.com/originals/
```

Bitte ersetze *example.com* einfach mit der richtigen Domain.
Der `/` am Ende ist wichtig und darf nicht weggelassen werden.

Zur Verbindung muss man sich ganz normal mit dem Passwort anmelden.
Das Passwort ändert sich, wenn man es in den *Einstellungen* aktualisiert. Der Nutzername ist `admin`.

!!! Info
	Du kannst auch mit dem `import` Ordner mounten.
	Dazu einfach bei der Verbindung den Ordner  `originals/` mit `import/` in der URL ersetzen.

Für Nutzer, die PhotoPrism lokal auf Port *2342* laufen haben sieht die *originals* URL so aus:

```
http://admin@localhost:2342/originals/
```

!!! Achtung
	Benutze WebDAV **nicht ohne https** außerhalb deines lokalen, privaten
	Netzwerks, da sonst das Passwort im Klartext im Internet übertragen wird.

## Eine Verbindung zu einem WebDAV Server unter macOS aufbauen ##

1. Im **Finder** unter "Gehe zu" auf "mit Server verbinden" klicken
2. In das Feld **Serveradresse** die URL eintragen
3. Auf **Verbinden** drücken

## Eine Verbindung zu einem WebDAV Server unter Windows 10 aufbauen ##

1. Den **Windows Explorer** öffenen
2. Rechtsklick auf **Mein PC**
3. Wähle **Netzwerklaufwerk hinzufügen...**
4. Den Laufwerksbuchstaben und das Verzeichnis wählen, dass mit WebDAV verknüpft werden soll
	5. Wähle folgenden Optionen aus **Verbindung bei Anmeldung wiederherstellen** und **Verbindung mit anderen Anmeldeinformationen herstellen**
6. Klick auf Link **Verbindung mit einer Webseite herstellen, auf der Sie Dokumente und Bilder speichern können**
7. Klicke auf **Weiter**
8. Klicke auf **Eine benutzerdefinierte Netzwerkadresse auswählen** und dann auf **Weiter**
9. Trage die URL von oben in das **Internet oder Netzwerkadresse** Feld ein
10. Drücke auf **Weiter** und dann auf **Fertig stellen**

Der "originals" Ordner ist nun verbunden und kann mit dem Windows Explorer verwendet werden.
Dateien können nur erstellt, bearbeitet oder gelöscht werdern.

Wenn es Probleme mit der WebDAV Verbindung gibt, dann muss eventuell ein Update in der Windows Basic-Authentifizierung
[geupdatet](https://help.dreamhost.com/hc/en-us/articles/216473357-Accessing-WebDAV-with-Windows) werden.
