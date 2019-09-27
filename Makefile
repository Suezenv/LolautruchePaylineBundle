.PHONY: image container

image:
	@docker build -ttsmepaylinesf4 .

container:
	@docker run --rm -it -v ${PWD}:/usr/var/www -w /usr/var/www tsmepaylinesf4 bash