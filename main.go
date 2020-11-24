package main

import (
	"log"
	"os"
)

func main() {
	file, err := os.Create("test555")
	if err != nil {
		log.Fatal(err)
	}
	file.WriteString("test555")
	file.Close()
}
