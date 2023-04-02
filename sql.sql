create table if not exists List_of_genres (
genre_id serial primary key,
genre_name text unique
);

create table if not exists List_of_artists (
artist_id serial primary key,
name text
);

create table if not exists List_of_tracks(
track_id serial primary key,
album_id INTEGER not null,
name text,
duration integer check(duration > 15)
);

create table if not exists List_of_albums (
album_id serial primary key,
year date check(year>2000),
name text
);

create table if not exists List_of_compilations (
compilation_id serial primary key,
name text,
year date
);

create table if not exists GenreArtist (
genre_id INTEGER not null references List_of_genres (genre_id),
artist_id INTEGER not null references List_of_artists (artist_id),
primary key (genre_id, artist_id)
);

create table if not exists ArtistAlbum (
artist_id INTEGER not null references List_of_artists (artist_id),
album_id INTEGER not null references List_of_albums (album_id),
primary key (album_id, artist_id)
);

create table if not exists TrackCompilation (
compilation_id INTEGER references List_of_compilations (compilation_id),
track_id INTEGER references List_of_tracks (track_id),
primary key (track_id, compilation_id)
);