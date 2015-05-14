FROM digitallyseamless/nodejs-bower-grunt

MAINTAINER Victor Wibisono <devacto@gmail.com>

# Install image libs
ONBUILD RUN apt-get update && \
            apt-get install -y graphicsmagick imagemagick && \
            apt-get clean && \
            rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose port
EXPOSE 9000

# Mount volume
VOLUME /app

# Set working directory
WORKDIR /app

# Set instructions on build
# The following two instructions have to be executed in the /app directory
ONBUILD RUN npm install
ONBUILD RUN bower install --allow-root --config.interactive=false
