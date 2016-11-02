# make gems

# Define variables here.
branch = database
message = "message created from makefile"

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
	export GEM_HOME=$HOME/.gemsexport PATH=.bundle/bin:$GEM_HOME/bin:$PATH
