#!/bin/sh
echo "Creating a stub github repository called: $1"

# Silently create a new repository in GitHub/financial-times-sandbox
curl -s -H "Authorization: token $(echo $GITHUB_API_TOKEN)" https://api.github.com/user/repos -d '{"name":"'"$1"'","description":"This repository is for testing & development purposes."}' > /dev/null

mkdir $1
cd $1
git init
git remote add origin git@github.com:adambraimbridge/$1.git
cp ../.template/* ./
echo "# 🎩 $1\n$(cat README.md)" > README.md;
git add .
git commit -m "🎩  Hey presto! A new GitHub repo!"
git push -

echo "✅  Done."
