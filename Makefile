
all:

build:
	docker build -t chunyingh/rclone .

test:
	docker run -it --rm -p 5572:5572 --privileged --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH chunyingh/rclone /entrypoint.sh

