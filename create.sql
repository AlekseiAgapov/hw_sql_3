CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(100) NOT NULL,
	album_year INTEGER CHECK (album_year BETWEEN 1000 AND 9999)
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(100) NOT NULL,
	track_duration INTEGER,
	album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(100) NOT NULL,
	collection_year INTEGER CHECK (collection_year BETWEEN 1000 AND 9999)
);

CREATE TABLE IF NOT EXISTS tracks_collections_map (
	track_collection_id SERIAL PRIMARY KEY,
	track_id INTEGER NOT NULL REFERENCES Tracks(track_id),
	collection_id INTEGER NOT NULL REFERENCES Collections(collection_id)
);

CREATE TABLE IF NOT EXISTS Artists (
	artist_id SERIAL PRIMARY KEY,
	artist_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS artists_albums_map (
	artist_album_id SERIAL PRIMARY KEY,
	artist_id INTEGER NOT NULL REFERENCES Artists(artist_id),
	album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS artists_genres_map (
	artist_genre_id SERIAL PRIMARY KEY,
	artist_id INTEGER NOT NULL REFERENCES Artists(artist_id),
	genre_id INTEGER NOT NULL REFERENCES Genres(genre_id)
);