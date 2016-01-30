update-packer-by-url:
	cat Dockerfile | \
		sed 's///g'

.PHONY: update-packer-by-url
