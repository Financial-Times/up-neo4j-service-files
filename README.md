# up-neo4j-service-files
Configuration for the services deployed in the docker cluster that hosts Neo4J database

## Deployment
These service files are designed to be deployed with the cloudformation script in [this project](https://github.com/Financial-Times/up-neo4j-ha-cluster).

If you are making a change that will result in Neo4j restarting (changing the version or service file) then stopping the Neo4j services before deployment is advised.  Doing so results in Neo4j coming up cleanly and reduces the risk of cluster coordination issues.
