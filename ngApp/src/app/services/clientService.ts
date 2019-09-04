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
 }