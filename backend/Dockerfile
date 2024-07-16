FROM node:20
EXPOSE 8080
RUN useradd expense
RUN mkdir /app
RUN chown expense:expense -R /app
WORKDIR /app
COPY package.json .
COPY *.js /app/
RUN npm install
CMD [ "node", "index.js" ]