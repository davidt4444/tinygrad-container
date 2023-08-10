This is a starting point and a cleaned up version of what I am doing. You could modify the Dockerfile to add a python file to the image or manually input python files on each container or pod that you spin off. It is up to you.

The default Dockerfile contains commands to run all of the installs for the extra packages minus the one for metal, since this is running on an nginx. If you don't want the extras, then comment out the run commands in the Dockerfile.

To setup the project, run:
git clone https://github.com/davidt4444/tinygrad-container.git
cd tinygrad-container


To build the docker image, run:
docker build -t tinygrad-container-dev .

To run the image from the compose file, run:
docker compose up
To force a rebuild run:
docker-compose up --force-recreate

The following command was run with Kompose to generate the yaml files from the docker compose file:
kompose convert

It produced these yaml files from the docker compose file
INFO Kubernetes file "api-deployment.yaml" created 
INFO Kubernetes file "api-claim0-persistentvolumeclaim.yaml" created 

To run these kompose files on kubernetes, run:
kubectl apply -f api-deployment.yaml,api-claim0-persistentvolumeclaim.yaml 
