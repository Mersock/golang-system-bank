#build
FROM golang:1.18.3-alpine3.16 as builder
WORKDIR /app
COPY . .
RUN go build -o main main.go


#runner
FROM alpine:3.16 as runner
WORKDIR /app
COPY --from=builder /app/main .
COPY app.env .

EXPOSE 8080
CMD [ "/app/main" ]