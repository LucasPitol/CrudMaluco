import { Component, OnInit } from "@angular/core";
import { RegionalService } from "src/app/services/regional-service";

@Component({
	selector: 'regional-component',
	templateUrl: './regional.component.html',
	styleUrls: ['./regional.component.css'],
})

export class RegionalComponent implements OnInit {
	
	constructor(private regionalService: RegionalService) {}

	ngOnInit(): void {
		
	}
}