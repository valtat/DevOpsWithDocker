FROM node:16-alpine AS builder

WORKDIR /app

COPY material-applications/example-frontend/ .

RUN npm install --production && \
    npm run build

FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

