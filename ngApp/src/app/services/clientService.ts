import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable()
export class ClientService {

	private url = environment.crudApiUrl

	//public firebase = require("firebase/firestore");
	// Required for side-effects
	//require("firebase/firestore");

	//private db = firebase.firestore();

	constructor(private http: HttpClient) {}

	public getClients()
	{
		// const url=  this.url + "api/user/listAsync";
		// return this.http.get(url)
		// 	.map(res => res.json());

		return this.http.get<any>(this.url + "api/user/listAsync")
	}


	public addNewClient() {

		// this.db.collection("client").add({
		// 	bairro: "Paraibanei",
		// 	cidade: "Belem do para",
		// 	cep: "22556-999",
		// 	complement: "Condominio paraiba",
		// 	cpf: "357.502.354-46",
		// 	email: "Paraíba@gmail.com",
		// 	largadouro: "Rua lula, 13",
		// 	name: "Rivaldo",
		// 	phone1: "(99) 9 9650-7870",
		// 	uf: "PA",
		// })
		// .then(function(docRef) {
		// 	console.log("Document written with ID: ", docRef.id);
		// })
		// .catch(function(error) {
		// 	console.error("Error adding document: ", error);
		// });
	}
 }