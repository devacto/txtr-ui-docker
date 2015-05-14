FROM digitallyseamless/nodejs-bower-grunt

MAINTAINER Victor Wibisono <devacto@gmail.com>

# Install image libs
ONBUILD RUN apt-get update && \
            apt-get install -y graphicsmagick imagemagick && \
            apt-get clean && \
            rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Mount volume
VOLUME /app

# Set instructions on build
ONBUILD RUN npm install
ONBUILD RUN bower install --allow-root

# Set working directory
WORKDIR /app