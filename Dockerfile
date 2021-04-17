FROM node
WORKDIR /app
COPY package.json /app
RUN npm install express
COPY . .
EXPOSE 3000
CMD [ "node", "app.js" ]