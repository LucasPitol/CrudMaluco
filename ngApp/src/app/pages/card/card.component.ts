import { Component, Input } from "@angular/core";
import { ClientService } from "src/app/services/clientService";

@Component({
	selector: 'card-component',
	templateUrl: './card.component.html',
	styleUrls: ['./card.component.css'],
	// providers: [DashboardService]
})

export class CardComponent { 
	@Input("card") card: any

	constructor(private clientService: ClientService)
	{}
	

	delete()
	{
		this.clientService.delete(this.card.key)
	}
}