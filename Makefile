.PHONY: test

test: deps
	go test -coverage ./plugin/...

deps: vendor

vendor:
	dep ensure -vendor-only
