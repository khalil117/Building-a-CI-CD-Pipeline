# azure-devops
This a repo for azure devops

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

CI: Set Up Azure Cloud Shell
1. Creation of the Cloud-Based Development Environment
2. Create Project Scaffolding
  2.1 Cretion of the Make file 
  2.2 Create requirements.txt
  2.3 Create the Python Virtual Environment 
        python3 -m venv ~/.myrepo 
        source ~/.myrepo/bin/activate
3. Create the script file and test file.        
