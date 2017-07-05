IMAGE_NAME="ruby-playground"

all:
	docker build -t $(IMAGE_NAME) .

hello:
	@echo "*** Building"

run: all
	@echo "*** Running now"
	docker run -ti -p 4567:4567 -v $$(pwd):/home/$$USER/dev -e USER=$$USER -e USERID=$$UID $(IMAGE_NAME) bash

clean:
	docker rmi -f $(IMAGE_NAME)

destroy:
	docker rm -f $$(docker ps -aq)
