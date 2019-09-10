package main

import (
	"encoding/json"
	"log"
	"net/http"

	//"math/rand"
	//"strconv"
	"github.com/gorilla/mux"
)

//Book struct (model)
type Book struct {
	Id     string  `json:"id"`
	Isbn   string  `json:"isbn"`
	Title  string  `json:"title"`
	Author *Author `json:"author"`
}

type Author struct {
	Name string `json:"name"`
}

var books []Book

func getBooks(w http.ResponseWriter, r *http.Request) {
	//w.Header.Set("Content-Type", "application/json")

	json.NewEncoder(w).Encode(books)
}

func getBook(w http.ResponseWriter, r *http.Request) {

}

func createBook(w http.ResponseWriter, r *http.Request) {

}

func updateBook(w http.ResponseWriter, r *http.Request) {

}

func deleteBook(w http.ResponseWriter, r *http.Request) {

}

func main() {
	//init router
	router := mux.NewRouter()

	//mocação
	books = append(books, Book{
		Id:     "1",
		Isbn:   "3344",
		Title:  "A Title",
		Author: &Author{Name: "Judas"}})

	//endponts

	router.HandleFunc("/api/books", getBooks).Methods("GET")
	router.HandleFunc("/api/books/{id}", getBook).Methods("GET")
	router.HandleFunc("/api/books", createBook).Methods("POST")
	router.HandleFunc("/api/books/{id}", updateBook).Methods("PUT")
	router.HandleFunc("/api/books/{id}", deleteBook).Methods("DELETE")

	log.Fatal(http.ListenAndServe(":8000", router))
}
