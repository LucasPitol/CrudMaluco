import { Component, Input } from "@angular/core";

@Component({
	selector: 'card-component',
	templateUrl: './card.component.html',
	styleUrls: ['./card.component.css'],
	// providers: [DashboardService]
})

export class CardComponent { 
	@Input("card") card: any;

	delete()
	{
		console.log(this.card.key)
	}
}