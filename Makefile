.PHONY: release

release:
	gh workflow run update-formula.yml
