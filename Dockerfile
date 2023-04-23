# syntax = docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM golang:1.20-alpine AS build

WORKDIR /app
COPY go.mod go.sum /app/
RUN go mod download
COPY . .
ARG TARGETOS
ARG TARGETARCH
RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o example .

FROM alpine:3.17.2
COPY --from=build /app/example /usr/local/bin
ENTRYPOINT [ "example" ]
