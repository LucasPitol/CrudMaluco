import { Component, OnInit } from "@angular/core";

export enum TabsEnum {
	HOME = 1,
	BEST_SALLERS = 2,
	PROFIT = 3,
}


@Component({
	selector: 'header-component',
	templateUrl: './header.component.html',
	styleUrls: ['./header.component.css'],
	// providers: [DashboardService]
})

export class HeaderComponent implements OnInit {
	tytle = 'Crud Maluco'

	currentTab: number

	HOME_TAB = TabsEnum.HOME
 	BEST_SALLERS_TAB = TabsEnum.BEST_SALLERS
 	PROFIT_TAB = TabsEnum.PROFIT

	tabs = [
        { label: 'Home', id: this.HOME_TAB },
        { label: 'bestSallers', id: this.BEST_SALLERS_TAB },
        { label: 'profit', id: this.PROFIT_TAB },
    ];
	
	ngOnInit(): void {
		this.currentTab = this.HOME_TAB;

		console.log(this.HOME_TAB)
		console.log(this.currentTab)
	}

	constructor() {
		
	}
	
}