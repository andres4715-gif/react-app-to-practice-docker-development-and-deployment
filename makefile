# The default target that runs if you just type 'make'
all: commit-push

MSG="new commit from Makefile"
# A target to automate the git flow
push:
	git add .
	git commit -s -m "$(MSG)"
	git push

# Good practice: use .PHONY for targets that aren't actual files
.PHONY: all commit-push

# NOW you can run PUSH the git changes using this command line
# Example:
# $ make push MSG="fixed a bug in the docker config"