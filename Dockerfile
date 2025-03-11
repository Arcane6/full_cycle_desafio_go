# Construção do binário
FROM golang:1.21 AS builder
WORKDIR /app
COPY main.go .
ENV GO111MODULE=off 
RUN go build -ldflags="-s -w" -o app

# Imagem final 
FROM scratch 
COPY --from=builder /app/app /app
CMD ["/app"]


