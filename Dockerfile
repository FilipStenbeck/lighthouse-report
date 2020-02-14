FROM centos:8

# Install Node.js, Chromium and Lighthouse
RUN yum -y update 
RUN yum clean all
RUN yum install -y gcc-c++ make
RUN yum install -y nodejs
RUN yum install -y epel-release
RUN yum install -y chromium
RUN yum install -y jq
RUN npm i -g lighthouse

# Install dependencies
ADD package.json .
ADD package-lock.json .
RUN npm install

# Add files
ADD start.sh .
ADD lighthouse.sh .
ADD buildReport.js .
ADD web /web
ADD audits.json .

# create output folder"
RUN mkdir reports

# Run Script
CMD ./start.sh;
