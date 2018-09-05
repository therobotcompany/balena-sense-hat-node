FROM resin/raspberrypi3-node:6

# Move into a working directory
WORKDIR /usr/src/app

RUN JOBS=MAX npm install -g node-gyp \
          && npm cache clean --force && rm -rf /tmp/*

# Copy our package.json into the container. This tells npm about the
# module that we're trying to run
COPY package.json ./

# Let's install our dependencies
RUN JOBS=MAX npm install --production --unsafe-perm && npm cache clean && rm -rf /tmp/*

# And now let's copy our code into the container
COPY . ./

# Mapping volumes https://docs.resin.io/learn/develop/multicontainer/#named-volumes
# a link will automatically be created from the '/data' (CONTAINER 'main')
#    to '/var/lib/docker/volumes/<APP ID>_resin-data/_data' named volume (HOST)

# Execute our code when the container starts up
CMD node src/app.js
