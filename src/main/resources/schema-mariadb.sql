drop table if exists videojuego;
drop table if exists distribuidor;

create table videojuego (
    id int primary key auto_increment,
    nombre varchar(200) not null,
    descripcion varchar(3000),
    imagen_url varchar(500)
);

insert into videojuego
(id, nombre,                   descripcion,                                         imagen_url) values
(1, 'Bioshock Infinite',     'Descripcion para videojuego Bioshock Infinite',      'https://upload.wikimedia.org/wikipedia/en/a/a3/Official_cover_art_for_Bioshock_Infinite.jpg'),
(2, 'Insurgency: Sandstorm', 'Descripcion para videojuego Insurgency: Sandstorm', 'https://upload.wikimedia.org/wikipedia/en/a/a0/Insurgency_Sandstorm_cover_art.jpg'),
(3, 'The Witness',           'Descripcion para videojuego The Witness',           'https://upload.wikimedia.org/wikipedia/en/thumb/f/f4/The_Witness_cover.jpg/220px-The_Witness_cover.jpg'),
(4, 'Braid',                 'Descripcion para videojuego Braid',                 'https://upload.wikimedia.org/wikipedia/en/6/6a/Braidlogo.jpg'),
(5, 'Mario Bros',            'Descripcion para videojuego Mario Bros',            'https://i.pinimg.com/originals/86/c0/2e/86c02e32ef3ea0deaa4bca99502e95ed.jpg'),
(6, 'Pacman',                'Descripcion para videojuego Pacman',                'https://cdn.mobygames.com/covers/4355273-pac-man-neo-geo-pocket-color-front-cover.jpg'),
(7, 'Street Fighther',       'Descripcion para videojuego TStreet Fighther',      'https://sm.ign.com/ign_es/game/s/street-fig/street-fighter-30th-annyversary_fyss.jpg'),
(8, 'Sims 4',                'Descripcion para videojuego Sims 4',                'https://cdn.mobygames.com/covers/8027207-the-sims-4-playstation-4-front-cover.jpg');

create table distribuidor (
id int primary key auto_increment,
nombre varchar(200) not null,
sitio_web varchar(500)

);

insert into distribuidor
(id, nombre,                        sitio_web) values
(1, '2K',                           'https://2k.com'),
(2, 'Focus Home Interactive',       'https://www.focus-home.com'),
(3, 'Thekla',                       null),
(4, 'Number One',                   null),
(5,  '505 Games',                    'https://505games.com'),
(6, 'Unknown Wordls Entertainment', 'https://unknownwordls.com'),
(7, 'Campo Santo',                  'https://www.camposanto.com');

alter table videojuego
add column distribuidor_id int,
add foreign key(distribuidor_id) references distribuidor(id);

update videojuego set distribuidor_id = 1 where id in (1, 5);
update videojuego set distribuidor_id = 2 where id in (2);
update videojuego set distribuidor_id = 3 where id in (3);
update videojuego set distribuidor_id = 4 where id in (4);
update videojuego set distribuidor_id = 5 where id in (6);
update videojuego set distribuidor_id = 6 where id in (7);
update videojuego set distribuidor_id = 7 where id in (8);


alter table videojuego
modify distribuidor_id int not null;