package main_test

import (
	"bytes"
	"context"
	"os"
	"testing"

	"github.com/jackc/pgx/v5"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	goexample "github.com/triarius/go-example"
)

func TestHelloWorld(t *testing.T) {
	t.Parallel()

	var stdin, stdout, stderr bytes.Buffer
	stdin.Write([]byte(""))

	err := goexample.Run(&stdin, &stdout, &stderr)
	require.NoError(t, err)
	assert.Equal(t, stdout.String(), "Hello World!\n")
}

func TestPGX(t *testing.T) {
	conn, err := pgx.Connect(context.Background(), os.Getenv("DB_URL"))
	require.NoError(t, err)
	defer conn.Close(context.Background())
}
