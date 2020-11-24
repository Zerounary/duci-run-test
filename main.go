package main

import (
	"log"
	"os"
)

func main() {
	file, err := os.Create("test999")
	if err != nil {
		log.Fatal(err)
	}
	file.WriteString("test999")
	file.Close()
}
