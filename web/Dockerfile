FROM node:12.18.3-alpine3.12

RUN addgroup app && adduser -S -G app app
USER app

WORKDIR /app

COPY package*.json  ./
RUN npm install
COPY . .

EXPOSE 3001

CMD [ "npm", "start" ]