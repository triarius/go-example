package main

import (
	"fmt"
	"io"
	"os"

	"github.com/rs/zerolog"
)

func main() {
	logger := zerolog.New(os.Stderr).With().Timestamp().Logger()

	if err := run(os.Stdin, os.Stdout, os.Stderr); err != nil {
		logger.Error().Err(err).Msg("runtime error")
		os.Exit(1)
	}
}

func run(in io.Reader, out, err io.Writer) error {
	fmt.Fprintf(out, "Hello World!\n")
	return nil
}
