FROM node
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . .
RUN npm test
EXPOSE 3000
CMD [ "node", "app.js" ]