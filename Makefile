IMAGE_NAME = ubuntu1904-testuser

.PHONY: build
build: 
	docker build -t $(IMAGE_NAME) .

.PHONY: run
run:
	docker run -it \
		--name $(IMAGE_NAME) \
		--rm \
		$(IMAGE_NAME)

.PHONY: clean
clean:
	- docker rm $(IMAGE_NAME)
	- docker rmi $(IMAGE_NAME)
