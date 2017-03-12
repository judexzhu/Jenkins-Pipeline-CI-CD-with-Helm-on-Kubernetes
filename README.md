What is CI/CD

CI :          Continuous integration 

CD:         
a.	Continuous Delivery
b.	Continuous Deployment 

Preview 

 


In the last Kubernetes Videos I made, I mentioned about how to CI/CD in the Kubernetes , I recently just figured it out and this is how it works

And as I said before , no MIS/IT need to directly access the K8S

![Jenkins Pipeline](https://github.com/judexzhu/Jenkins-Pipeline-CI-CD-with-Helm-on-Kubernetes/blob/master/Jenkins/Jenkins_helm_pipeline.png?raw=true "Jenkins Pipeline with Helm on Kubernetes")
 



For  this we need 

1.	Git repo( I used Github for convenience)

2.	Jenkins Master Server 

3.	Docker runner

4.	Docker repo(I used Dockerhub)

5.	Helm

6.	Kubernetes 

So I download the official Jenkins docker image , and custom it (add sudoer on Jenkins and install docker-ce on it , it’s a debian )
 

I need Jenkins to run the docker and Helm , but I need them to run on the host , not inside the container , so I used Docker out of Docker (DOOD)

More reading :  http://container-solutions.com/running-docker-in-jenkins-in-docker/
                                https://github.com/jpetazzo/dind?__hstc=137489263.675a44a4b91444112bda1dad12f882fa.1488914911985.1488914911985.1488919904442.2&__hssc=137489263.4.1488919904442&__hsfp=3543740620

build the docker image in local with name myjenkins

run the image with outside docker helm binary inside the container 

docker run -p 8080:8080 -p 50000:50000 -d --name jenkins -v /var/run/docker.sock:/var/run/docker.sock  -v /etc/sysconfig/docker:/etc/sysconfig/docker -v ~/jenkins_home:/var/jenkins_home -v /usr/local/bin/helm:/usr/local/bin/helm  -v ~/.kube:/root/.kube  -v ~/.helm:/hlm -e HELM_HOME=/hlm --privileged  myjenkins

(it’s a really long cli, but it did the tricks )

No we have Jenkins right now , with IP:8080, we need config the Jenkins and install some plugins 

 


Install Puligns : Pipeline Suit, Github and Pipeline utility step

 
 
 


What’s on the Git Hub

 
How to create a pipeline job on Jenkins

Create two credentials , one for github, one for dockerhub

 



Create a pipeline
 
Config only this 

 


How it works 

Before 
1.	Helm status 
 
2.	Docker hub 
 
3.	Kubernetes
 
4.	Index.html version 
 
5.	Jenkins file build tag 
 

Running the pipeline job 

 

 


After 

We have the helm deploy and docker image on local

 

Dockerhub 
 

On Kubernetes we have a new name space and new deployments 

 

And the ingress and website 

 

Deploy success

Then how to continuous delivery/deployment 

Change the index.html  and jenkinsfile buildtag from 1.0 to 2.0

 

 



And run the job again 

 

Helm status and docker images

 

Dockerhub
 

On kubernetes

 

And the website changed 

 

Done

Having a lot to show , but this is already too long , all the code is on my github ,feel free to ask me and review it online ,all ideas are appreciated 

Thanks 
