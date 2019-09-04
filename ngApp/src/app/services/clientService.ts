import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable()
export class ClientService {

	private url = environment.crudApiUrl

	//public firebase = require("firebase/firestore");
	// Required for side-effects
	//require("firebase/firestore");

	private db = firebase.firestore();

	constructor(private http: HttpClient) {}

	public async getClients()
	{
		let cards: any = []

		this.db.collection("client").get().then((querySnapshot) => {
			querySnapshot.forEach((doc) => {
				cards = cards.concat(doc.data())
			});
			return cards
		});
		//return cards
	}

	public addNewClient() {
		
		this.db.collection("client").add({
			bairro: "Barra da Tijuca",
			cidade: "Rio de Janeiro",
			cep: "22596-099",
			complement: "Condominio Malibu",
			cpf: "157.562.354-46",
			email: "Ada@gmail.com",
			largadouro: "Rua sem nome, 56",
			name: "Ada",
			phone1: "(21) 9 9850-7070",
			uf: "RJ",
		})
		.then(function(docRef) {
			console.log("Document written with ID: ", docRef.id);
		})
		.catch(function(error) {
			console.error("Error adding document: ", error);
		});
	}
 }