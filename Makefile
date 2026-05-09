BINARY_APP := anki-deck-creator
CMD_APP    := ./cmd/app

.PHONY: all build install test lint fmt generate tidy clean

all: generate build

build:
	go build -o bin/$(BINARY_APP) $(CMD_APP)

install:
	go install $(CMD_APP)

test:
	go test -race ./...

lint:
	go vet ./...
	golangci-lint run ./...

fmt:
	gofmt -s -w .

generate:
	sqlc generate

tidy:
	go mod tidy

clean:
	rm -rf bin/

setup:
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest
