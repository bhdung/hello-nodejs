FROM node
WORKDIR /app
RUN npm install express
COPY . .
EXPOSE 3000
CMD [ "node", "app.js" ]