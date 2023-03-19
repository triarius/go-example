package main_test

import (
	"bytes"
	"context"
	"os"
	"testing"

	"github.com/jackc/pgx/v5"
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

func TestPGX(t *testing.T) {
	conn, err := pgx.Connect(context.Background(), os.Getenv("DB_URL"))
	assert.NoError(t, err)

	defer conn.Close(context.Background())
}
