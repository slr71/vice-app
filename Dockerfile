FROM golang:1.12 as build-root

WORKDIR /vice-app

COPY main.go .

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

RUN go build

## Second stage
FROM scratch

COPY --from=build-root /vice-app/vice-app /usr/bin/

ENTRYPOINT ["vice-app"]

EXPOSE 8000
