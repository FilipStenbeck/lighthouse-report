FROM centos:8

# Install Node.js, Chromium and Lighthouse
RUN yum -y update 
RUN yum clean all
RUN yum install -y gcc-c++ make
RUN yum install -y nodejs
RUN yum install -y epel-release
RUN yum install -y chromium
RUN npm i -g lighthouse

# Add script 
ADD start.sh .
ADD lighthouse.sh .
ADD buildReport.js .

# create output folder"
RUN mkdir reports

# Run Script
CMD ./start.sh
