# make gems

# Define variables here.
branch = schedule
message = "merging"

push_master:
	git add .
	git commit -m $(message)
	git push origin

push_branch:
	git add .
	git commit -m $(message)
	git push origin	$(branch)

push_heroku:
	git add .
	git commit -m $(message)
	git push heroku master

gems:
	gem install bundler
	bundle install
