package main

import (
	"fmt"
	"io"
	"os"
)

func main() {
	Run(os.Stdin, os.Stdout, os.Stderr)
}

func Run(in io.Reader, out, err io.Writer) {
	fmt.Fprintf(out, "Hello World!\n")
}
