# Cursos de DevOps: Jenkins con Docker CLI

Servidor Jenkins con Docker CLI (agentes dinámicos) configurado para las pruebas de pipelines de Jenkins, permite la construcción, las pruebas unitarias y despliegue.

Los pluging preinstalados son: blueocean, docker-workflow, jacoco, htmlpublisher, sonar, job-dsl, maven-plugin, pipeline-maven.

## Instalación

Para crear un entorno de integración continua y entrega/despliegue continuo con Jenkins, SonarQube, Docker-in-Docker y MailHog (SMTP mock).

Los volúmenes jenkins-data y jenkins-docker-certs permiten la integración entre los agentes de Jenkins y el Docker and Docker.

### Comunes

    docker network create devops
    docker run -d --network devops --name mailhog --publish 1025:1025 -p 8025:8025 mailhog/mailhog
    docker run -d --network devops --name sonarQube --publish 9000:9000 sonarqube:latest
    docker run -d --network devops --name jenkins-docker-in-docker --detach --privileged --network-alias docker --env DOCKER_TLS_CERTDIR=/certs --volume jenkins-docker-certs:/certs/client --volume jenkins-data:/var/jenkins_home --publish 2376:2376 docker:dind --storage-driver overlay2

### Linux:

    docker run --name jenkins --network devops --publish 50080:8080 --publish 50000:50000 ^
        --volume $PWD:/externo --volume jenkins-data:/var/jenkins_home ^
        --volume docker-in-docker-certs:/certs/client:ro --env DOCKER_CERT_PATH=/certs/client ^
        --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_TLS_VERIFY=1 ^
        --env JAVA_OPTS="-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true" ^
        jenkins-with-docker

### Windows

    docker run --name jenkins --network devops --publish 50080:8080 --publish 50000:50000 ^
        --volume .:/externo --volume jenkins-data:/var/jenkins_home ^
        --volume docker-in-docker-certs:/certs/client:ro --env DOCKER_CERT_PATH=/certs/client ^
        --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_TLS_VERIFY=1 ^
        --env JAVA_OPTS="-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true" ^
        jamarton/jenkins-whit-docker
