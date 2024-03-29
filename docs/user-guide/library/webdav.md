# Dateien mit WebDAV zum Originals oder Import Ordner hinzufügen #
WebDAV-kompatible Apps und Clients wie [PhotoSync](../sync/sync-phone.md), der Windows Explorer von Microsoft oder der Finder von Apple können sich direkt mit PhotoPrism verbinden:

Folge hierzu dieser [Anleitung](../sync/webdav.md).

Sobald alle Dateien hinzugefügt sind, können sie [importiert oder indexiert](import-vs-index.md) werden.
Nachdem Dateien über WebDAV hochgeladen wurden, beginnt die Indexierung beziehungsweise der Import automatisch nach einer kurzen Verzögerung.

!!! info ""
    WebDAV kann in den [Erweiterten Einstellungen](../settings/advanced.md) deaktiviert werden.
    Da der WebDAV-Server Schreibrechte und Authentifizierung erfordert, wird er automatisch deaktiviert, wenn du PhotoPrism im [public](https://docs.photoprism.app/getting-started/config-options/#authentication) und/oder [schreibgeschützten Modus](https://docs.photoprism.app/getting-started/config-options/#feature-flags) betreibst.

!!! tip "" 
    WebDAV kann auch verwendet werden, um Bilder vom Server herunterzuladen. 
    Verbinden dich einfach mit `http://server-ip:2342/originals/` (lokaler Server ohne HTTPS) oder `https://yourdomain/originals/` (öffentlicher Server mit HTTPS)
    und kopiere die Dateien.

