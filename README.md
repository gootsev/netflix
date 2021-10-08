## Simple project for looking at CI/CD process

### What's inside?

You can find a simple API, docker file, AWS cloudformation template and a jenkinsfile.

- API allowes to upload, get, put and delete storage.
  Beside it this API provide healthchek and use AWS S3 bucket
- Docker file allowes you to contain this API by deploying docker image
- Cloudformation template creates needed infrastructure in AWS
- Jenkins file contains tasks for final deploying application

### Usage

Set env parameters in Jenkins file and be sure that you have credentials for Dockerhub and AWS
in Jenkins.

	NOTE: If you are running Jenkins for the first time you need to replace the command "update-stack"
	with the command "create-stack". Another way is to create your own pipeline for CI process.

### Testing

There's a postman collection in `small-co-api.postman_collection.json`, use it!
