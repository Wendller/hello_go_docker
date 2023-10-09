FROM golang:1.21.2-alpine AS builder

WORKDIR /app
COPY ./fullcycle.go .

RUN go mod init hello_go_docker/fullcycle
RUN go build 

FROM scratch
WORKDIR /app

COPY --from=builder /app/fullcycle .

CMD ["./fullcycle"]
