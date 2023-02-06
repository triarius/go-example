FROM golang:1.20-alpine AS build

WORKDIR /app

COPY go.mod go.sum /app/
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o example .

FROM alpine:3.17.1
COPY --from=build /app/example /usr/local/bin
ENTRYPOINT [ "example" ]
