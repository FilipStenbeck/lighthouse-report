const ejs = require('ejs');
const fs = require('fs');
const index = require('../views/index.ejs');

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

    const pageData = {
      title: 'Audit reports',
      reports
    };

    return res.send(ejs.render(index, pageData));
  });
};

module.exports = (req, res) => getIndex(res);
