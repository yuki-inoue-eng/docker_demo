FROM golang:1.13

RUN mkdir /hello
COPY main.go /hello

CMD ["go", "run", "/hello/main.go"]
