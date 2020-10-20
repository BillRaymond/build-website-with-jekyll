#!/bin/bash
set -e

# Jekyll generates the files for the website to the directory _site,
# which is added as a submodule to push the files to the branch gh-pages
# of the ${USER_SITE_REPOSITORY}. The property is set as an environment variable
# in the workflow.

echo "#################################################"
echo "Add build as submodule"

git submodule add https://${GITHUB_TOKEN}@github.com/${USER_SITE_REPOSITORY}.git build
# step into the directory build
cd build

# switch to branch gh-pages
git checkout gh-pages
# pull the current state
git pull

# Add some files to .gitignore, which shouldn't be pushed to gh-pages
echo "Dockerfile" >> .gitignore
echo "entrypoint.sh" >> .gitignore
echo ".github" >> .gitignore
echo "workflow-docs" >> .gitignore
echo "Gemfile" >> .gitignore

# get back to the root directory
cd ..

echo "#################################################"
echo "Added submodule"

echo "#################################################"
echo "Starting the Jekyll Action"

# run Jekyll to generate the files
sh -c "bundle exec jekyll build -d build"

echo "#################################################"
echo "Jekyll build done"

echo "#################################################"
echo "Now publishing"
# get the secret of the repository
SOME_TOKEN=${GITHUB_TOKEN}

# some logging
ls -ltar
cd build
ls -ltar
git log -2
git remote -v

# determine user data for commit information for git
USER_NAME="${GITHUB_ACTOR}"
MAIL="${GITHUB_ACTOR}@users.noreply.github.com"

echo "Set user data."
# set user name
git config user.name "${USER_NAME}"
# set the email address
git config user.email "${MAIL}"

# Create CNAME file for redirect to this repository
if [[ "${CNAME}" ]]; then
  echo ${CNAME} > CNAME
fi

# Create file .nojekyll to not let GitHub Pages regenerate
touch .nojekyll
echo "Add all files."
git add -A -v
# some logging - check the status
git status

# Commit the changes and push the to the branch gh-pages of the ${USER_SITE_REPOSITORY}
git diff-index --quiet HEAD || echo "Commit changes." && git commit -m 'Jekyll build from Action' && echo "Push." && git push origin gh-pages

echo "#################################################"
echo "Published"
