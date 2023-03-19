# syntax = docker/dockerfile:1.4
FROM golang:1.20 AS build

WORKDIR /app
SHELL ["/bin/sh", "-eufc"]

COPY go.mod go.sum /app/
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o example .

RUN <<EOF
echo "Hello" >> /hello
echo "World!" >> /hello
EOF

FROM alpine:3.17.2
COPY --from=build /app/example /usr/local/bin
ENTRYPOINT [ "example" ]
