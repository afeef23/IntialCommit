#!/bin/bash

# Task 1: Print kernel name, kernel release, processor type, and installed operating system
echo "Kernel Name: $(uname -s)"
echo "Kernel Release: $(uname -r)"
echo "Processor Type: $(uname -p)"
echo "Operating System: $(lsb_release -d | cut -f 2)"

# Task 2: Print the name and location of your favorite editor and its documentation
# Change the values below to your favorite editor and its documentation location
favorite_editor="nano"
editor_location="$(which $favorite_editor)"
documentation_location="$(dpkg -L $favorite_editor | grep 'doc/')"

echo "Favorite Editor: $favorite_editor"
echo "Editor Location: $editor_location"
echo "Documentation Location: $documentation_location"
