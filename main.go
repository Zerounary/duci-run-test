package main

import (
	"log"
	"os"

	"github.com/spyzhov/ajson"
)

func main() {
	json := []byte(`{"price": 1}`)
	root, _ := ajson.Unmarshal(json)
	nodes, _ := root.JSONPath("$..price")

	file, err := os.Create("test555")
	if err != nil {
		log.Fatal(err)
	}
	file.WriteString(nodes[0].String())
	file.Close()
}
