FROM golang:1.15 as builder
ADD . src
RUN cd src && CGO_ENABLED=0 go build -o /action ./cmd/goreadme

FROM alpine:latest
COPY --from=builder action /bin/action
WORKDIR /home/src
ENTRYPOINT ["/bin/action"]
