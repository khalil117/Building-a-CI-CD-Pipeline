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

        python3 -m venv ~/.myrepo 
        source ~/.myrepo/bin/activate

3. Create the script file and test file.
4. Last step here is to run make all command and the Screenshot below showing the passing tests that are displayed after running the make all command from the Makefile

![MakefileTest](https://user-images.githubusercontent.com/33384529/187076592-5e81f330-a08a-410d-b888-3314f4017bad.PNG)




# CI: Configure GitHub Actions

1. Enabling Github Actions 
2. Updating the pythonapp.yml code 
3. Screenshot of passing GitHub Actions Build

![actionsBuild](https://user-images.githubusercontent.com/33384529/187077969-d907bf12-5bdb-4c7b-ae91-42dfcc665750.PNG)



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

![image (1)](https://user-images.githubusercontent.com/33384529/187081461-8f9b1441-46a7-4cd4-ab77-c27f10a73c78.png)
![image (3)](https://user-images.githubusercontent.com/33384529/187081576-9af25322-f181-4671-8159-ab6963487282.png)
![image (2)](https://user-images.githubusercontent.com/33384529/187081589-cc324277-f530-45ba-81c1-9c5a7689ce6a.png)


# Enhancements
Possible enhancements are:
* create a dev branch in Github to test code in dedicated test environment before deploying to production
* use Azure Container Instances to deploy the web app
# Demo

