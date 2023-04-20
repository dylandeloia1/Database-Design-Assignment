SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `music_app_db` ;
CREATE SCHEMA IF NOT EXISTS `music_app_db` DEFAULT CHARACTER SET utf8 ;
USE `music_app_db` ;

DROP TABLE IF EXISTS `music_app_db`.`Artist` ;
CREATE TABLE IF NOT EXISTS `music_app_db`.`Artist` (
  `artist_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `music_app_db`.`Favorites` ;
CREATE TABLE IF NOT EXISTS `music_app_db`.`Favorites` (
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `song_id`),
  FOREIGN KEY (`user_id`) REFERENCES `music_app_db`.`User` (`user_id`),
  FOREIGN KEY (`song_id`) REFERENCES `music_app_db`.`Song` (`song_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `music_app_db`.`Genre` ;
CREATE TABLE IF NOT EXISTS `music_app_db`.`Genre` (
  `genre_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `music_app_db`.`Song_Genres` ;
CREATE TABLE IF NOT EXISTS `music_app_db`.`Song_Genres` (
  `song_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`song_id`,`genre_id`),
  FOREIGN KEY (song_id) REFERENCES songs(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `music_app_db`.`Playlist` ;
CREATE TABLE IF NOT EXISTS `music_app_db`.`Playlist` (
  `playlist_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`playlist_id`),
  FOREIGN KEY (`user_id`) REFERENCES `music_app_db`.`User` (`user_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `music_app_db`.`Playlist_Songs` ;
CREATE TABLE IF NOT EXISTS `music_app_db`.`Playlist_Songs` (
  `playlist_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  `rank` INT NULL,
  PRIMARY KEY (`playlist_id`, `song_id`),
  FOREIGN KEY (`playlist_id`) REFERENCES `music_app_db`.`Playlist` (`playlist_id`),
  FOREIGN KEY (`song_id`) REFERENCES `music_app_db`.`Song` (`song_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `music_app_db`.`Song` ;
CREATE TABLE IF NOT EXISTS `music_app_db`.`Song` (
  `song_id` INT NOT NULL AUTO_INCREMENT,
  `artist_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `duration` INT NOT NULL,
  `explicit` INT NOT NULL,
  `link` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`song_id`),
  FOREIGN KEY (`artist_id`) REFERENCES `music_app_db`.`Artist` (`artist_id`),
  FOREIGN KEY (`genre_id`) REFERENCES `music_app_db`.`Genre` (`genre_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `music_app_db`.`User` ;
CREATE TABLE IF NOT EXISTS `music_app_db`.`User` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) UNIQUE NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
