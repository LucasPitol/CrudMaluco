import { Component, OnInit } from "@angular/core";
import { AuthService } from "src/app/services/auth-service";

export enum TabsEnum {
	HOME = 0,
	REGIONAL = 1,
	DASHBOARD = 2,
}


@Component({
	selector: 'header-component',
	templateUrl: './header.component.html',
	styleUrls: ['./header.component.css'],
	// providers: [DashboardService]
})

export class HeaderComponent implements OnInit {
	tytle = 'Crud Maluco'

	listIcon = 'assets/list.png'
	localIcon = 'assets/pin.png'
	profitIcon = 'assets/profit.png'

	currentTab: number

	readonly HOME_TAB = TabsEnum.HOME
	readonly REGIONAL_TAB = TabsEnum.REGIONAL
	readonly DASHBOARD_TAB = TabsEnum.DASHBOARD

	tabs = [
        { label: this.listIcon, id: this.HOME_TAB },
        { label: this.localIcon, id: this.REGIONAL_TAB },
        { label: this.profitIcon, id: this.DASHBOARD_TAB },
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

	tabClick(tab)
	{
		console.log(tab)
		this.currentTab = tab.index
	}
}