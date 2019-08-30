import { Component, OnInit } from "@angular/core";
import { HomeService } from '../../services/homeService';

@Component({
	selector: 'home-component',
	templateUrl: './home.component.html',
	styleUrls: ['./home.component.css'],
})

export class HomeComponent implements OnInit {

	
	cards: any = []
	
	cardsLoading = true

	constructor(private homeService: HomeService) {}
	
	ngOnInit(): void {
		if (this.cards.length <= 0)
		{
			this.getUsers()
		}
	}

	getUsers()
	{
		this.homeService.getUsers()
			.subscribe(
				res => {
					this.cards = res
				}
			)
	}
}