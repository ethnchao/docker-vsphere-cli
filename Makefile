build:
	@docker build -t vsphere-cli .

run:
	@docker run \
		-it \
		--name vsphere-cli vsphere-cli /bin/bash

clean:
	@docker rm vsphere-cli > /dev/null || true

tty:
	@docker exec -it vsphere-cli /bin/bash

stop:
	@docker stop vsphere-cli

start:
	@docker start vsphere-cli
