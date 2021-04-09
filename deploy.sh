#!/bin/sh

# If a command fails then the deploy stops
set -e

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

printf "\033[0;32mDeploying source code to GitHub...\033[0m\n"

git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

git push origin main

printf "\033[0;32mDeploying website to GitHub...\033[0m\n"


# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push source source


