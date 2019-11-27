import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';
import * as firebase from 'firebase';

@Injectable()
export class ClientService {

	private url = environment.crudApiUrl

	private db = firebase.firestore();

	//public firebase = require("firebase/firestore");
	// Required for side-effects
	//require("firebase/firestore");

	//private db = firebase.firestore();

	constructor(private http: HttpClient) {}

	// public getClients() : any
	// {
	// 	// const url=  this.url + "api/user/listAsync";
	// 	// return this.http.get(url)
	// 	// 	.map(res => res.json());

	// 	return this.http.get<any>(this.url + "api/user/list")
	// }

	getClients(): Observable<any> {
		return new Observable((observer) => {
		  this.db.collection('client').onSnapshot((querySnapshot) => {
			let cards = []
			querySnapshot.forEach((doc) => {
			  let data = doc.data()
			  cards.push({
				key: doc.id,
				name: data.name,
				bairro: data.bairro,
				birthDate: data.birthDate,
				cep: data.cep,
				complement: data.complement,
				cpf: data.cpf,
				email: data.email,
				largadouro: data.largadouro,
				phone1: data.phone1,
				cidade: data.cidade
			  });
			});
			observer.next(cards);
		  });
		});
	}

	public addNewClient(client) {
		console.log(client)
		this.db.collection("client").add({
			bairro: client.bairro,
			cidade: client.cidade,
			cep: client.cep,
			complement: client.complement,
			cpf: client.cpf,
			email: client.email,
			largadouro: client.largadouro,
			name: client.name,
			phone1: client.phone1,
			birthDate: client.birthDate,
		})
		.then(function(docRef) {
			console.log("Document written with ID: ", docRef.id);
		})
		.catch(function(error) {
			console.error("Error adding document: ", error);
		});
	}
 }