FROM golang:1.13-alpine AS build
RUN apk add git
WORKDIR /go/src/hello-heroku
ENV GO111MODULE=on
COPY go.mod .
COPY . .
RUN GOOS=linux GOARCH=amd64 go install .

FROM alpine AS hello-heroku
RUN apk add ca-certificates 
COPY --from=build /go/bin/hello-heroku /bin/hello-heroku
CMD ["/bin/hello-heroku"]
