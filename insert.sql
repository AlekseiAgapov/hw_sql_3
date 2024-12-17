INSERT INTO Artists (artist_name) VALUES
('The Beach Boys'),
('Beatles'),
('Portugal. The Man'),
('Electric Light Orchestra');

INSERT INTO Albums (album_name, album_year) VALUES
('That’s Why God Made the Radio', 2012),
('Sgt. Pepper’s Lonely Hearts Club Band', 1968),
('Woodstock', 2019),
('Out of the Blue', 1977);

INSERT INTO artists_albums_map (artist_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO Tracks (track_name, track_duration, album_id) VALUES
('That’s why god made the radio', 200, 1),
('Spring vacation', 175, 1), 
('With a little help from my friends', 210, 2),
('Strawberry fields forever', 250, 2),
('Feel it still', 163, 3),
('Mister blue sky', 420, 4);

INSERT INTO Genres (genre_name) VALUES
('Rock'),
('Pop'),
('Alternative');

INSERT INTO artists_genres_map (artist_id, genre_id) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 1);

INSERT INTO Collections (collection_name, collection_year) VALUES
('Greatest Hits Of All Times', 2020),
('Classic Rock Collection', 2019),
('Summer Vibes', 2017),
('ELO Essentials', 2020);

INSERT INTO tracks_collections_map (track_id, collection_id) VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 1),
(4, 2),
(5, 3),
(6, 1),
(6, 4);