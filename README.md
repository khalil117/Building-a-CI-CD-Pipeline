[![Python application test with Github Actions](https://github.com/khalil117/azure-devops/actions/workflows/pythonapp.yml/badge.svg?branch=main)](https://github.com/khalil117/azure-devops/actions/workflows/pythonapp.yml)

# Building a CI/CD Pipeline

## Overview
This is the final project for the course **Agile Development with Azure** as part of the Udacity **DevOps Engineer Nanodegree Program**. The goal is to build a complete continuous integration and continuous delivery pipeline using the following tools and concepts:
* **Github** :octocat: : as a central code repository
* **Github Actions** : to trigger continous integration builds
* **Makefile**: that contains package dependencies, linting and testing steps
* **Azure Pipelines**: to continously deliver an Azure Web App if code is pushed to Github. 

For this project a Pyhton-based machine learning application using the Flask web framework was provided. The model of that web app has been trained to predict housing prices in Boston according to several feautres, such as average rooms in a home and data about highway access, etc.


# Project Plan

1. Trello board for the project
https://trello.com/invite/b/atbGGi1X/1172b2d25dd112c67f4db80c72ccb8c0/demo

2. spreadsheet that includes the original and final project plan
https://docs.google.com/spreadsheets/d/1rqKnuvYAlBY3vT2KmaJaQwNVBpciabnoXsvY-BUSlFw/edit#gid=1348135932


## Instructions

![Project architecture](https://user-images.githubusercontent.com/33384529/187223319-d480d163-e5bc-4ee8-89a7-c776bea7baad.PNG)


# Before we start

1 - Create ssh-keys in Azure Cloud Shell 

ssh-keygen -t rsa
cat /home/odl_user/.ssh/id_rsa.pub

Then we add keys-pairs to our repo 

2 - git clone git@github.com:khalil117/azure-devops.git

3 - git status to see modified file 

4 - git add * to add all modified file (we can also specifie the file name)

5 - git commit -m "adding a change to the README"

# if this was the first commit , we need to run additioanal commands 

 a - git config --global user.email "you@example.com"

 b-  git config --global user.name "Your Name"

6 - git push

After every modification, we run commands from 3 to 6  

The Screenshot below show that project has been successfully cloned into Azure Cloud Shell

![image](https://user-images.githubusercontent.com/33384529/187076370-ec50b76e-1a5d-4136-bb12-ae4ffbab08af.png)


# CI: Set Up Azure Cloud Shell

1. Creation of the Cloud-Based Development Environment

2. Create Project Scaffolding

   2.1 Cretion of the Make file 

   2.2 Create requirements.txt

   2.3 Create the Python Virtual Environment 

        python3 -m venv ~/.azure-devops 
        source ~/.azure-devops/bin/activate

3. Create the script file and test file.
4. Last step here is to run make all command and the Screenshot below showing the passing tests that are displayed after running the make all command from the Makefile

![MakefileTest](https://user-images.githubusercontent.com/33384529/187076592-5e81f330-a08a-410d-b888-3314f4017bad.PNG)




# CI: Configure GitHub Actions

1. Enabling Github Actions 
2. Updating the pythonapp.yml code 
3. Screenshot of passing GitHub Actions Build

![actionsBuild](https://user-images.githubusercontent.com/33384529/189120238-bcfa64ed-5e40-455f-bebd-30d8c3a1c599.PNG)


# CD : Continuous Delivery on Azure

 It's time to set up Continuous Delivery using Azure technologies 

We need to add neccessary files from provided Flask starter code

 app.py

 boston_housing_prediction.joblib

 Commands.sh

 housing.csv

 locustfile.py

 make_predict_azure_app.sh 

and finally 

 make_prediction.sh

1. az webapp up --name azurecicdpipeline --resource-group Azuredevops
2. python app.py 
3. ./make_predict_azure_app.sh 

### Deploying to Azure App Services

 Deploy the web app to azure using az webapp up -n

![WebApp](https://user-images.githubusercontent.com/33384529/188933533-701ee9e7-ec44-4459-9fe5-2d099acfdc0f.PNG)



### Verify our deployment

Check if the app is up and running by opening the URL containing the webapp name provided in the previous step: https://azurecicdpipleline.azurewebsites.net/

![image (3)](https://user-images.githubusercontent.com/33384529/187081576-9af25322-f181-4671-8159-ab6963487282.png)

 Edit file 'make_predict_azure_app.sh' and replace '< yourappname >' with your webapp name (e.g. azurecicdpipeline).

Test the remote webapp:
![image (1)](https://user-images.githubusercontent.com/33384529/187081461-8f9b1441-46a7-4cd4-ab77-c27f10a73c78.png)


# Locust Output 

Using the parameters above locust will use 20 users with a spawn rate of 5 users per second and run for 20 seconds:

          locust -f locustfile.py --headless -u 20 -r 5 -t 20

![locust1](https://user-images.githubusercontent.com/33384529/188279216-bdb8dbaf-53b7-4867-8394-ccabea7794be.PNG)
![locust2](https://user-images.githubusercontent.com/33384529/188279222-69e782f9-d551-4892-b177-a344b1e5327b.PNG)

# Setting up CI/CD using Azure Pipelines

1 - Go to your Azure DevOps Organization and create a project named " Flask ML Deploy "

2 - Within project settings go to Service Connections and create one named " Flask ML App Service "

3 - Create a new Personal Access Token (PAT) that will be used instead of a password by the build agent (Linux VM) for authentication/authorization

4 - Then we create an Agent Pool, Go to the Flask-ML-Deploy DevOps project Settings >> Agent pools and add a new agent pool.

5 - VM Creation, Navigate to the "Virtual machines" service in the Azure Portal, and then select "+ Create" to create a VM.

6 - Configure the Linux VM as an Azure DevOps Build Agent,  

7 - In you Azure DevOps, navigate to Organization Settings >> Agent Pools >> myAgentPool and then select the Agents tab. Confirm that the self-hosted agent is online.


## Set up the DevOps Pipeline

Go to Pipelines and create pipeline using the option GitHub (YAML), select your repository and configure your Azure Web App with Python to Linux Web App on Azure
 Set up the continuous delivery workflow
In the screenshots below shows succsefully Build and Deploy job 

![pipeline](https://user-images.githubusercontent.com/33384529/189128424-a5c7e2a3-6408-4402-b948-8a00b70f5aa3.PNG)

See below example of resent work after deployment

 ![JobBuild](https://user-images.githubusercontent.com/33384529/189128889-8bffd1af-52ac-4739-a48d-b1fa8fa3ca27.PNG)


# Enhancements
Possible enhancements are:
* create a dev branch in Github to test code in dedicated test environment before deploying to production
* use Azure Container Instances to deploy the web app
# Demo

https://youtu.be/9qqumbKEgpw

