FROM golang:1.16 as builder

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GO111MODULE=on

WORKDIR /src/

# Retrieve all packages
COPY ./src/go.mod .
COPY ./src/go.sum .
RUN go mod download

# Build the application
COPY ./src/ .
RUN go build -o app /src/main.go

FROM alpine:latest
WORKDIR /app/
COPY --from=builder /src/app /app/

EXPOSE 8080

CMD ["./app"]