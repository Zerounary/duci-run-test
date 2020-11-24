package main

import (
	"log"
	"os"
)

func main() {
	file, err := os.Create("test333")
	if err != nil {
		log.Fatal(err)
	}
	file.WriteString("test333")
	file.Close()
}
