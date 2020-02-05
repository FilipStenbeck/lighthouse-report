const util = require('util');
const fs = require('fs');

const readFile = util.promisify(fs.readFile);

const getAuditvalue = (json, key) => json[key].numericValue;

const buildOutput = json => {
  const { audits, finalUrl } = json;

  const firstByte = getAuditvalue(audits, 'time-to-first-byte');
  const firstContentfulPaint = getAuditvalue(audits, 'first-contentful-paint');
  const firstMeaningfulPaint = getAuditvalue(audits, 'first-meaningful-paint');
  const interactive = getAuditvalue(audits, 'interactive');
  const domElements = getAuditvalue(audits, 'dom-size');

  return (report = {
    finalUrl,
    firstByte,
    firstContentfulPaint,
    firstMeaningfulPaint,
    interactive,
    domElements
  });
};

readFile(process.cwd() + '/' + process.argv[2])
  .then(data => {
    const fullReport = JSON.parse(data.toString());
    const output = buildOutput(fullReport);
    console.log(JSON.stringify(output));
  })
  .catch(error => {
    console.log(error);
  });
