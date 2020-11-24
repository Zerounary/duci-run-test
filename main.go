package main

import (
	"log"
	"os"
)

func main() {
	file, err := os.Create("test222")
	if err != nil {
		log.Fatal(err)
	}
	file.WriteString("test222")
	file.Close()
}
