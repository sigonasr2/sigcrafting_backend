/*27 Aug Database Patch*/
CREATE TABLE "element" ("id" SERIAL UNIQUE PRIMARY KEY,"name" text);
alter table augment add column element_id int;
alter table augment add column icon text;
alter table augment_type drop column icon;