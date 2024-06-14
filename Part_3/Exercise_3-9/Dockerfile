FROM golang:alpine as build-stage

WORKDIR /usr/src/app

COPY material-applications/example-backend/ .

RUN apk add build-base &&  \
    go build && \
    go test ./...

FROM scratch

ENV REQUEST_ORIGIN="http://localhost:5000"

EXPOSE 8080

COPY --from=build-stage /usr/src/app/server .

CMD ["./server"]
