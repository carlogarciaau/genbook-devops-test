# genbook-devops-test

## Summary
This project deploys a basic tomcat application and a corresponding configuration file to GKE. <br>
The app can currently be accessed from http://34.87.227.79:8080

## Environment Details
* Build and deploy is managed by a pipeline running in Cloud Build. See *cloudbuild.yaml* for the pipeline code. This does not include building of the app code, only the docker image.
* The resulting docker image is pushed to GCR.
* The pipeline pulls the configuration file from a GCS bucket (gs://genbook-test/application.properties) and creates a configmap from it. 
* Deployment cofiguration is in *deployment.yaml*. This deploys 3 replicas of the app along with requests/limits, health checks, and volume mount for the configmap.
* The app is exposed via a load balancer service. See *service.yaml*.
