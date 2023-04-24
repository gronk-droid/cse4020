CREATE DATABASE IF NOT EXISTS imdb_movies;
USE imdb_movies;
CREATE TABLE `movies_directors` (
  `director_id` int(11),
  `movie_id` int(11),
  PRIMARY KEY (`director_id`, `movie_id`)
);
CREATE TABLE `movies` (
  `id` int(11),
  `name` varchar(100),
  `year` int(11),
  `rank` float
);
CREATE TABLE `directors` (
  `id` int(11),
  `first_name` varchar(100),
  `last_name` varchar(100)
);
CREATE TABLE `directors_genres` (
  `director_id` int(11) PRIMARY KEY,
  `genre` varchar(100),
  `prob` float
);
CREATE TABLE `roles` (
  `actor_id` int(11),
  `movie_id` int(11),
  `role` varchar(100),
  PRIMARY KEY (`actor_id`, `movie_id`)
);
CREATE TABLE `actors` (
  `id` int(11),
  `first_name` varchar(100),
  `last_name` varchar(100),
  `gender` char(1)
);
CREATE TABLE `movies_genres` (
  `movie_id` int(11) PRIMARY KEY,
  `genre` varchar(100)
);
ALTER TABLE `movies_directors` ADD FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
ALTER TABLE `directors_genres` ADD FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`);
ALTER TABLE `roles` ADD FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`);
ALTER TABLE `roles` ADD FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
ALTER TABLE `movies_genres` ADD FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
ALTER TABLE `movies_directors` ADD FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`);