# syntax=docker/dockerfile:1
FROM golang:1.19.13-alpine3.18
COPY ./gen /go/src/helloworld_tester
COPY . .
WORKDIR /src
# go get -d -v ./...
RUN go install -v ./...

RUN go build -o /bin/server ./main.go

FROM scratch
COPY --from=0 /bin/hello /bin/hello
CMD ["/bin/hello"]