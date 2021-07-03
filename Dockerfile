FROM linuxserver/sabnzbd:latest
LABEL maintainer="admin@mrobelix.de"
MAINTAINER mrobelix <admin@mrobelix.de>

RUN apt-get install sudo
RUN bash -xu <<< "$(curl -fsSL https://raw.githubusercontent.com/filebot/plugins/master/installer/deb.sh)"

# Import License (Optional)
RUN filebot --license /config/admin/license.psm
