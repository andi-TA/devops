const express = require('express');
const https = require('https');
const fs = require('fs');
const app = express();

app.use(express.urlencoded({ extended: true }))
app.use(express.json())

app.get('/ping', (req, res) => {res.send('/pong')})

app.get('/', 
   (req, res) => res.send('Dockerizing Node Application'))

const options = {
   key: fs.readFileSync('/run/secrets/pub_ssl_key'),
   cert: fs.readFileSync('/run/secrets/priv_ssl_key')
};

const PORT = process.env.PORT || 5000;

https.createServer(options, app).listen(PORT, '0.0.0.0', () => {
   console.log(`[bootup]: Server is running at port: ${PORT}`);
});