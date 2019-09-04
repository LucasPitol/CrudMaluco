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

	filterImageUrl = 'assets/filter.png';

	filterForm = {
		local: {
			city: '',
			uf: ''
		},
		age: {
			minAge: '',
			maxAge: '',
		},
		categoria: '',
	}

	constructor(private homeService: HomeService,
				private clientService: ClientService,
		) {}
	
	ngOnInit(): void {
		if (this.cards.length <= 0)
		{
			this.getUsers()
		}
	}

	clearFilter()
	{
		this.filterForm.local.city = ""
		this.filterForm.local.uf = ""
	}
	
	applyFilter()
	{
		this.cardsLoading = true;

		this.cards = []
		
		let cardsx: any = []

		let cidade = this.filterForm.local.city

		this.db.collection("client").where("cidade", "==", cidade)
			.get()
			.then((querySnapshot) => {
				querySnapshot.forEach((doc) => {
					cardsx = cardsx.concat(doc.data())
				});
				this.cards = cardsx
				this.cardsLoading = false
			})
			.catch(function(error) {
				console.log("Error getting documents: ", error)
			})
	}

	getUsers()
	{
		let cardsx: any = []

		this.db.collection("client").get().then((querySnapshot) => {
			querySnapshot.forEach((doc) => {
				cardsx = cardsx.concat(doc.data())
			});
			this.cards = cardsx
			this.cardsLoading = false
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