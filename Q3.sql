
CREATE TABLE instrument (
                name VARCHAR NOT NULL,
                pitch VARCHAR NOT NULL,
                CONSTRAINT instrument PRIMARY KEY (name)
);


CREATE TABLE address (
                addressID INTEGER NOT NULL,
                street1 VARCHAR NOT NULL,
                street2 VARCHAR NOT NULL,
                number INTEGER NOT NULL,
                city VARCHAR NOT NULL,
                state VARCHAR NOT NULL,
                zipCode VARCHAR NOT NULL,
                telephone VARCHAR NOT NULL,
                CONSTRAINT address PRIMARY KEY (addressID)
);


CREATE TABLE musician (
                ssn INTEGER NOT NULL,
                addressID INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                CONSTRAINT musician PRIMARY KEY (ssn)
);


CREATE TABLE album (
                albumID INTEGER NOT NULL,
                title VARCHAR NOT NULL,
                releaseDate DATE NOT NULL,
                format VARCHAR NOT NULL,
                age INTEGER NOT NULL,
                ssn INTEGER NOT NULL,
                CONSTRAINT album PRIMARY KEY (albumID)
);


CREATE TABLE song (
                title VARCHAR NOT NULL,
                title INTEGER NOT NULL,
                ssn_author INTEGER NOT NULL,
                albumID INTEGER NOT NULL,
                CONSTRAINT song PRIMARY KEY (title)
);


CREATE TABLE sounds (
                name VARCHAR NOT NULL,
                title VARCHAR NOT NULL,
                CONSTRAINT sounds PRIMARY KEY (name, title)
);


CREATE TABLE performs (
                title VARCHAR NOT NULL,
                ssn INTEGER NOT NULL,
                CONSTRAINT performs PRIMARY KEY (title, ssn)
);


CREATE TABLE plays (
                name VARCHAR NOT NULL,
                ssn INTEGER NOT NULL,
                CONSTRAINT plays PRIMARY KEY (name, ssn)
);


ALTER TABLE plays ADD CONSTRAINT instrument_plays_fk
FOREIGN KEY (name)
REFERENCES instrument (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE sounds ADD CONSTRAINT instrument_sounds_fk
FOREIGN KEY (name)
REFERENCES instrument (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE musician ADD CONSTRAINT address_musician_fk
FOREIGN KEY (addressID)
REFERENCES address (addressID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE plays ADD CONSTRAINT musician_plays_fk
FOREIGN KEY (ssn)
REFERENCES musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE performs ADD CONSTRAINT musician_performs_fk
FOREIGN KEY (ssn)
REFERENCES musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE song ADD CONSTRAINT musician_song_fk
FOREIGN KEY (ssn_author)
REFERENCES musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE album ADD CONSTRAINT musician_album_fk
FOREIGN KEY (ssn)
REFERENCES musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE song ADD CONSTRAINT album_song_fk
FOREIGN KEY (albumID)
REFERENCES album (albumID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE sounds ADD CONSTRAINT song_sounds_fk
FOREIGN KEY (title)
REFERENCES song (title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE performs ADD CONSTRAINT song_performs_fk
FOREIGN KEY (title)
REFERENCES song (title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
