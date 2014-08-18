create table restoMenu_List(

	menu_id text primary key,
	menuprice int,
	menutype text, --(Ex.: Beverages, Desert, Appetizer, etc)

);

create table restoMenu_Ordered(

	
	table_id int primary key,
	menu_id int references restoMenu_List(menu_id)

);

insert into restoMenu_List(menu_id, menuprice, menutype) values ("Fried Chicken", 50, "Chicken");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Roasted Beef", 85, "Beef");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Liempo", 75, "Pork");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Mango Float", 35, "Desert");
insert into restoMenu_List(menu_id, menuprice, menutype) values ("Coca Cola", 35, "Beverages");

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
