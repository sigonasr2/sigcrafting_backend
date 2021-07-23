const express = require('express') 
const axios = require('axios') 
var http = require('http');
var https = require('https');
const fs = require('fs');

var key = fs.readFileSync('./projectdivar.com/privkey1.pem');
var cert = fs.readFileSync('./projectdivar.com/cert1.pem');
var options = {
  key: key,
  cert: cert
};

const app = express() 

var server = https.createServer(options, app);
const port = 4504
server.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
const bodyParser = require('body-parser')
const { json } = require('body-parser')
const moment = require('moment');
const Pool = require('pg').Pool 
app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)


let allowCrossDomain = function(req, res, next) {
	res.header('Access-Control-Allow-Origin', "*");
	res.header('Access-Control-Allow-Headers', "*");
	res.header('Access-Control-Allow-Methods', "*");
	next();
  }
  app.use(allowCrossDomain);

const db = 
new Pool({
  user: 'postgres',
  password: '',
  host: 'postgres',
  database: 'ngsplanner',
  port: 5432,
})

const ENDPOINTDATA=[
	{
		endpoint:"class",
		requiredfields:["name"],
		optionalfields:["icon"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"class_level_data",
		requiredfields:["class_id","level","hp","atk","def"],
		optionalfields:[],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"class_weapon_type_data",
		requiredfields:["class_id","weapon_type_id"],
		optionalfields:[],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"weapon",
		requiredfields:["name","rarity","level_req","atk"],
		optionalfields:["potential_id","variance","base_affix_slots","drop_info","pb_gauge_build","icon"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"weapon_existence_data",
		requiredfields:["weapon_type_id","weapon_id"],
		optionalfields:[],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"weapon_type",
		requiredfields:["name"],
		optionalfields:["icon"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"armor",
		requiredfields:["name","rarity","level_req","def"],
		optionalfields:["hp","pp","mel_dmg","rng_dmg","tec_dmg","crit_rate","crit_dmg","pp_cost_reduction","active_pp_recovery","natural_pp_recovery","dmg_res","all_down_res","burn_res","freeze_res","blind_res","shock_res","panic_res","poison_res","battle_power_value","pb_gauge_build","icon"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"potential",
		requiredfields:["name"],
		optionalfields:["icon"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"potential_data",
		requiredfields:["potential_id","level"],
		optionalfields:["mel_dmg","rng_dmg","tec_dmg","crit_rate","crit_dmg","pp_cost_reduction","active_pp_recovery","natural_pp_recovery","dmg_res","all_down_res","burn_res","freeze_res","blind_res","shock_res","panic_res","poison_res","battle_power_value","pb_gauge_build"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"builds",
		requiredfields:["user_id","creator","build_name","class1","created_on","last_modified","data"],
		optionalfields:["class2","likes"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"skill",
		requiredfields:["name","skill_type_id"],
		optionalfields:["icon"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"skill_type",
		requiredfields:["name"],
		optionalfields:[],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"skill_data",
		requiredfields:["skill_id","level"],
		optionalfields:["variance","mel_dmg","rng_dmg","tec_dmg","crit_rate","crit_dmg","pp_cost_reduction","active_pp_recovery","natural_pp_recovery","dmg_res"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"augment",
		requiredfields:["augment_type_id","level"],
		optionalfields:["variance","hp","pp","mel_dmg","rng_dmg","tec_dmg","crit_rate","crit_dmg","pp_cost_reduction","active_pp_recovery","natural_pp_recovery","dmg_res","affix_success_rate","all_down_res","burn_res","freeze_res","blind_res","shock_res","panic_res","poison_res","battle_power_value","pb_gauge_build"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"augment_type",
		requiredfields:["name"],
		optionalfields:["icon"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"food",
		requiredfields:["material"],
		optionalfields:["potency","pp","dmg_res","hp","pp_consumption","pp_recovery","weak_point_dmg","hp_recovery"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"food_mult",
		requiredfields:["amount"],
		optionalfields:["potency","pp","dmg_res","hp","pp_consumption","pp_recovery","weak_point_dmg","hp_recovery"],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"roles",
		requiredfields:["name"],
		optionalfields:[],
		excludedfields:[] //Fields to not output in GET.
	},
	{
		endpoint:"users",
		requiredfields:["username","email","created_on","role_id"],
		optionalfields:["avatar"],
		excludedfields:["password_hash"] //Fields to not output in GET.
	}
]

function CreateDynamicEndpoints() {
	ENDPOINTDATA.map((endpoint)=>{
		app.get("/"+endpoint.endpoint,(req,res)=>{
			db.query('select * from '+endpoint.endpoint)
			.then((data)=>{
				res.status(200).json({fields:data.fields,rows:data.rows})
			})
			.catch((err)=>{
				res.status(500).send(err.message)
			})
		})
		
		
		app.post("/"+endpoint.endpoint,(req,res)=>{
			
			var allExist=true
			endpoint.requiredfields.forEach((field)=>{
				if (!(field in req.body)) {
					allExist=false;
				}
			})
			if (!allExist) {
				res.status(300).send("Invalid query!")
				return
			}
			
			var combinedfields = [...endpoint.requiredfields,...endpoint.optionalfields,...endpoint.excludedfields]
			//console.log(combinedfields)
			var all_filled_fields=combinedfields.filter((field)=>(field in req.body))
			
			db.query('insert into '+endpoint.endpoint+"("+all_filled_fields.join(',')+") values("+all_filled_fields.map((field,i)=>"$"+(i+1)).join(",")+")",all_filled_fields.map((field)=>req.body[field]))
			.then((data)=>{
				res.status(200).json(data.rows)
			})
			.catch((err)=>{
				res.status(500).send(err.message)
			})
		})
		
	})
}

function CleanUp(arr,vals){
	return arr.map((arrVal)=>{
		vals.forEach((val)=>{
			arrVal[val]=undefined
		})
		return arrVal
	})
}

app.get('/data',(req,res)=>{
	var finalresult = {}
	db.query('select * from potential_data inner join potential on potential_data.potential_id=potential.id')
	.then((data)=>{
		finalresult["potential_data"]=data.rows
		return db.query('select *,weapon.name as weapon,potential.name as potential,weapon_type.name as weapon_type from weapon_existence_data inner join weapon on weapon_existence_data.weapon_id=weapon.id inner join potential on potential.id=weapon.potential_id inner join weapon_type on weapon_type.id=weapon_existence_data.weapon_type_id')
	})
	.then((data)=>{
		finalresult["weapon_existence_data"]=CleanUp(data.rows,["id","name","potential_id","weapon_type_id","weapon_id"])
		return db.query('select *,weapon_type.name as weapon_type,class.name as class from class_weapon_type_data inner join weapon_type on weapon_type.id=class_weapon_type_data.weapon_type_id inner join class on class.id=class_weapon_type_data.class_id')
	})
	.then((data)=>{
		finalresult["class_weapon_type_data"]=CleanUp(data.rows,["id","name","class_id","weapon_type_id"])
		return db.query('select *,class.name as class from class_level_data inner join class on class.id=class_level_data.class_id')
	})
	.then((data)=>{
		finalresult["class_level_data"]=CleanUp(data.rows,["id","class_id","name"])
		return db.query('select *,class.name as class2 from (select *,class.name as class1 from builds inner join users on users.id=builds.user_id inner join class on class.id=builds.class1)t inner join class on class.id=t.class2')
	})
	.then((data)=>{
		finalresult["builds"]=CleanUp(data.rows,["id","user_id","username","email","password_hash","created_on","role_id","name"])
		return db.query('select *,skill.name as skill_name,skill_type.name as skill_type_name from skill_data inner join skill on skill.id=skill_data.skill_id inner join skill_type on skill.skill_type_id=skill_type.id')
	})
	.then((data)=>{
		finalresult["skill_data"]=CleanUp(data.rows,["id","name","skill_type_id","skill_id"])
		return db.query('select *,augment_type.name as augment_type from augment inner join augment_type on augment_type.id=augment.augment_type_id')
	})
	.then((data)=>{
		finalresult["augment"]=CleanUp(data.rows,["id","name","augment_type_id"])
		return db.query('select * from armor')
	})
	.then((data)=>{
		finalresult["armor"]=data.rows
		return db.query('select * from food')
	})
	.then((data)=>{
		finalresult["food"]=data.rows
		return db.query('select * from food_mult')
	})
	.then((data)=>{
		finalresult["food_mult"]=data.rows
		res.status(200).json(finalresult)
	})
	.catch((err)=>{
		res.status(500).send(err.message);
	})
})

CreateDynamicEndpoints()