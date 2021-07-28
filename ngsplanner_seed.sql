delete from food_mult;
delete from food;
delete from armor;
delete from augment;
delete from augment_type;
delete from skill_data;
delete from skill;
delete from skill_type;
delete from builds;
delete from users;
delete from roles;
delete from weapon_existence_data;
delete from class_weapon_type_data;
delete from class_level_data;
delete from potential_data;
delete from weapon;
delete from weapon_type;
delete from class;
delete from potential;

insert into food_mult(amount,potency,pp,dmg_res,hp,pp_consumption,pp_recovery,weak_point_dmg,hp_recovery)
	values(0,1,0,1,1,1,1,1,1);
insert into food_mult(amount,potency,pp,dmg_res,hp,pp_consumption,pp_recovery,weak_point_dmg,hp_recovery)
	values(1,1.05,10,1.05,1.05,1,1,1,1);

insert into food(material,potency,pp,dmg_res,hp,pp_consumption,pp_recovery,weak_point_dmg,hp_recovery)
	values('Rich Aelio Meat',true,false,false,false,true,false,false,false);
insert into food(material,potency,pp,dmg_res,hp,pp_consumption,pp_recovery,weak_point_dmg,hp_recovery)
	values('Light Aelio Meat',true,false,false,false,false,true,false,false);
	
insert into class(name,icon) values('Hunter','/icons/UINGSClassHu.png');
insert into class(name,icon) values('Fighter','/icons/UINGSClassFi.png');
insert into class(name,icon) values('Ranger','/icons/UINGSClassRa.png');
insert into class(name,icon) values('Gunner','/icons/UINGSClassGu.png');
insert into class(name,icon) values('Force','/icons/UINGSClassFo.png');
insert into class(name,icon) values('Techter','/icons/UINGSClassTe.png');

insert into weapon_type(name,icon) values('Sword','/icons/NGSUIItemSwordMini.png');
insert into weapon_type(name,icon) values('Spear','/icons/NGSUIItemPartizanMini.png');
insert into weapon_type(name,icon) values('Wired Lance','/icons/NGSUIItemWiredLanceMini.png');
insert into weapon_type(name,icon) values('Twin Dagger','/icons/NGSUIItemTwinDaggersMini.png');
insert into weapon_type(name,icon) values('Double Saber','/icons/NGSUIItemDoubleSaberMini.png');
insert into weapon_type(name,icon) values('Knuckles','/icons/NGSUIItemKnuckleMini.png');
insert into weapon_type(name,icon) values('Assault Rifle','/icons/NGSUIItemAssaultRifleMini.png');
insert into weapon_type(name,icon) values('Launcher','/icons/NGSUIItemLauncherMini.png');
insert into weapon_type(name,icon) values('Twin Machine Guns','NGSUIItemTwinMachinegunsMini.png');
insert into weapon_type(name,icon) values('Rod','/icons/NGSUIItemRodMini.png');
insert into weapon_type(name,icon) values('Talis','/icons/NGSUIItemTalisMini.png');
insert into weapon_type(name,icon) values('Wand','/icons/NGSUIItemWandMini.png');
insert into weapon_type(name,icon) values('Legacy','');

insert into potential(name,icon) values('Recycler Unit','/icons/NGSUIItemPotentialAbility.png');
insert into potential(name,icon) values('Indomitable Unit','/icons/NGSUIItemPotentialAbility.png');
insert into potential(name,icon) values('Defensive Formation','/icons/NGSUIItemPotentialAbility.png');
insert into potential(name,icon) values('Offensive Formation','/icons/NGSUIItemPotentialAbility.png');
insert into potential(name,icon) values('Bastion Unit','/icons/NGSUIItemPotentialAbility.png');
insert into potential(name,icon) values('Meditation Unit','/icons/NGSUIItemPotentialAbility.png');
insert into potential(name,icon) values('Mustered Might Unit','/icons/NGSUIItemPotentialAbility.png');
insert into potential(name,icon) values('Dynamo Unit','/icons/NGSUIItemPotentialAbility.png');
insert into potential(name,icon) values('Berserk Unit','/icons/NGSUIItemPotentialAbility.png');
insert into potential(name,icon) values('Wellspring Unit','/icons/NGSUIItemPotentialAbility.png');
insert into potential(name,icon) values('Endurance Unit','/icons/NGSUIItemPotentialAbility.png');

insert into class_level_data(class_id,level,hp,atk,def)
	values((SELECT id from class WHERE name='Hunter'),1,300,450,304);
insert into class_level_data(class_id,level,hp,atk,def)
	values((SELECT id from class WHERE name='Hunter'),2,303,459,309);
insert into class_level_data(class_id,level,hp,atk,def)
	values((SELECT id from class WHERE name='Fighter'),1,280,454,301);
insert into class_level_data(class_id,level,hp,atk,def)
	values((SELECT id from class WHERE name='Ranger'),1,240,448,300);
	
insert into class_weapon_type_data(class_id,weapon_type_id)
	values((SELECT id from class WHERE name='Hunter'),(SELECT id from weapon_type WHERE name='Sword'));
insert into class_weapon_type_data(class_id,weapon_type_id)
	values((SELECT id from class WHERE name='Hunter'),(SELECT id from weapon_type WHERE name='Spear'));
insert into class_weapon_type_data(class_id,weapon_type_id)
	values((SELECT id from class WHERE name='Hunter'),(SELECT id from weapon_type WHERE name='Wired Lance'));
insert into class_weapon_type_data(class_id,weapon_type_id)
	values((SELECT id from class WHERE name='Fighter'),(SELECT id from weapon_type WHERE name='Twin Dagger'));
insert into class_weapon_type_data(class_id,weapon_type_id)
	values((SELECT id from class WHERE name='Fighter'),(SELECT id from weapon_type WHERE name='Double Saber'));
insert into class_weapon_type_data(class_id,weapon_type_id)
	values((SELECT id from class WHERE name='Fighter'),(SELECT id from weapon_type WHERE name='Knuckles'));
	
insert into weapon(name,rarity,level_req,atk,potential_id,variance,base_affix_slots,drop_info,pb_gauge_build,icon)
	values('Primm',1,1,177,(select id from potential where name='Recycler Unit'),0.7,2,'Central City Item Shop, Common Drop',0,'/icons/uc1iBck.png');
insert into weapon(name,rarity,level_req,atk,potential_id,variance,base_affix_slots,drop_info,pb_gauge_build,icon)
	values('Tzvia',2,4,195,(select id from potential where name='Indomitable Unit'),0.7,2,'Central City Item Shop, Common Drop',0,'/icons/uc1iBck.png');
insert into weapon(name,rarity,level_req,atk,potential_id,variance,base_affix_slots,drop_info,pb_gauge_build,icon)
	values('Primm',1,1,200,(select id from potential where name='Recycler Unit'),0.7,2,'Central City Item Shop, Common Drop',0,'/icons/uc1iBck.png');
	
insert into potential_data(potential_id,level,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from potential where name='Recycler Unit'),1,1.18,1.18,1.18,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0);
insert into potential_data(potential_id,level,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from potential where name='Recycler Unit'),2,1.20,1.20,1.20,0,0,0,0,0,0,0,0,0,0,0,0,0,20,0);
insert into potential_data(potential_id,level,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from potential where name='Indomitable Unit'),1,1.18,1.18,1.18,0,0,0,0,0,0,1.10,0,0,0,0,0,0,10,0);
	
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Sword'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Spear'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Wired Lance'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Twin Dagger'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Double Saber'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Knuckles'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Assault Rifle'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Launcher'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Twin Machine Guns'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Rod'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Talis'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Wand'),(select id from weapon where name='Primm'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Sword'),(select id from weapon where name='Tzvia'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Spear'),(select id from weapon where name='Tzvia'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Wired Lance'),(select id from weapon where name='Tzvia'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Twin Dagger'),(select id from weapon where name='Tzvia'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Double Saber'),(select id from weapon where name='Tzvia'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Knuckles'),(select id from weapon where name='Tzvia'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Assault Rifle'),(select id from weapon where name='Tzvia'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Launcher'),(select id from weapon where name='Tzvia'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Twin Machine Guns'),(select id from weapon where name='Tzvia'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Rod'),(select id from weapon where name='Tzvia'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Talis'),(select id from weapon where name='Tzvia'));
insert into weapon_existence_data(weapon_type_id,weapon_id)
	values((select id from weapon_type where name='Wand'),(select id from weapon where name='Tzvia'));
	
	
insert into roles(name)
	values('Administrator');
insert into roles(name)
	values('Editor');
insert into roles(name)
	values('Guest');
	
insert into users(username,email,password_hash,created_on,roles_id,avatar)
	values('sigonasr2','sigonasr2@gmail.com','ABCDEFG','2021-07-13 04:30+00',(select id from roles where name='Administrator'),'');
insert into users(username,email,password_hash,created_on,roles_id,avatar)
	values('sigonasr3','sigonasr3@gmail.com','ABCDEF','2021-07-14 05:30+00',(select id from roles where name='Editor'),'');
	
insert into builds(users_id,creator,build_name,class1,class2,created_on,last_modified,likes,data)
	values((select id from users where username='sigonasr2'),'sigonasr2','Test Build',(select id from class where name='Ranger'),(select id from class where name='Force'),'2021-07-13 04:30+00','2021-07-13 04:30+00',5,'<DATA STRING>');
insert into builds(users_id,creator,build_name,class1,class2,created_on,last_modified,likes,data)
	values((select id from users where username='sigonasr3'),'sigonasr3','Test Build2',(select id from class where name='Techter'),(select id from class where name='Fighter'),'2021-07-13 06:30+00','2021-07-13 07:30+00',27,'<DATA STRING>');
	
insert into skill_type(name)
	values('Weapon');
insert into skill_type(name)
	values('Armor');
	
insert into skill(name,skill_type_id,icon)
	values('Fixa Attack',(select id from skill_type where name='Weapon'),'/icons/UINGSItemPresetAbility.png');
insert into skill(name,skill_type_id,icon)
	values('Fixa Guard',(select id from skill_type where name='Armor'),'/icons/UINGSItemPresetAbility.png');
insert into skill(name,skill_type_id,icon)
	values('Fixa Termina',(select id from skill_type where name='Weapon'),'/icons/UINGSItemPresetAbility.png');
	
insert into skill_data(skill_id,level,variance,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res)
	values((select id from skill where name='Fixa Attack'),1,0,1.02,1.02,1.02,0,0,0,0,0,0);
insert into skill_data(skill_id,level,variance,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res)
	values((select id from skill where name='Fixa Attack'),2,0,1.03,1.03,1.03,0,0,0,0,0,0);
insert into skill_data(skill_id,level,variance,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res)
	values((select id from skill where name='Fixa Attack'),3,0,1.04,1.04,1.04,0,0,0,0,0,0);
insert into skill_data(skill_id,level,variance,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res)
	values((select id from skill where name='Fixa Guard'),1,0,0,0,0,0,0,0,0,0,1.01);
insert into skill_data(skill_id,level,variance,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res)
	values((select id from skill where name='Fixa Guard'),2,0,0,0,0,0,0,0,0,0,1.02);
insert into skill_data(skill_id,level,variance,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res)
	values((select id from skill where name='Fixa Guard'),3,0,0,0,0,0,0,0,0,0,1.03);
insert into skill_data(skill_id,level,variance,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res)
	values((select id from skill where name='Fixa Termina'),1,0,0,0,0,0,1.05,0,0,0,0);
insert into skill_data(skill_id,level,variance,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res)
	values((select id from skill where name='Fixa Termina'),2,0,0,0,0,0,1.08,0,0,0,0);
insert into skill_data(skill_id,level,variance,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res)
	values((select id from skill where name='Fixa Termina'),3,0,0,0,0,0,1.10,0,0,0,0);
	
insert into augment_type(name,icon)
	values('Stamina','');
insert into augment_type(name,icon)
	values('Spirit','');
insert into augment_type(name,icon)
	values('Might','');
insert into augment_type(name,icon)
	values('Precision','');

insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Stamina'),1,0,5,0,0,0,0,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0,3,0);
insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Stamina'),2,0,10,0,0,0,0,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0,4,0);
insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Stamina'),3,0,15,0,0,0,0,0,0,0,0,0,0,0.09,0,0,0,0,0,0,0,5,0);
insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Spirit'),1,0,0,3,0,0,0,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0,2,0);
insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Spirit'),2,0,0,4,0,0,0,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0,3,0);
insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Spirit'),3,0,0,5,0,0,0,0,0,0,0,0,0,0.09,0,0,0,0,0,0,0,4,0);
insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Might'),1,0,0,0,1.01,0,0,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0,4,0);
insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Might'),2,0,0,0,1.015,0,0,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0,5,0);
insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Might'),3,0,0,0,1.02,0,0,0,0,0,0,0,0,0.09,0,0,0,0,0,0,0,6,0);
insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Precision'),1,0,0,0,0,1.01,0,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0,4,0);
insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Precision'),2,0,0,0,0,1.015,0,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0,5,0);
insert into augment(augment_type_id,level,variance,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,affix_success_rate,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build)
	values((select id from augment_type where name='Precision'),3,0,0,0,0,1.02,0,0,0,0,0,0,0,0.09,0,0,0,0,0,0,0,6,0);
	
insert into armor(name,rarity,level_req,def,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build,icon)
	values('Primm Armor',1,1,8,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,'/icons/20M6Z7t.png');
insert into armor(name,rarity,level_req,def,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build,icon)
	values('Tzvia Armor',2,1,9,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.2,0,'/icons/F0t58xP.png');
insert into armor(name,rarity,level_req,def,hp,pp,mel_dmg,rng_dmg,tec_dmg,crit_rate,crit_dmg,pp_cost_reduction,active_pp_recovery,natural_pp_recovery,dmg_res,all_down_res,burn_res,freeze_res,blind_res,shock_res,panic_res,poison_res,battle_power_value,pb_gauge_build,icon)
	values('Theseus Armor',3,5,10,10,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1.1,0,'/icons/uldt9lR.png');