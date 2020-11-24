package main

import (
	"log"
	"os"
)

func main() {
	file, err := os.Create("test003")
	if err != nil {
		log.Fatal(err)
	}
	file.WriteString("test003")
	file.Close()
}
