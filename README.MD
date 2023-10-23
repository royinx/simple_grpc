steps:
 - Protobuf
   - a file to generate communication code for different language
   - state the input, output and service

 - Golang:
   - alpine server




## python:
```bash
# clone python example
git clone -b v1.58.0 --depth 1 --shallow-submodules https://github.com/grpc/grpc
cp grpc/examples/python/helloworld/greeter_server.py .
cp grpc/examples/python/helloworld/greeter_client.py .
cp grpc/examples/python/debug/helloworld.proto .
```
```bash
# python Env
docker run --rm -it -v $PWD:/w -w /w python:3.8 bash
pip install grpcio-tools

# create python code
python -m grpc_tools.protoc \
       -I. \
       --python_out=python/lib \
       --pyi_out=python/lib \
       --grpc_python_out=python/lib \
       helloworld.proto

python3 python/greeter_server.py
python3 python/greeter_client.py
```

## Golang:
```bash
# Env
docker run --rm -it -v $PWD:/go/src -w /go/src golang:1.19.13-alpine3.18
apk add --no-cache protobuf git && \
    go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28 && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2

# create golang code
protoc --go_out=go/greeter_server/gen --go_opt=paths=source_relative \
       --go-grpc_out=go/greeter_server/gen --go-grpc_opt=paths=source_relative \
       helloworld.proto
protoc --go_out=go/greeter_client/gen --go_opt=paths=source_relative \
       --go-grpc_out=go/greeter_client/gen --go-grpc_opt=paths=source_relative \
       helloworld.proto

cd go
# go env go111module=off
go mod init helloworld
go mod tidy
# go install google.golang.org/grpc@latest
# go mod edit -replace=google.golang.org/grpc=github.com/grpc/grpc-go@latest

go run greeter_server/main.go
go run greeter_client/main.go
# Generater pb code for go and grpc
# --go_out : Protocol buffer related code
# --go-grpc_out : gRPC code   ( *_grpc.pb.go )

# Option
# --go_opt
# --go-grpc_opt
```
```bash
docker build -t go_grpc .
```






```bash
go mod init github.com/yourname/hello
go mod download
go install
```
```bash
go install is used to install a binary, not a package
go get to download a package

go mod tidy scans your project and updates the go.mod file and downloads all dependencies mentioned in the go.mod file

go mod download only downloads the dependencies from go.mod, without modifications of the go.mod file

there is no global dependencies in go
```