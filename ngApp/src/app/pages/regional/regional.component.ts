import { Component, OnInit } from "@angular/core";
import { RegionalService } from "src/app/services/regional-service";

@Component({
	selector: 'regional-component',
	templateUrl: './regional.component.html',
	styleUrls: ['./regional.component.css'],
})

export class RegionalComponent implements OnInit {

	public pieChartLabels:string[] = ['Chrome', 'Safari', 'Firefox','Internet Explorer'];
  	public pieChartData = []
	public pieChartType:string = 'pie';
	public pieChartDataMap: Map<string, number>
	public loading = true
	  
	 public chartColors: Array<any> = [
		{
		  backgroundColor: ['#311B92', '#673AB7', '#9575CD', '#D1C4E9']
		}
	]
	
	constructor(private regionalService: RegionalService) {}

	ngOnInit(): void {
		this.getPieChartData()
	}

	async getPieChartData()
	{
		this.loading = true;

		(await this.regionalService.getRegionalDataMap()).subscribe( 
			res => 
			{
				this.pieChartDataMap = res
				let mapSize = this.pieChartDataMap.size
				let valuesIterator = this.pieChartDataMap.values()

				for (var _i = 0; _i < mapSize; _i++) {
					this.pieChartData.push(valuesIterator.next().value)
				}

				console.log(this.pieChartData)
				this.loading = false
			},
			error => {
				console.error(error)
				this.loading = false
			}
		)

	}

	public chartClicked(e:any):void {
		// console.log(e);
	}
	 
	 public chartHovered(e:any):void {
		// console.log(e);
	}
}