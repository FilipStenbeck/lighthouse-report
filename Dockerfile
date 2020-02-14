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
ADD web /web
ADD scripts /scripts
ADD config /config

# Run Script
CMD ./start.sh;
