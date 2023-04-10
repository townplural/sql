create table if not exists List_of_genres (
	genre_id serial primary key,
	genre_name text unique 
);

create table if not exists List_of_artists (
	artist_id serial primary key,
	name text
);


create table if not exists List_of_albums (
	album_id serial primary key,
	year integer,
	name text
);

create table if not exists List_of_tracks(
	track_id serial primary key,
	album_id INTEGER not null,
	foreign key (album_id) references List_of_albums(album_id),
	name text,
	duration integer
);


create table if not exists List_of_compilations (
	compilation_id serial primary key,
	name text,
	year integer
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
