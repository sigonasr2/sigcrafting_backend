const express = require('express') 
const axios = require('axios') 
var http = require('http');
var https = require('https');
const fs = require('fs');

const sh = require('secrethash'); 

var key = fs.readFileSync('./projectdivar.com/privkey1.pem');
var cert = fs.readFileSync('./projectdivar.com/cert1.pem');
var options = {
  key: key,
  cert: cert
};

const app = express()

var server = https.createServer(options, app); 
const port = 4505
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

var db = 
new Pool({
  user: 'postgres',
  password: '',
  host: 'postgres',
  database: 'sigcrafting',
  port: 5432,
})

app.get('/',async(req,res)=>{
	res.status(200).send('BUN is love, BUN is life.')
})

app.get('/getData',(req,res)=>{
	db.query('select * from crafting_list order by id asc')
	.then((data)=>{
		if (data.rows.length>0) {
			res.status(200).json(data.rows)
		} else {
			res.status(204).send("No data")
		}
	})
	.catch((err)=>{
		res.status(500).send(err.message)
	})
})

app.get('/lastUpdate',(req,res)=>{
	db.query("select * from site_data limit 1")
	.then((data)=>{
		res.status(200).json(data.rows)
	})
	.catch((err)=>{
		res.status(500).send(err.message)
	})
})

app.post("/updateItem",(req,res)=>{
	db.query("update crafting_list set obtained=$1 where id=$2",[req.body.obtained,req.body.id])
	.then((data)=>{
		return db.query("update site_data set last_modified=$1",[req.body.last_modified])
	})
	.then((data)=>{
		res.status(200).send("Yay!")
	})
	.catch((err)=>{
		res.status(500).send(err.message)
	})
})

app.post('/setItem',(req,res)=>{
	db.query('insert into crafting_list(itemid,name,obtained,required,icon) values($1,$2,$3,$4,$5)',[req.body.itemid,req.body.name,req.body.obtained,req.body.required,req.body.icon])
	.then((data)=>{
		res.status(200).send("Yay!")
	})
	.catch((err)=>{
		res.status(500).send(err.message)
	})
})
