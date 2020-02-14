const app = require('./app.js');
const port = 3000;

process.on('unhandledRejection', (reason, promise) => {
  console.error('Unhandled promise rejection', reason, promise);
  throw reason;
});

process.on('uncaughtException', error => {
  logger.error('Uncaught Exception, => service will reboot', error);
  console.exit(1);
});

app.listen(port, () => console.log(`app listening on port ${port}!`));
