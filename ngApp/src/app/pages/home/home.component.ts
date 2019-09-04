import { Component, OnInit } from "@angular/core";
import { HomeService } from '../../services/homeService';
import { ClientService } from '../../services/clientService';

@Component({
	selector: 'home-component',
	templateUrl: './home.component.html',
	styleUrls: ['./home.component.css'],
})

export class HomeComponent implements OnInit {

	
	cards: any = []
	
	cardsLoading = true

	private db = firebase.firestore();

	constructor(private homeService: HomeService,
				private clientService: ClientService,
		) {}
	
	ngOnInit(): void {
		if (this.cards.length <= 0)
		{
			this.getUsers()
		}
	}

	getUsers()
	{
		let cardsx: any = []

		this.db.collection("client").get().then((querySnapshot) => {
			querySnapshot.forEach((doc) => {
				cardsx = cardsx.concat(doc.data())
			});
			this.cards = cardsx
			console.log(this.cards)
		});
		//this.cards = this.clientService.getClients()

		// this.homeService.getUsers()
		// 	.subscribe(
		// 		res => {
		// 			this.cards = res
		// 		}
		// 	)
	}
}