# Benutzer verwalten

!!! example ""
    [PhotoPrism® Plus](https://www.photoprism.app/editions#compare) verfügt zusätzlich zum in allen Editionen enthaltenen [Command-Line Interface](cli.md) über ein Admin-Web-UI zum Verwalten von Nutzern und Sitzungen.

Du kannst Benutzerkonten hinzufügen, bearbeiten und löschen, indem du als [Admin](roles.md#admin) zu *Einstellungen > Benutzer* navigierst:

![Screenshot](img/users-german.jpg){ class="shadow" }

## Neuen Benutzer hinzufügen

![Screenshot](img/users-add-german.jpg){ class="shadow" }

## Benutzer Details bearbeiten

![Screenshot](img/users-edit-german.jpg){ class="shadow" }

Nur [Super-Admins](roles.md#admin) können [den Authentifizierungs-Provider](cli.md#optionen) eines Kontos über die Weboberfläche ändern, ausgenommen von ihrem eigenen Konto, damit sie sich nicht versehentlich selbst aussperren, indem sie ihn z. B. auf „none“ setzen.
## Passwörter ändern

Super-Admins können das Passwort eines Nutzers zurücksetzen, während normale Admins Passwörter nur ändern können, wenn sie das aktuelle Passwort kennen.

![Screenshot](img/users-change-pw-german.jpg){ class="shadow" }

## Benutzer löschen

![Screenshot](img/users-delete-german.jpg){ class="shadow" }

## Sitzungen verwalten

Du kannst aktive Sitzungen anzeigen und löschen, indem du als [Admin](roles.md#admin) zu *Einstellungen > Benutzer > Sessions* navigierst:

![Screenshot](img/sessions-german.jpg){ class="shadow" }

Um Sitzungsdetails anzuzeigen, klicke auf :material-magnify:.
Um eine Sitzung zu löschen klicke :material-delete:.