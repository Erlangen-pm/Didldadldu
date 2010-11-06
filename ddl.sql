BEGIN TRANSACTION;
CREATE TABLE "users" ( -- Benutzer, welche Umfragen anlegen können oder die bei geschlossenen Umfragen abstimmen können
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL  UNIQUE , -- Interne ID
        "name" VARCHAR(128) NOT NULL  UNIQUE , -- Benutzername für die Anmeldung
        "password" varchar(16) NOT NULL , -- Passwort für die Anmeldung
        "email" VARCHAR(512) NOT NULL , -- Email für Benachrichtigungen und so
        "registerdate" DATETIME, -- Wann hat sich der Benutzer angemeldet
        "lastlogin" DATETIME -- Wann war der Benutzer das letzte mal eingeloggt
);
CREATE TABLE "votes" ( -- Stimmen für eine Wahlmöglichkeit einer Umfrage
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, -- Interne ID
        "optionid" INTEGER NOT NULL , -- Intere ID der Wahlmöglichkeit
        "userid" INTEGER , -- Interne ID des abstimmenden Benutzers bei geschlossenen Umfragen
        "username" VARCHAR(128), -- Benutzername für anonyme Umfragen
        "vote" BOOL, -- Wie hat der Benutzer abgestimmt
        "votetime" DATETIME, -- Wann hat der Benutzer abgestimmt
);
CREATE TABLE "options" ( -- Wahlmöglichkeiten einer Umfrage
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL  UNIQUE , -- Interne ID der Wahlmöglichkeit
        "pollid" INTEGER NOT NULL , -- ID der zugehörigen Umfrage
        "text" VARCHAR(128) NOT NULL -- Überschrift der Wahlmöglichkeit
);
CREATE TABLE "polls" ( -- Die Umfrage selber
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , -- Interne ID der Umfrage
        "text" VARCHAR(1024) NOT NULL , -- Anschreiben für die Umfrage
        "userid" INTEGER NOT NULL , -- ID des Umfrageinitator-Benutzers
        "code" VARCHAR(32) NOT NULL , -- Globaler Umfragecode
        "multi" BOOL DEFAULT 0, -- Mehrfachauswahl möglich
        "closed" BOOL DEFAULT 1, -- Umfrage nur für angemeldete Benutzer
        "starttime" DATETIME, -- Beginn der Umfrage
        "endtime" DATETIME, -- Vorbestimmtes Ende der Umfrage
        "creationtime" DATETIME DEFAULT -- Wann wurde die Umfrage erstellt
);
COMMIT;

