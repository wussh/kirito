FROM golang:1.23.1-alpine3.20 AS first
WORKDIR /app
COPY . .
RUN go mod tidy
RUN go build -o test

FROM alpine:latest
WORKDIR /app
COPY --from=first /app/test /app/test
EXPOSE 8080
CMD [ "/app/test" ]