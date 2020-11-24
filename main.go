package main

import (
	"log"
	"os"
)

func main() {
	file, err := os.Create("test001")
	if err != nil {
		log.Fatal(err)
	}
	file.WriteString("test001")
	file.Close()
}
