CREATE table Viewer(
 ID int primary key,
name nvarchar(40) not null,
female bit default 0,
age int
)

CREATE table Movie(
 ID int identity(1,1) primary key,
 MovieName nvarchar(40) not null,
 family_friendly bit,
genre nvarchar(20) not null
)

CREATE table Comment(
 ID int identity(1,1) primary key,
 comment nvarchar(100) not null,
 likes int default 0,
 viewer_id int foreign key references Viewer,
 movie_id int foreign key references Movie
)


INSERT into Viewer(ID, name, female, age) values 
(1, 'Jessica', 1, 15),
(2, 'Steven', 0, 24);
insert into Viewer(ID, name) values (3, 'Jeff');
insert into Viewer(ID, name, female, age) values
(4, 'Charlie', 1, 10),
(5, 'Andy', 0, 54),
(6, 'Karol', 1, 40);

INSERT into Movie(MovieName, family_friendly, genre) values 
('Pub Hole', 0, 'Fantasy'),
('The Mechanism', 1, 'Fantasy'),
('Lab 101', 0, 'Drama'),
('Bunker of the Union',1, 'Drama'),
('Safe Mile', 1, 'Drama');

INSERT into Comment(comment, likes, viewer_id, movie_id) values 
('That girl is coooool', 10, 5, 2),
('Main character is a ****', 2, 1, 1),
('Bad', 0, 1, 2),
('Loved it!', 11, 5, 3),
('Cmon thats just trash rly', 0, 2, 2),
('Good one, will recommend.', 82, 5, 2),
('no cats hate it', 0, 4, 5),
('I mean its good but not that good...', 9, 6, 2),
('Hey, Im writing a fic about this, hmu if u wanna read!', 1, 1, 4),
('Not agaaain', 15, 5, 1),
('Come to rewatch it every once in  while, still great', 57, 3, 3),
('Oh right, they eat babies', 3, 6, 4);

INSERT into Comment values
('Gosh no, I meant to say flies**', 3, 6, 4),
('Watch it, its the best movie really', 4, 3, 2),
('WHY DID HE DIE NOOO', 76, 1, 5),
('I like drama, but this is too much', 7, 6, 5),
('mc is boriiinggg', 2, 4, 4),
('Thats a ****** movie', 2, 1, 4),
('Does this ******* website have good movies at all??',11, 1, 3),
('Whoever likes this is a ******', 11, 1, 5),
('AND who wrote this is also a ******', 21, 1, 5),
('You can feel the drama!', 18,  5, 5);

INSERT into Comment (comment, viewer_id, movie_id) values ('mom wont let me watch thisss whyyy', 4, 3);


SELECT * FROM Comment WHERE viewer_id=1 AND comment LIKE '%*%' ORDER BY movie_id, likes DESC;
--Tiek atlasīti visi ieraksti no tabulas "Comment", kur laukā "viewer_id" ir skatītāja id 1, un laukā "comment" parādās simbols '*' jebkurā pozīcijā. Iegūtie ieraksti(5) tiek sakārtoti pēc lauka "movie_id" augošā secībā un pēc tam pēc lauka "likes" dilstošā secībā.


SELECT  Viewer.name, Movie.MovieName, comment FROM Comment
  JOIN Movie ON Movie.id = Comment.movie_id
  JOIN Viewer ON Viewer.id = Comment.viewer_id
  ORDER BY Viewer.name, Movie.MovieName, Comment.id; 
 --Tiek iegūtas trīs kolonnas "name", "MovieName" un "comment" no dažādām tabulām, 
 --tabulas "Comment" un "Movie" tiek apvienotas tur, kur lauks "id" no "Movie" sakrīt ar lauku "movie_id" no "Comment", 
 --rezultāts ir apvienots ar tabulu "Viewer" tur, kur "id" no "Viewer" sakrīt ar "viewer_id" no pirmajā rezultāta.


DELETE FROM Comment;
DELETE FROM Movie;
DELETE FROM Viewer;
DROP TABLE Comment;
DROP TABLE Movie;
DROP TABLE Viewer;
