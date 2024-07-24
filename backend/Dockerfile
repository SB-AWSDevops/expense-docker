FROM node:20.15.0-alpine3.20
EXPOSE 8080
ENV DB_HOST=mysql
RUN addgroup -S expense && adduser -S expense -G expense \
    && mkdir /app \
    && chown expense:expense -R /app
WORKDIR /opt/server
COPY package.json .
COPY *.js /opt/server/
RUN npm install
USER expense
EXPOSE 8081
CMD [ "node","index.js" ]
