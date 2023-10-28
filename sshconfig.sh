#!/bin/bash

# 1. Generate an SSH key pair using the RSA algorithm with the default settings.
# Save the private key to the user's home directory.
user_name="devopsuser"

# Generate the SSH key pair for the user
sudo -u "$user_name" ssh-keygen -t rsa -f "/home/$user_name/.ssh/id_rsa"

# 2. Configure SSH to disable password authentication.
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
service ssh restart

# 3. Set up SSH so that the user can log in without specifying their username and IP address each time.
echo "Host *" >> "/home/$user_name/.ssh/config"
echo "  User $user_name" >> "/home/$user_name/.ssh/config"
echo "  IdentityFile /home/$user_name/.ssh/id_rsa" >> "/home/$user_name/.ssh/config"

# 4. SSH into the system using the newly created credentials in non-interactive mode and perform tasks.
# A. Create a test directory inside the home directory.
# B. Create a file named "filecreatedinnoninteractivemode.txt" and write "I am doing the task2."
sudo -u "$user_name" ssh localhost << EOF
 mkdir test_directory
  echo "I am doing the task2." > ~/test_directory/filecreatedinnoninteractivemode.txt
  exit
EOF

