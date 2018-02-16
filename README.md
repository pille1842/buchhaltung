# Buchhaltungshelfer

Dieser kleine Buchhaltungshelfer hilft bei allfälligen Aufgaben bei der Buchhaltung:

- schnelles Addieren von Beträgen
- Umrechnen zwischen Brutto- und Nettobeträgen mit verschiedenen Steuersätzen
- Suchen von Kontonummern für Kunden (Verwaltung einer Kontenliste)

## Voraussetzungen

Benötigt wird:

- Python 3 (getestet mit Python 3.5.2 auf Ubuntu 16.04)
- [python-fire](https://github.com/google/python-fire): ```sudo -H pip3 install fire```

## Installation

Klone das Repository, dann führe darin folgenden Befehl aus:

```
$ sudo make install
```

Dadurch wird der Buchhaltungshelfer ```bh``` in /usr/local/bin installiert. Das
Präfix (/usr/local) lässt sich mithilfe der Variable $PREFIX überschreiben:

```
$ sudo make PREFIX=/usr install
```

(In diesem Fall würde das Programm nach /usr/bin installiert werden.)

## Verwendung

### Beträge berechnen

    bh netto BETRAG PROZENT           behandle Betrag als Brutto und berechne den Nettobetrag
                                      bei PROZENT % Steuer
       bh n19 BETRAG                  wie 'bh netto' mit 19% Steuer
       bh n7  BETRAG                  wie 'bh netto' mit 7% Steuer
    bh brutto BETRAG PROZENT          behandle Betrag als Netto und berechne den Bruttobetrag
                                      bei PROZENT % Steuer
       bh b19 BETRAG                  wie 'bh brutto' mit 19% Steuer
       bh b7  BETRAG                  wie 'bh brutto' mit 7% Steuer
    bh sum BETRÄGE...                 berechne die Summe aller eingegebenen Beträge

### Rechnungen aufteilen

    bh aufteilen GESAMT STEUER BETRÄGE...
      teile eine Rechnung mit dem Gesamtbetrag GESAMT auf. Wende auf jeden der BETRÄGE einen
      Steuersatz von STEUER % an, wenn STEUER > 0. Falls ein Rest übrig bleibt, wird dieser
      ebenfalls ausgegeben. Falls die Summe der BETRÄGE > GESAMT, gib den Fehlbetrag aus.

    bh aufteilen0  GESAMT BETRÄGE...
    bh aufteilen7  GESAMT BETRÄGE...
    bh aufteilen19 GESAMT BETRÄGE...
      wie 'bh aufteilen' mit den angenommenen Steuersätzen 0%, 7% und 19%.

### Konten verwalten

    Konten werden im standardmäßig in ~/.config/buchhaltung/konten.json gespeichert.

    bh konto SUCHBEGRIFF
      durchsuche die Kontenliste nach SUCHBEGRIFF und gib alle Konten zurück, bei denen
      SUCHBEGRIFF im Namen auftaucht.

    bh kontonr KONTONUMMER
      durchsuche die Kontenliste nach Konten, in deren Nummer KONTONUMMER vorkommt.

    bh neukonto KONTONUMMER NAME
      füge ein neues Konto mit der Nummer KONTONUMMER und dem Namen NAME hinzu.

    bh delkonto KONTONUMMER
      lösche das Konto mit der Nummer KONTONUMMER aus der Kontenliste.

