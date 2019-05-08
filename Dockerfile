FROM amd64/alpine:3.9

LABEL dockerimage="edge-mqtt-postgres-connector:1.0.0"
LABEL Author="Christophe LE RET"
LABEL github="https://github.com/clrseadata/mqtt-postgres-connector"
LABEL description="Compatible GE Digital Predix Edge MQTT to Postgres database connector \
https://hub.docker.com/u/predixedge \
https://hub.docker.com/r/predixedge/predix-edge-ref-app"
LABEL version="1.0.0"

ENV LANG C.UTF-8

# #install nodejs into the base image
RUN apk update && apk add nodejs

# Create app directory in the image
WORKDIR /usr/src

# make directory writable
RUN chmod 755 /usr/src

# copy app's config files to the image
COPY conf/* ../conf/

# copy app's source files to the image
COPY src/* ./

# pull all required node packages into the app
RUN npm install

# start the app
CMD [ "node", "index.js" ]
