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

app.get('/hello',(req,res)=>{
	db.query('select * from users')
	.then((data)=>{
		res.status(200).json(data.rows)
	})
	.catch((err)=>{
		res.status(500).send(err.message)
	})
})

app.get('/ngsplanner',(req,res)=>{
	res.status(200).send("Hello World! This is me.");
})