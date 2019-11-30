import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';
import * as firebase from 'firebase';

@Injectable()
export class ClientService {

	private db = firebase.firestore();

	constructor(private http: HttpClient) {}

	getClients(filter): Observable<any> {

		console.log(filter)

		var collectionRef = this.db.collection('client')

		var query = collectionRef.where("cidade", ">", "")

		var city = filter.local.city

		if (city != "")
		{
			query = collectionRef.where("cidade", "==", city)
		}

		return new Observable((observer) => {
			query.onSnapshot((querySnapshot) => {
			let cards = []
			querySnapshot.forEach((doc) => {
			  let data = doc.data()
			  cards.push({
				key: doc.id,
				name: data.name,
				birthDate: data.birthDate,
				cpf: data.cpf,
				email: data.email,
				largadouro: data.largadouro,
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
			cidade: client.cidade,
			cpf: client.cpf,
			email: client.email,
			largadouro: client.largadouro,
			name: client.name,
			birthDate: client.birthDate,
		})
		.then(function(docRef) {
			console.log("Document written with ID: ", docRef.id);
		})
		.catch(function(error) {
			console.error("Error adding document: ", error);
		});
	}

	public delete(key)
	{
		this.db.collection("client").doc(key).delete()
		.then(function() {
			console.log("Document successfully deleted!")
		}).catch(function(error) {
			console.error("Error removing document: ", error)
		})
	}
 }