package main_test

import (
	"bytes"
	"testing"

	"github.com/stretchr/testify/assert"
	goexample "github.com/triarius/go-example"
)

func TestHelloWorld(t *testing.T) {
	t.Parallel()

	var stdin, stdout, stderr bytes.Buffer
	stdin.Write([]byte(""))

	goexample.Run(&stdin, &stdout, &stderr)

	assert.Equal(t, stdout.String(), "Hello World!\n")
}
