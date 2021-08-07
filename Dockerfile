FROM linuxserver/sabnzbd:latest
MAINTAINER mrobelix <admin@mrobelix.de>

# Update System
RUN apt-get update -y && \
	apt-get install --install-recommends -y dirmngr apt-transport-https
	
# Install Fiebot
RUN	apt-key adv --fetch-keys "https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub" && \
	echo "deb [arch=all] https://get.filebot.net/deb/ universal-jdk8 main" | tee /etc/apt/sources.list.d/filebot.list && \
	apt-get update -y && \
	apt-get install --install-recommends -y filebot

# Filebot test
RUN filebot -script fn:sysinfo
