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

    const raw = result
      .filter(report => report.endsWith('.html'))
      .filter(report => report !== 'latest.html')
      .reverse();

    const reports = raw.map(report => {
      return {
        url: report,
        site: report
          .substr(0, report.length - 5)
          .substr(report.lastIndexOf('-') + 1)
      };
    });

    const pageReport = {};
    const sites = [...new Set(reports.map(item => item.site))];
    sites.forEach(site => (pageReport[site] = []));
    reports.forEach(item => pageReport[item.site].push(item));

    const pageData = {
      title: 'Audits',
      sites: Object.keys(pageReport),
      reports
    };

    return res.send(ejs.render(index, pageData));
  });
};

module.exports = (req, res) => getIndex(res);
