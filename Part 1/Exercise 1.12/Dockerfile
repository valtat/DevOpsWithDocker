FROM node:16.20.1-alpine

WORKDIR /app

COPY material-applications/example-frontend/ .

RUN npm install

RUN npm run build

RUN npm install -g serve

EXPOSE 5000

CMD ["serve", "-s", "build", "-l", "5000"]
