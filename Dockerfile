FROM node
WORKDIR /app
COPY package.json /app
RUN npm install express
EXPOSE 3000
CMD [ "node", "app.js" ]