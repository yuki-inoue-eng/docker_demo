FROM golang:1.13-alpine AS build
WORKDIR /go/src/docker_demo
ENV GO111MODULE=on
COPY . .
RUN go mod download
RUN GOOS=linux GOARCH=amd64 go install  

FROM alpine AS docker_demo
RUN apk add ca-certificates 
COPY --from=build /go/bin/docker_demo /bin/docker_demo
CMD ./bin/docker_demo -port=$PORT
