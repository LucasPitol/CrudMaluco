import { Component, OnInit } from "@angular/core";
import { AuthService } from "src/app/services/auth-service";

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

	readonly HOME_TAB = TabsEnum.HOME
	readonly BEST_SALLERS_TAB = TabsEnum.BEST_SALLERS
	readonly PROFIT_TAB = TabsEnum.PROFIT

	tabs = [
        { label: 'Home', id: this.HOME_TAB },
        { label: 'bestSallers', id: this.BEST_SALLERS_TAB },
        { label: 'profit', id: this.PROFIT_TAB },
    ];
	
	ngOnInit(): void {
		this.currentTab = this.HOME_TAB;
	}

	constructor(public authService: AuthService) {
		
	}

	signOut()
	{
		this.authService.signOut()
	}

	googleSignIn()
	{
		this.authService.googleSignIn()
	}
}