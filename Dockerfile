FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
	tini locales procps net-tools iputils-ping less tmux vim \
	netbase cifs-utils nfs-common rclone

RUN sh -c "echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen"
RUN locale-gen

ENV LC_ALL=en_US.UTF-8

COPY --chmod=0755 ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/usr/bin/tini", "--" ]
#CMD [ "/usr/bin/sleep", "infinity" ]
CMD [ "/entrypoint.sh" ]
