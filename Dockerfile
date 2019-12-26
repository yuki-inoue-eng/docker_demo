FROM golang:1.13-alpine AS build
WORKDIR /go/src/hello-heroku
COPY . .
RUN GOOS=linux GOARCH=amd64 go install .

FROM alpine AS hello-heroku
RUN apk add ca-certificates 
COPY --from=build /go/bin/hello-heroku /bin/hello-heroku
CMD ["/bin/hello-heroku"]
