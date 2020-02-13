const express = require('express');
const ejs = require('ejs');
const util = require('util');
const fs = require('fs');
const { name, version } = require('./package.json');

const template = require('./index.ejs');
const app = express();
const port = 3000;

const serveReport = (req, res) => getIndex(res);
const health = (req, res) =>
  res.status(200).json({ name, version, status: 'up' });

const getIndex = res => {
  fs.readdir('reports', (error, result) => {
    if (error) {
      console.log('error getting reports from disc', error);
      return res.send(
        ejs.render(template, {
          title: 'Reports',
          reports: []
        })
      );
    }

    const reports = result
      .filter(report => report.endsWith('.html'))
      .filter(report => report !== 'latest.html')
      .reverse();
    return res.send(ejs.render(template, { title: 'Reports', reports }));
  });
};

app.use(express.static('reports'));
app.get('/', serveReport);
app.get('/health', health);

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
