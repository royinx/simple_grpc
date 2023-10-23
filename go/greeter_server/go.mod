module helloworld

go 1.19

require (
	google.golang.org/grpc v1.58.3
	google.golang.org/grpc/examples v0.0.0-20231013222742-6e9c88b0acf1
	google.golang.org/protobuf v1.31.0
)

require (
	github.com/golang/protobuf v1.5.3 // indirect
	golang.org/x/net v0.16.0 // indirect
	golang.org/x/sys v0.13.0 // indirect
	golang.org/x/text v0.13.0 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20231002182017-d307bd883b97 // indirect
)

replace google.golang.org/grpc => github.com/grpc/grpc-go v1.58.3
