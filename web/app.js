const express = require('express');

const health = require('./routes/health');
const reportsList = require('./routes/reportsList');

const app = express();

//Serve the static reports folder
app.use(express.static('reports'));

app.get('/', reportsList);
app.get('/health', health);

module.exports = app;
