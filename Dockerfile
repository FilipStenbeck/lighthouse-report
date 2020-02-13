FROM centos:8

# Install Node.js, Chromium and Lighthouse
RUN yum -y update 
RUN yum clean all
RUN yum install -y gcc-c++ make
RUN yum install -y nodejs
RUN yum install -y epel-release
RUN yum install -y chromium
RUN npm i -g lighthouse

# Install dependencies
ADD package.json .
RUN npm install

# Add files
ADD start.sh .
ADD lighthouse.sh .
ADD buildReport.js .
ADD server.js .
ADD index.ejs .

# create output folder"
RUN mkdir reports

# Run Script
CMD ./start.sh;
