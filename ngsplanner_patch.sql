/*9 Aug Database Patch*/
alter table potential add column description text;
alter table weapon_existence_data add column icon text;
alter table weapon_type add column shorthand text;
alter table weapon_existence_data add column special_name text;
alter table potential drop column description;
alter table potential_data add column description text;
alter table photon_art add column icon text;
alter table users add column recovery_hash text;
alter table armor rename column pb_gauge_build to slot;
alter table armor add column battle_power_value text;
CREATE TABLE "skill_tree_data"("id" SERIAL UNIQUE PRIMARY KEY,"class_id" int,"data" text,"skill_data" text,"line_color" text,"line_width" int,"gridsizex" int,"gridsizey" int,"gridpaddingx" int,"gridpaddingy" int);
ALTER TABLE "skill_tree_data" ADD FOREIGN KEY ("class_id") REFERENCES "class" ("id");
alter table skill_tree_data add column halflineheight int;