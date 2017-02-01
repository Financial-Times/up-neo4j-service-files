# up-neo4j-service-files
Configuration for the services deployed in the docker cluster that hosts Neo4J database

## Example of deploying neo4j cluster with coco-pub-provisioner in test environment

NB! Windows users should run these commands from a Linux jump-off box.  
There is already a CF   [CoCo Management Server](https://github.com/Financial-Times/coco-pub-provisioner/blob/master/cloudformation/README.md) CF template for AWS.   

Grab values for env vars from LastPass shared secure note: "TEST neo4j cluster provisioning setup"

### Provision
````
sudo su -

export ENVIRONMENT_TAG=<LastPass>
export VAULT_PASS=<LastPass>
export AWS_ACCESS_KEY_ID=<LastPass>
export AWS_SECRET_ACCESS_KEY=<LastPass>
export SERVICES_DEFINITION_ROOT_URI=<LastPass>
export CLUSTER_BASIC_HTTP_CREDENTIALS=<LastPass>
export AWS_DEFAULT_REGION=eu-west-1
export ENVIRONMENT_TYPE=t
export TOKEN_URL=`curl -s https://discovery.etcd.io/new?size=3`
export SPLUNK_HEC_TOKEN=<LastPass>
export SPLUNK_HEC_URL=<LastPass>

docker pull coco/coco-pub-provisioner:latest

docker run \
    -e "VAULT_PASS=$VAULT_PASS" \
    -e "TOKEN_URL=$TOKEN_URL" \
    -e "SERVICES_DEFINITION_ROOT_URI=$SERVICES_DEFINITION_ROOT_URI" \
    -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" \
    -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" \
    -e "ENVIRONMENT_TAG=$ENVIRONMENT_TAG" \
    -e "ENVIRONMENT_TYPE=$ENVIRONMENT_TYPE" \
    -e "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" \
    -e "CLUSTER_BASIC_HTTP_CREDENTIALS=$CLUSTER_BASIC_HTTP_CREDENTIALS" \
    -e "SPLUNK_HEC_TOKEN=$SPLUNK_HEC_TOKEN" \
    -e "SPLUNK_HEC_URL=$SPLUNK_HEC_URL" \
     coco/coco-pub-provisioner:latest
   ````
    
   
    ssh -A neo4j-test-tunnel-up.ft.com
    
### Decom

Instructions are the same as for [coco-pub-cluster](https://github.com/Financial-Times/coco-pub-provisioner)