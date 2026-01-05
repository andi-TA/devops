FROM node:25-bookworm-slim

WORKDIR /app

COPY tools/express/package*.json ./

RUN npm install

COPY tools/express .

EXPOSE 5000

CMD ["node","tools/express/src/index.js"]