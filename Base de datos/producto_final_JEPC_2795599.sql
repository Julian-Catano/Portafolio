-- Creamos la base de datos 
DROP DATABASE IF EXISTS LIBRERIAjulian;
CREATE DATABASE LIBRERIAjulian;
USE LIBRERIAjulian;

-- creo la tabla de las categorias de los libros
create table tbl_categorias(
	id_categoria int auto_increment not null,
    categoria varchar(40) not null,
    primary key(id_categoria)
);
-- creo la tabla para los clientes
create table tbl_clientes(
	id_cliente int auto_increment not null,
    identificacion varchar(11) not null,
    nombres varchar(25) not null,
    apellidos varchar(25) not null,
    telefono varchar(12) not null,
    direccion varchar(100),
    correo_electronico varchar(100) not null,
    primary key(id_cliente)
);
-- claramente creo la tabla de los autores de los libros
create table tbl_autores(
	id_autor int auto_increment not null,
    nombres varchar(25) not null,
    apellidos varchar(25) not null,
    primary key(id_autor)
);
-- creo la tabla para asignarle los 52 libros despues
create table tbl_libros(
	isbn int not null,
    titulo varchar(125) not null,
    fecha_pub date not null,
    precio int not null,
    portada text,
    cantidad_stock int not null check(cantidad_stock>=0),
    categoria INT NOT NULL,
    foreign key(categoria) references tbl_categorias(id_categoria),
    primary key(isbn)
);
-- creo la tabla para saber que autor escribio cual libro 
create table tbl_libro_por_autor(
	id_autor int not null,
    isbn int not null,
    primary key(id_autor, isbn),
    foreign key(id_autor) references tbl_autores(id_autor),
	foreign key(isbn) references tbl_libros(isbn)
	
);
-- creo la tabla para los pedidos de los clientes, para saber el id, el numero de pedido la cantidad, el isbn, etc.
create table tbl_pedido_cliente(
	id_pedido int not null auto_increment,
    isbn int not null,
    id_cliente int not null,
    nro_pedido int not null,
    fecha_pedido date not null,
    cantidad int not null default 1,
    subtotal int not null,
    primary key(id_pedido,isbn),
    foreign key(id_cliente)references tbl_clientes(id_cliente),
    foreign key(isbn)references tbl_libros(isbn)
);

-- inserto las catgorias de cada uno de los libros que voy a insertar
insert into tbl_categorias values
		(null, "Accion y aventuras" ),
        (null, "terror"),
        (null, "ficcion moderna"),
        (null, "suspenso"),
        (null, "romance"),
        (null, "narrativa"),
        (null, "novela"),
        (null, "infantil"),
        (null, "economia"),
        (null, "historia"),
        (null, "poemas"),
        (null, "filosofia"),
        (null, "literatura");

-- inserto los autores que nos dio el profesro mas los otros dies 
insert into tbl_autores values
		(null, "Marc","Cerasini"),
        (null, "Julio","Verne"),
        (null, "Edgar","Allan Poe"),
        (null, "Mary","Wollstonecraft Shelley"),
        (null, "Ben","Mezrich"),
        (null, "Bram","Stoker"),
        (null, "Bruno","Nievas"),
        (null, "César","García Muñoz"),
        (null, "Armando","Rodera"),
        (null, "Jane","Austen"),
        (null, "Emily","Bronte"),
        (null, "Alejandro","Dumas"),
        (null, "Gabriel","García Márquez"),
        (null, "Nikos","Kazantzakis"),
        (null, "Raymond","Carver"),
        (null, "Umberto","Eco"),
        (null, "oscar","wilde"),
        (null, "franz","kafka"),
        (null, "stephen","king"),
        (null, "miguel","de cervantes"),
        (null, "leon","tolstoi"),
        (null, "paulo","coehlo"),
        (null, "virginia","woolf"),
        (null, "william","shakespeare"),
        (null, "james","joyce"),
        (null, "herman","melville");
-- inserto los 52 libros 
insert into tbl_libros values
		(3720,"Operation Hell Gate","2005-09-27",48000, " ", 6, 1),
        (6026, "Wolverine: Weapon X Omnibus", "2020/12/01",71400," ",4, 1),
        -- 
        (3285, "Miguel Strogoff", "2001-12-10",65900," ",3,1),
        (3814, "La isla misteriosa", "1875/11/15", 57000," ", 8, 8),
        --
        (5660, "el gato negro", "2001/05/25", 52200," ",7, 2),
        (0306, "LAS AVENTURAS DE ARTHUR GORDON PYM", "2019/06/04", 66400," ",4,2),
        --
        (4982,"frankestein","1990/03/01",38000," ",3,2),
        (1944,"la noche de los mounstros", "2020/07/06", 45600," ",2,2),
        --
        (3853,"sexo en la luna ","2011/06/11",24700," ",6,3),
        (2929, "la red antisocial","2022/03/09",24700," ",1,9),
        --
        (4157,"dracula","1999/04/10",46800," ",2,2),
        (7902, "la dama del sudario","2022/03/01", 80700," ",4,2),
        --
        (4289,"realidad aumentada","2001/03/13,",35200," ",7,4),
        (5965,"lo que el hielo atrapa","2015/01/26",60000," ",2,7),
        --
        (4422,"juicio final, sangre en el cielo","2009/05/30",40000," ",3,4),
        (6547,"HISTORIA DE UN ESTEREOTIPO","2009/03/02",41200, " ", 4,10),
        --
        (4665, "el enigma de los vencidos", "2000/11/25",42000, " ", 3,4 ),
        (5384, "el aroma del miedo","2017/09/05",59500," ", 2,2),
        --
        (5786,"orgullo y prejuicio","2003/09/25",36100," ",4,5),
        (8790,"sensatez y sentimiento","2022/06/16",75000," ",3,6),
        --
        (6034,"Cumbres Borrascosas","1998/11/25",60800," ",1,5),
        (7624,"poemas","2018/09/14", 61700," ",2,11),
        --
        (6180,"la dama de las camelias","1995/07/28",57600," ",3,5),
        (8264,"el conde de montecristo","2020/02/14",61750," ",5,6),
        --
        ( 7291, "cien años de soledad","1990/04/27",39500," ",2,6),
        ( 2437, "Crónica de una Muerte Anunciada","2016/07/15",48000," ",4,6),
        --
        (1282,"Zorba, el Griego","2010/11/25",38500," ",7,6),
        (6324,"cristo e nuevo crucificado","2018/10/22",99000," ",3,6),
        --
        ( 2835,"Cathedral","2004/08/15",25700," ",2,6),
        (2523,"bajo una luz marina","2005/10/12",41800," ",5,11),
        --
        (8807,"El Nombre de la Rosa","2011/05/24",68000," ",2,7),
        (2209,"DE LA ESTUPIDEZ A LA LOCURA","2011/05/24",57000," ",3,12),
        --
        (6250, "una casa de granadas","1881/01/01",16000," ", 4,11),
        (5655, "el fantasma de caterville","1887/01/01",16000," ",7,6),
        --
        (4403,"carta al padre","1919/11/01",16000," ",5,6),
        (3459,"la metamorfosis","1915/01/01",3700," ",1,10),
        --
        (3932,"cementerio de animales","1983/01/01",36000," ",2,2),
        (1120,"holly","2023/09/21",50000," ",5,6),
        --
        (3963,"don quijote de la mancha","1605/05/25",90000," ",9,8),
        (7622,"VIAJE DEL PARNASO Y POESÍAS SUELTAS","2016/06/01",8500," ",7,11),
        --
        (3097,"GUERRA Y PAZ","1869/01/01",8500," ",6,6),
        (7711,"ANNA KARÉNINA","1878/01/01",67900," ",5,6),
        --
        (1867,"las valkirias","1992/01/01",50000," ",3,6),
        (4264,"EL MANUSCRITO ENCONTRADO EN ACCRA","2012/11/13",64000," ",2,10),
        --
        (7549,"UNA HABITACIÓN PROPIA","1929/08/24",32900," ",7,8),
        (1723,"la señora dolloway","1925/06/14",12000," ",1,6),
        --
        (7692,"HAMLET, PRÍNCIPE DE DINAMARCA","1603/01/01",22900," ",3,10),
        (2973,"LA TEMPESTAD","2005/09/22",62000," ",3,6),
        --
        (0399,"los muertos","2022/11/03",80000," ",4,13),
        (1898,"DUBLINESES","2021/12/28",104000," ",3,13),
        --
        (5178,"BARTLEBY, EL ESCRIBIENTE","2021/03/03",41800," ",1,13),
        (3220,"MOBY DICK","1995/01/01",41800," ",4,6);
-- veo que si hayan quedado insertados en la tabla y sin ningun error 
select * from tbl_libros; 


-- inserto los 6 clientes que dijo el profesor siendo el primero yo con mis datos reales 
insert into tbl_clientes values
	(null,"1025887629","julian estiven","posso cataño","3042727490"," ","julianestivenposso@gmail.com"),
    (null,"39328075","zoraida patricia","cataño ortega","3017684676"," ","patriciaOrtega03@gmail.com"),
    (null,"1033659812","karen vanessa","posso cataño"," 3053914341"," ","karenposso33@gmail.com"),
    (null,"1020336598","geronimo","trujillo bustamante","3104049506"," ","gtutos3@gmail.com"),
    (null,"1032020692","maria fernanda","giraldo cataño","3012406646"," ","mariafernanda64@gmail.com"),
    (null,"1000036661","daniela alejandra", "posso cataño"," 3016125461"," ","danielakatano@gmail.com");
-- veo que no haya ningun error y que si esten insertados 
    select *from tbl_clientes;
-- elimino 3 de los 6 clientes 
DELETE FROM tbl_clientes
WHERE id_cliente = 6;
DELETE FROM tbl_clientes
WHERE id_cliente = 5;
DELETE FROM tbl_clientes
WHERE id_cliente = 4;

-- y hago un pedido por cada cliente con mas 2 o mas libros de por medio 

insert into tbl_pedido_cliente values
	(null,"1867",1,1,"2023/09/15",2,100000),
    (null,"3220",2,2,"2023/08/10",4,167200),
    (null,"5178",3,3,"2023/09/10",3,125400),
    (null,"1898",1,4,"2023/09/14",3,312000);
    
    
-- miro que si se hayan insertado correctamente 
	select * from tbl_pedido_cliente;

-- inserto estos datos para saber que autor escribio cuales libros de los que tengo registrados 
insert into tbl_libro_por_autor values
	(1,"3720"),
    (1,"6026"),
    (2,"3285"),
    (2,"3814"),
    (3,"5660"),
    (3,"0306"),
    (4,"4982"),
    (4,"1944"),
    (5,"3853"),
    (5,"2929"),
    (6,"4157"),
    (6,"7902"),
    (7,"4289"),
    (7,"5965"),
    (8,"4422"),
    (8,"6547"),
    (9,"4665"),
    (9,"5384"),
    (10,"5786"),
    (10,"8790"),
    (11,"6034"),
    (11,"7624"),
    (12,"6180"),
    (12,"8264"),
    (13,"7291"),
    (13,"2437"),
    (14,"1282"),
    (14,"6324"),
    (15,"2835"),
    (15,"2523"),
    (16,"8807"),
    (16,"2209"),
    (17,"6250"),
    (17,"5655"),
    (18,"4403"),
    (18,"3459"),
    (19,"3932"),
    (19,"1120"),
    (20,"3963"),
    (20,"7622"),
    (21,"3097"),
    (21,"7711"),
    (22,"1867"),
    (22,"4264"),
    (23,"7549"),
    (23,"1723"),
    (24,"7692"),
    (24,"2973"),
    (25,"0399"),
    (25,"1898"),
    (26,"5178"),
    (26,"3220");
    
-- compruebo si, si estan bien y si se insertaron correctamente 
select * from tbl_libro_por_autor;
-- y ya eso seria todo