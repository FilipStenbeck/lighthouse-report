const { name, version } = require('../../package.json');

module.exports = (req, res) =>
  res.status(200).json({ name, version, status: 'up' });
