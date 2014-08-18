create table restoMenu_List(

	menu_id text primary key,
	menuprice int, --in dollars
	menutype text, --(Ex.: Beverages, Desert, Appetizer, etc)

);

create table restoMenu_Ordered(

	
	table_id int primary key,
	menu_id int references restoMenu_List(menu_id)

);

insert into restoMenu_List(menu_id, menuprice, menutype) values ("Bruschetta con Crema di Agliotoa", 8, "Antipasti");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Spiedini di Albicocca al Proscuitto Crudo", 9, "Antipasti");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Tortino di Gorgonzola", 8, "Antipasti");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Zuppa di Giorno", 5, "Zuppa e Insalata");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Minestrone Piemontese", 5, "Zuppa e Insalata");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Zuppa de Pesce", 8, "Zuppa e Insalata");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Insalata Mista", 5, "Zuppa e Insalata");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Insalata Fagioli", 6, "Zuppa e Insalata");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Margherita", 11, "Pizza");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Sicilian", 14, "Pizza");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Chicken Florentine", 16, "Pizza");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Rigatoni Alla Siciliana", 12, "Pasta");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Paglia e Fieno", 14, "Pasta");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Orecchiette con Rapini", 14, "Pasta");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Pappardelle con Sugo di Coniglio", 15, "Pasta");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Chocolate Zabaglione Cake", 6, "Dolci");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Zuccotto", 6, "Dolci");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Tira Misu", 6, "Dolci");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Sparkling Water", 3, "Bevande");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Soda", 2, "Bevande");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Coffee and Brewed Decaf", 2, "Bevande");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Cappuccino or Americano", 3, "Bevande");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Ossobuco", 32, "I Secondi");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Rigatoni con Pollo", 22, "I Secondi");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Red Snapper Mango", 30, "I Secondi");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Ostriche allo Champagne", 26, "I Secondi");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Bistecca Diana", 28, "I Secondi");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Fettuccine Carbonara", 24, "I Secondi");


--controller

create or replace
	function addOrder(p_table_id int,p_menu_id int)
	returns text as
$$
declare
	v_table_id int;

begin
	select into v_table_id table_id from restoMenu
		where v_table_id = p_table_id;

	insert into restoMenu_Ordered(table_id, menu_id) values (p_table_id, p_menu_id);

	return 'OK';
end
$$

--view

create or replace
	function get_restoMenu_Ordered_perid(in int, out int, out text)
returns setof record as
$$
	select * from restoMenu_Ordered
	where table_id = $1;

$$

language 'sql';

create or replace
	function get_restoMenu_Ordered(out int, out text)
returns setof record as
$$
	select * from restoMenu_Ordered;

$$

language 'sql';

create or replace
	function get_restoMenu_List(out text, out int, out text)
returns setof record as
$$
	select * from restoMenu_List;

$$

language 'sql';
-- How to use:
-- select * from get_restoMenu_Ordered_perid(1);
-- select * from get_restoMenu_Ordered();
-- select * from get_restoMenu_List();
