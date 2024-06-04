FROM golang:1.16-alpine

RUN apk add build-base

WORKDIR /app

COPY . .

COPY material-applications/example-backend/ .

RUN go build -o server .

EXPOSE 8080

CMD ["./server"]
