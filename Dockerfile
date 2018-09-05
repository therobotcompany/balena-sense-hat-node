FROM resin/raspberrypi3-node:6

# Move into a working directory
WORKDIR /usr/src/app

RUN apt install make gcc g++ python --virtual .gyp
# RUN JOBS=MAX npm install -g node-gyp
# && npm cache clean --force && rm -rf /tmp/*

# Copy our package.json into the container. This tells npm about the
# module that we're trying to run
COPY package.json ./

# Let's install our dependencies
RUN npm install

# And now let's copy our code into the container
COPY . ./

# Execute our code when the continer starts up
CMD node src/app.js
