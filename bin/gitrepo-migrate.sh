name=$1
gitlab_url="git@gitlab.com:ciox-solution/$name.git"
bitbucket_url="git@bitbucket.org:xpms/$name.git"

echo $gitlab_url
echo $bitbucket_url

git clone --bare $gitlab_url
cd $name.git
git remote add bitbucket $bitbucket_url
git push --all bitbucket
git push --tags bitbucket

