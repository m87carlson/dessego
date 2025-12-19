GOARCH=amd64
BINARY=dessego
OSNAME = $$(uname -o | tr A-Z a-z)

build:
	go build -ldflags="-s -w" -o bin/${BINARY}-$(OSNAME)-${GOARCH} ./cmd/server/main.go

lint:
	golangci-lint run ./cmd/... ./internal/...

deps:
	go mod verify && \
	go mod tidy && \
	go mod vendor

docs:
	swagger generate spec -m -o swagger.yaml

.PHONY: pkg build lint deps
