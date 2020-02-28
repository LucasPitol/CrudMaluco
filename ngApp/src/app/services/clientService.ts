import { Injectable } from "@angular/core";
import { Observable } from 'rxjs';
import * as firebase from 'firebase';

@Injectable()
export class ClientService {

	private db = firebase.firestore();

	constructor() {}

	getClients(filter): Observable<any> {

		var collectionRef = this.db.collection('client')

		var query = collectionRef.orderBy("name")

		var name = filter.name
		var city = filter.local.city
		var address = filter.local.address

		if (name != "")
		{
			query = query.startAt(name).endAt(name + "\uf8ff")
		}

		if (city != "")
		{
			query = query.where("cidade", "==", city)
		}
		
		return new Observable((observer) => {
			query.onSnapshot((querySnapshot) => {
			let cards = []
			
			var docs = querySnapshot.docs

			if (address != "")
			{
				docs = docs.filter(function (doc) {
					var element = doc.data()
					var indexFound = (element.address.search(address))
					if (indexFound >= 0)
					{
						return element
					}
				})
			}

			docs.forEach((doc) => {
			  let data = doc.data()
			  cards.push({
				key: doc.id,
				name: data.name,
				birthDate: data.birthDate,
				cpf: data.cpf,
				email: data.email,
				address: data.address,
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
			address: client.address,
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