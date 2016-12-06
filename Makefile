# make gems

# Define variables here.
branch = tests
message = "writing tests..."

master:
	git add .
	git commit -m $(message)
	git push origin

branch:
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
