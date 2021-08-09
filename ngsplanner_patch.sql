/*9 Aug Database Patch*/
alter table potential add column description text;
alter table weapon_existence_data add column icon text;
alter table weapon_type add column shorthand text;
alter table weapon_existence_data add column special_name text;