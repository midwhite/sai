git checkout -b deploy
git pull heroku master
rm -rf public/packs/ public/assets/
git status
bin/webpack -p
RAILS_ENV=production NODE_ENV=production bundle exec rails assets:precompile
git status
git add .
git commit -m "precompile to deploy"
git push heroku master
git checkout master
git branch -D deploy
echo "Comleted to deploy."