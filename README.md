# concourse_docker_build

docker build -t concourse-docker-build:latest .

docker tag concourse-docker-build:latest frank1rouse/concourse-docker-build:latest

docker push frank1rouse/concourse-docker-build
