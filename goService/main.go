package main

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"math/rand"
	"net/http"
	"strconv"

	firebase "firebase.google.com/go"
	"github.com/gorilla/mux"
	"google.golang.org/api/iterator"
	"google.golang.org/api/option"
)

//Book struct (model)
type Book struct {
	Id     string  `json:"id"`
	Isbn   string  `json:"isbn"`
	Title  string  `json:"title"`
	Author *Author `json:"author"`
}

type Client struct {
	dataMap map[string]interface{}
	// Id         string `json:"id"`
	// Bairro     string `json:"bairro"`
	// Cep        string `json:"cep"`
	// Cidade     string `json:"cidade"`
	// Complement string `json:"complement"`
	// Cpf        string `json:"cpf"`
	// Email      string `json:"email"`
	// Largadouro string `json:"largadouro"`
	// Name       string `json:"name"`
	// Phone1     string `json:"phone1"`
	// Uf         string `json:"uf"`
}

type Author struct {
	Name string `json:"name"`
}

var books []Book

func getClients(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	sa := option.WithCredentialsFile("./crud-maluco-firebase-adminsdk-btjm5-52f653b8cc.json")

	ctx := context.Background()
	//conf := &firebase.Config{ProjectID: "crud-maluco-gcp"}
	app, err := firebase.NewApp(ctx, nil, sa)
	if err != nil {
		log.Fatalln(err)
	}

	connection, err := app.Firestore(ctx)
	if err != nil {
		log.Fatalln(err)
	}

	var clients []map[string]interface{}

	iter := connection.Collection("client").Documents(ctx)

	for {
		doc, err := iter.Next()
		if err == iterator.Done {
			break
		}
		if err != nil {
			log.Fatalf("Failed to iterate: %v", err)
		}

		dataMap := doc.Data()

		dataMap["id"] = doc.Ref.ID

		//var c Client

		//c.Id = doc.Ref.ID

		//c.Bairro = getStringValue(dataMap, "bairro")

		clients = append(clients, dataMap)
	}

	defer connection.Close()

	fmt.Println(clients)
	json.NewEncoder(w).Encode(clients)
}

func getStringValue(dataMap map[string]interface{}, key string) string {

	str, ok := dataMap[key].(string)

	if ok {
		return str
	} else {
		return ""
	}
}

func getBooks(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	json.NewEncoder(w).Encode(books)
}

func getBook(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	params := mux.Vars(r) // Get params

	for _, item := range books {
		if item.Id == params["id"] {
			json.NewEncoder(w).Encode(item)
			return
		}
	}
	json.NewEncoder(w).Encode("Not found")
}

func createBook(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	var book Book

	_ = json.NewDecoder(r.Body).Decode(&book)

	book.Id = strconv.Itoa(rand.Intn(1000))

	books = append(books, book)

	json.NewEncoder(w).Encode(book)
}

func updateBook(w http.ResponseWriter, r *http.Request) {

}

func deleteBook(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	params := mux.Vars(r)

	for index, item := range books {
		if item.Id == params["id"] {
			books = append(books[:index], books[index+1:]...)
			break
		}
	}
	json.NewEncoder(w).Encode(books)
}

func main() {
	//init router
	router := mux.NewRouter()

	// Use the application default credentials

	//mocação
	books = append(books, Book{
		Id:     "1",
		Isbn:   "3344",
		Title:  "A Title",
		Author: &Author{Name: "Judas"}})

	//endponts

	router.HandleFunc("/api/clients", getClients).Methods("GET")
	router.HandleFunc("/api/books", getBooks).Methods("GET")
	router.HandleFunc("/api/books/{id}", getBook).Methods("GET")
	router.HandleFunc("/api/books", createBook).Methods("POST")
	router.HandleFunc("/api/books/{id}", updateBook).Methods("PUT")
	router.HandleFunc("/api/books/{id}", deleteBook).Methods("DELETE")

	log.Fatal(http.ListenAndServe(":8000", router))
}
