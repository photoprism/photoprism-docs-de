# Verbindung via WebDAV #

WebDAV-kompatible Apps und Clients wie [PhotoSync](./sync-phone.md), der Windows Explorer von Microsoft oder der Finder von Apple, können sich direkt mit PhotoPrism verbinden.

Dazu wird der *Originals* oder *Import* Ordner als Netzwerklaufwerk verbunden, so kannst du Dateien von deinem Computer oder Smartphone aus öffnen, bearbeiten oder löschen.

Sobald alle Dateien hinzugefügt sind, können sie [importiert oder indexiert](../library/import-vs-index.md) werden.
Nachdem Dateien über WebDAV hochgeladen wurden, beginnt die Indexierung beziehungsweise der Import automatisch nach einer kurzen Verzögerung.

!!! info ""
	WebDAV kann in den [Erweiterten Einstellungen](../settings/advanced.md) deaktiviert werden.
	Wenn du PhotoPrism im [public-Modus](https://docs.photoprism.app/getting-started/config-options/) ohne Authentifizierung betreibst, ist WebDAV aus Sicherheitsgründen automatisch deaktiviert.

!!! info ""
	Es ist auch möglich, Dateien mit [externen WebDAV-Servern](../settings/sync.md) wie ownCloud oder anderen PhotoPrism-Instanzen zu synchronisieren.

## Server Url ##
Die Url des *Originals* Verzeichnis für öffentliche Server lautet:

```
https://admin@example.com/originals/
```

oder

```
\\example.com@SSL\originals\
```

für Windows 10.

Bitte ersetze *example.com* mit deiner Domain.
Der `/` am Ende ist wichtig und darf nicht weggelassen werden.

!!! tip ""
	Du findest deine Server-Url auf der [Account-Seite](../settings/account.md) in den Einstellungen.

Wenn du dich verbindest, musst du dich mit deinem Passwort authentifizieren.
Das Passwort kann in den *Einstellungen* geändert werden. Der Nutzername ist `admin`.

!!! note ""
	Du kannst auch eine Verbindung zum *Import* Verzeichnis aufbauen, indem du in der URL `originals/` mit `import/` ersetzt.


Für Nutzer, die PhotoPrism lokal auf Port *2342* betreiben, ist die Url:

```
http://admin@localhost:2342/originals/
```

!!! attention ""
	Benutze WebDAV **niemals ohne https** außerhalb deines lokalen, privaten
	Netzwerks, da sonst das Passwort im Klartext über das Internet übertragen wird.

=== "macOS"

     1. Im **Finder** klicke "Gehe zu" > "Mit Server verbinden"
     2. Trage die Url in das Feld **Serveradresse** ein
     3. Klicke  **Verbinden**

=== "Windows 10"

     1. Öffne den **Windows Explorer**
     2. Klicke mit der rechten Maustaste auf **Mein PC**
     3. Wähle **Netzwerklaufwerk hinzufügen...**

		![Screenshot](img/webdav-1.jpg){ class="shadow" }

     4. Wähle den Laufwerksbuchstaben sowie das Verzeichnis, das mit WebDAV verknüpft werden soll
     5. Wähle die Optionen **Verbindung bei Anmeldung wiederherstellen** und **Verbindung mit anderen Anmeldeinformationen herstellen** aus
     6. Öffne folgenden Link: **Verbindung mit einer Webseite herstellen, auf der Sie Dokumente und Bilder speichern können**
    
		![Screenshot](img/webdav-2.jpg){ class="shadow" } 
		
	 7. Klicke  **Weiter**

		![Screenshot](img/webdav-3.jpg){ class="shadow" }

     8. Klicke **Eine benutzerdefinierte Netzwerkadresse auswählen** und dann auf **Weiter**
     
		![Screenshot](img/webdav-4.jpg){ class="shadow" }	
	
	 9. Trage die URL, wie oben beschrieben, in das Feld **Internet oder Netzwerkadresse** ein und klicke **Weiter**

		![Screenshot](img/webdav-5.jpg){ class="shadow" }

     10. Gib deinen Nutzernamen und dein Passwort ein und klicke **OK**
		
		![Screenshot](img/webdav-6.jpg){ class="shadow" }

	11. Gib einen Namen für die Netzwerkverbindung ein und klicke **Weiter**

		![Screenshot](img/webdav-7.jpg){ class="shadow" }

	10. Klicke **Fertig stellen**

		![Screenshot](img/webdav-8.jpg){ class="shadow" }

	Der *Originals* Ordner ist nun als Netzwerklaufwerk im Windows Explorer eingebunden und du kannst direkt Dateien oder Verzeichnisse hinzufügen, bearbeiten oder löschen.
	
	![Screenshot](img/webdav-9.jpg){ class="shadow" }
	
	Wenn du Probleme bei der Verbindung mit WebDav hast, musst du eventuell das Basic-Authentication Level in der Registry [aktualisieren](https://help.dreamhost.com/hc/en-us/articles/216473357-Accessing-WebDAV-with-Windows).