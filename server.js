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

function CleanUp(arr,vals){
	return arr.map((arrVal)=>{
		vals.forEach((val)=>{
			arrVal[val]=undefined
		})
		return arrVal
	})
}

app.get('/augment_type',(req,res)=>{
	if (req.query.id) {
		db.query('select * from augment_type where id=$1',[req.query.id])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else
	if (req.query.name) {
		db.query('select * from augment_type where name ilike $1',[req.query.name])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else {
		res.status(300).send("Invalid query!")
	}
})

app.get('/skill',(req,res)=>{
	if (req.query.id) {
		db.query('select * from skill where id=$1',[req.query.id])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else
	if (req.query.name) {
		db.query('select * from skill where name ilike $1',[req.query.name])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else {
		res.status(300).send("Invalid query!")
	}
})

app.get('/skill_type',(req,res)=>{
	if (req.query.id) {
		db.query('select * from skill_type where id=$1',[req.query.id])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else
	if (req.query.name) {
		db.query('select * from skill_type where name ilike $1',[req.query.name])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else {
		res.status(300).send("Invalid query!")
	}
})

app.get('/class',(req,res)=>{
	if (req.query.id) {
		db.query('select * from class where id=$1',[req.query.id])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else
	if (req.query.name) {
		db.query('select * from class where name ilike $1',[req.query.name])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else {
		res.status(300).send("Invalid query!")
	}
})

app.get('/weapon_type',(req,res)=>{
	if (req.query.id) {
		db.query('select * from weapon_type where id=$1',[req.query.id])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else
	if (req.query.name) {
		db.query('select * from weapon_type where name ilike $1',[req.query.name])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else {
		res.status(300).send("Invalid query!")
	}
})

app.get('/weapon',(req,res)=>{
	if (req.query.id) {
		db.query('select * from weapon where id=$1',[req.query.id])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else
	if (req.query.name) {
		db.query('select * from weapon where name ilike $1',[req.query.name])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else 
	if (req.query.rarity) {
		db.query('select * from weapon where rarity=$1',[req.query.rarity])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else {
		res.status(300).send("Invalid query!")
	}
})

app.get('/potential',(req,res)=>{
	if (req.query.id) {
		db.query('select * from potential where id=$1',[req.query.id])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else
	if (req.query.name) {
		db.query('select * from potential where name ilike $1',[req.query.name])
		.then((data)=>{
			res.status(200).json(data.rows)
		})
	} else {
		res.status(300).send("Invalid query!")
	}
})

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