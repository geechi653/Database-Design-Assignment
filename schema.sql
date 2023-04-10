CREATE DATABASE spotify;

USE spotify;

CREATE TABLE genres (
  genre_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE artists (
  artist_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL
);

CREATE TABLE songs (
  song_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  duration INT UNSIGNED NOT NULL,
  explicit BOOLEAN NOT NULL,
  link VARCHAR(255) NOT NULL,
  artist_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE users (
  user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE playlists (
  playlist_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE playlist_songs (
  playlist_id INT UNSIGNED NOT NULL,
  song_id INT UNSIGNED NOT NULL,
  rank INT UNSIGNED NOT NULL,
  PRIMARY KEY (playlist_id, song_id),
  FOREIGN KEY (playlist_id) REFERENCES playlists (playlist_id),
  FOREIGN KEY (song_id) REFERENCES songs (song_id)
);

CREATE TABLE user_favorites (
  user_id INT UNSIGNED NOT NULL,
  song_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (song_id) REFERENCES songs (song_id)
);

CREATE TABLE song_genres (
  song_id INT UNSIGNED NOT NULL,
  genre_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (song_id, genre_id),
  FOREIGN KEY (song_id) REFERENCES songs (song_id),
  FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
);
