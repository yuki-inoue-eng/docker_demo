package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
)

func main() {
	port := flag.String("port", "8080", "port number")
	flag.Parse()
	http.HandleFunc("/", indexHandler)
	fmt.Println("server start!")
	if err := http.ListenAndServe(fmt.Sprintf(":%s", *port), nil); err != nil {
		log.Fatal("ListenAndServe:", err)
	}
}

func indexHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>Hello heroku!!</h1>")
}
