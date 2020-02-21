# Lighthouse report

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

Runs lighthouse audit using headless chrome.

# Run

In command line run

```
./start.sh
```

Or using docker-compose

```
docker build . -t hi3gcontainerregistry.azurecr.io/lighthouse-report:latest
docker-compose up
```

# Project structure

The project includes both scripts needed for running the audits and a webserver to serve the reports online

```
lighthouse-report
  ├── config (application config for example which audits to run)
  ├── scripts (everything related to running and generating reports)
  └── web (node.js express server for serving reports online)
  │   ├── routes
  │   └── views
  └── start.sh (Start script, starting both scrupt runnner and web server)
```

# Add sites to to audit

Add the URL and name of the page you want to audit in the file _/config/audits.json_
For example

```
{
    "name": "foobar-statpage",
    "url": "https://www.foobar.com/"
  }
```
