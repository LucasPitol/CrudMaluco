import { Component, OnInit } from "@angular/core";
import { RegionalService } from "src/app/services/regional-service";

@Component({
	selector: 'regional-component',
	templateUrl: './regional.component.html',
	styleUrls: ['./regional.component.css'],
})

export class RegionalComponent implements OnInit {

	public pieChartLabels:string[] = ['Chrome', 'Safari', 'Firefox','Internet Explorer','Other'];
  	public pieChartData:number[] = [40, 20, 20 , 10];
	public pieChartType:string = 'pie';
	  
	 public chartColors: Array<any> = [
		{ // all colors in order
		  backgroundColor: ['#311B92', '#673AB7', '#9575CD', '#D1C4E9']
		}
	]
	
	constructor(private regionalService: RegionalService) {}

	ngOnInit(): void {
		
	}

	public chartClicked(e:any):void {
		console.log(e);
	}
	 
	 public chartHovered(e:any):void {
		console.log(e);
	}
}