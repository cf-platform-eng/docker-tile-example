package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

func main() {
    fmt.Println("Environment Variables:")
    for _, env := range os.Environ() {
        fmt.Println(env)
    }

    sigs := make(chan os.Signal, 1)
    done := make(chan bool, 1)

	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)
	go func() {
        sig := <-sigs
        fmt.Println()
        fmt.Println(sig)
        done <- true
    }()
    <-done
}
