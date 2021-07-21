package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	//Initialize router
	router := mux.NewRouter()

	// Initialize a server
	log.Fatal(http.ListenAndServe(":8080", router))
}
