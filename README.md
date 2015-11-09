# Spring Security with OAUTH2 with 3 Legged Authentication with MYSQL Database based upon Microservices Architecture
## It is JDBC based authentication OAUTH2 3 legged Authentication

# How to use
- Download the project
- Build the project using the Maven command mvn clean install
- You will find three war files, deploy all in Tomcat server
- Open browser and type the url <http://localhost:8080/micro-client>

# Testing in Firefox REST Client
- To access in REST Client , use the follwoing url <http://localhost:8080/micro-api-server/api/test/test/11>
- Pass the following information in the header

- Authorization
- bearer [copy the access_token=]
- An example is given below.

GET
<http://localhost:8080/micro-api-server/api/test/test/11>

Authorization

bearer 8f0e4006-2e8d-424e-8de0-5e4e3008f17c
