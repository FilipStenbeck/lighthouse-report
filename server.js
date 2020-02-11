const express = require('express');
const ejs = require('ejs');
const util = require('util');
const fs = require('fs');
const { name, version } = require('./package.json');

const template = require('./index.ejs');
const app = express();
const port = 3000;

const serveReport = (req, res) => res.send(getIndex());
const health = (req, res) =>
  res.status(200).json({ name, version, status: 'up' });

app.use(express.static('reports'));
app.get('/', serveReport);
app.get('/health', health);

const getIndex = () => {
  const reports = fs
    .readdirSync('reports')
    .filter(report => report.endsWith('.html'));

  return ejs.render(template, { title: 'Reports', reports });
};

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
