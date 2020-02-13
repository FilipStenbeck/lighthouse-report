# lighthouse-report

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

Runs lighthouse audit using headless chrome.

# Run

In command line run

```
./start.sh
```

# Add urls to test

Add the URL and name of the page you want to audit in the file _audits.json_
For example

```
{
    "name": "handla-mobiltelefoner",
    "url": "https://www.tre.se/handla/mobiltelefoner"
  }
```
