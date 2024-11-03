FROM golang:1.22.5 as build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags="-s -w" -o server

FROM scratch
COPY --from=build /app/server .
ENTRYPOINT [ "./server" ]