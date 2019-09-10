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

	public getClients() : any
	{
		// const url=  this.url + "api/user/listAsync";
		// return this.http.get(url)
		// 	.map(res => res.json());

		return this.http.get<any>(this.url + "api/user/list")
	}


	public addNewClient(client) {

		// this.db.collection("client").add({
		// 	bairro: client.bairro,
		// 	cidade: client.cidade,
		// 	cep: client.cep,
		// 	complement: client.complement,
		// 	cpf: client.cpf,
		// 	email: client.email,
		// 	largadouro: client.largadouro,
		// 	name: client.name,
		// 	phone1: client.phone1,
		// })
		// .then(function(docRef) {
		// 	console.log("Document written with ID: ", docRef.id);
		// })
		// .catch(function(error) {
		// 	console.error("Error adding document: ", error);
		// });
	}
 }