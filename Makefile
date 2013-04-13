all: compile-server compile-client

compile-server:
	raco exe -o server src/server.rkt

compile-client:
	raco exe -o client src/client.rkt

run-server: compile-server
	./server

run-client: compile-client
	./client
