CREATE TABLE IF NOT EXISTS Genres (
	genre_id int primary key,
	genre_name Varchar(64) not null
	);
INSERT INTO Genres(genre_id, genre_name)
values
(1, 'genre1'),
(2, 'genre2'),
(3, 'genre3'),
(4, 'genre4'),
(5, 'genre5');

CREATE TABLE IF NOT EXISTS Exutor (
	exutor_id int PRIMARY key,
	exutor_name varchar(128) not null
	);

INSERT INTO Exutor(exutor_id, exutor_name)
values
(1, 'exutor1'),
(2, 'exutor2'),
(3, 'exutor3'),
(4, 'exutor4'),
(5, 'exutor5'),
(6, 'exutor6'),
(7, 'exutor7'),
(8, 'exutor8');

CREATE TABLE IF NOT EXISTS Exutor_genres (
	genre_id int REFERENCES Genres(genre_id),
	exutor_id int REFERENCES Exutor(exutor_id),
	primary key(genre_id, exutor_id)
	);

INSERT INTO Exutor_genres(genre_id, exutor_id)
values
(1, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 5),
(1, 6),
(2, 7),
(3, 8);


CREATE TABLE IF NOT EXISTS Albums (
	Album_id int primary key,
	Title VARCHAR(80),
	year_title int
	);
INSERT INTO Albums(Album_id, Title, year_title)
values
(1, 'title1', 1970),
(2, 'title2', 1980),
(3, 'title3', 1990),
(4, 'title4', 2000),
(5, 'title5', 2018),
(6, 'title6', 2020),
(7, 'title7', 2022),
(8, 'title8', 2015);

CREATE TABLE IF NOT EXISTS Album_Exutor (
	Album_id int REFERENCES Albums(Album_id),
	exutor_id int REFERENCES Exutor(exutor_id),
	CONSTRAINT pk PRIMARY KEY (Album_id, exutor_id)
	);
INSERT INTO Album_Exutor(Album_id, exutor_id)
values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

CREATE TABLE IF NOT EXISTS Songs (
	Song_id int PRIMARY KEY,
	Song_name VARCHAR(60),
	title varchar(80),
	Duration int
	);
INSERT INTO Songs(Song_id, Song_name, title, Duration)
values
(1, 'song_name1', 'title1', 3.5 ),
(2, 'song_name2', 'title2', 4.5),
(3, 'song_name3', 'title3', 2.5),
(4, 'song_name4', 'title4', 6.5),
(5, 'song_name5', 'title5', 3.3),
(6, 'song_name6', 'title6', 6.1),
(7, 'song_name7', 'title7', 3.7),
(8, 'song_name8', 'title8', 2.8),
(9, 'song_name9', 'title9', 3.7),
(10, 'song_name10', 'title10', 1.5),
(11, 'song_name11', 'title11', 5.5),
(12, 'song_name12', 'title12', 4.2),
(13, 'song_name13', 'title13', 4.4),
(14, 'song_name14', 'title14', 3.3),
(15, 'my song_name15', 'title15', 3.5);


CREATE TABLE IF NOT EXISTS Albums_songs (
	Album_id int REFERENCES Albums(Album_id),
	Song_id int references Songs(Song_id),
	primary key(Album_id, Song_id)
	);
INSERT INTO Albums_songs(Album_id, Song_id)
values
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(3, 4),
(5, 5),
(5, 6),
(5, 8),
(5, 9),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(7, 14),
(8, 15);

CREATE TABLE IF NOT EXISTS Collection (
	Collection_id int PRIMARY key,
	Collection_name varchar(80) not null,
	year_collection int not null
	);
INSERT INTO Collection(Collection_id, Collection_name, year_collection)
values
(1, 'Collection_name1', 2021 ),
(2, 'Collection_name2', 2022),
(3, 'Collection_name3', 2019),
(4, 'Collection_name4', 2018),
(5, 'Collection_name5', 2022),
(6, 'Collection_name6', 2017),
(7, 'Collection_name7', 2016),
(8, 'Collection_name8', 2015);

CREATE TABLE IF NOT EXISTS Collection_song (
	Collection_id int references Collection(Collection_id),
	Song_id int references Songs(Song_id),
	primary key(Collection_id, Song_id)
	);

	INSERT INTO Collection_song(Collection_id, Song_id)
values
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 8),
(5, 9),
(6, 10),
(7, 11),
(7, 12),
(7, 13),
(8, 14),
(8, 15);

select year_title from Albums
where year_title = 2018;

select Song_name from songs
where Song_name like '%my%';

select year_collection from collection
where  year_collection between 2018 and 2020;

select Song_name from songs
where Duration >= 3.5;

select Duration, Song_name from Songs
order by Duration desc
limit 1

select exutor_name from exutor
where exutor_name not like (' ');

