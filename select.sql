-- Название и продолжительность самого длительного трека
SELECT track_name, track_duration
FROM Tracks
ORDER BY track_duration DESC
LIMIT 1;


-- Названия треков, продолжительность которых не менее 3,5 минут
SELECT track_name
FROM Tracks
WHERE track_duration >= 210;


-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name
FROM Collections
WHERE collection_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT artist_name
FROM Artists
WHERE artist_name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT track_name
FROM Tracks
WHERE track_name LIKE '% my %';

-- Количество исполнителей в каждом жанре
SELECT Genres.genre_name, COUNT(artists_genres_map.artist_id) AS artist_count
FROM Genres
JOIN artists_genres_map ON Genres.genre_id = artists_genres_map.genre_id
GROUP BY Genres.genre_name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.track_id) track_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.album_id
WHERE a.album_year between 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.album_name, AVG(t.track_duration) AS average_duration
FROM Albums a
JOIN Tracks t ON a.album_id = t.album_id
GROUP BY a.album_name;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.artist_name
FROM Artists ar
WHERE ar.artist_id NOT IN (
    SELECT DISTINCT aam.artist_id
    FROM artists_albums_map aam
    JOIN Albums al ON aam.album_id = al.album_id
    WHERE al.album_year = 2020
);

-- Названия сборников, в которых присутствует The Beach Boys
SELECT DISTINCT c.collection_name
FROM Collections c
JOIN tracks_collections_map tcm ON c.collection_id = tcm.collection_id
JOIN Tracks t ON tcm.track_id = t.track_id
JOIN Albums a ON t.album_id = a.album_id
JOIN artists_albums_map aam ON a.album_id = aam.album_id
JOIN Artists ar ON aam.artist_id = ar.artist_id
WHERE ar.artist_name = 'The Beach Boys';