# make gems

# Define variables here.
branch = database
message = "model DFaculty"

git_push_master:
	git add .
	git commit -m $(message)
	git push origin

git_push_branch:
	git add .
	git commit -m $(message)
	git push origin	$(branch)

git_push_heroku:
	git add .
	git commit -m $(message)
	git push heroku master

gems:
	gem install bundler
	bundle install
