BEGIN TRANSACTION;
CREATE TABLE "users" (
        "id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
        "name" VARCHAR(128) NOT NULL  UNIQUE ,
        "password" varchar(16) NOT NULL ,
        "email" VARCHAR(512) NOT NULL ,
        "registerdate" DATETIME,
        "lastlogin" DATETIME
);
CREATE TABLE "votes" (
        "optionid" INTEGER NOT NULL ,
        "userid" INTEGER NOT NULL ,
        "vote" BOOL, 
        "votetime" DATETIME, 
        PRIMARY KEY ("optionid","userid")
);
CREATE TABLE "options" (
        "id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE , 
        "pollid" INTEGER NOT NULL , 
        "text" VARCHAR(128) NOT NULL 
);
CREATE TABLE "polls" (
        "id" INTEGER PRIMARY KEY  NOT NULL ,
        "text" VARCHAR(1024) NOT NULL ,
        "userid" INTEGER NOT NULL ,
        "code" VARCHAR(32) NOT NULL ,
        "starttime" DATETIME,
        "endtime" DATETIME,
        "creationtime" DATETIME
);
COMMIT;
