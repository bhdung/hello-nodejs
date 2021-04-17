FROM node
WORKDIR /
COPY package.json /app
RUN npm install
EXPOSE 3000
CMD [ "node", "app.js" ]