import { Component, OnInit, ViewChild } from "@angular/core";
import {
    ApexNonAxisChartSeries,
    ApexResponsive,
    ApexChart,
    ChartComponent
} from "ng-apexcharts";
import { PersonService } from "src/app/services/person-service";

export type ChartOptions = {
    series: ApexNonAxisChartSeries
    chart: ApexChart
    responsive: ApexResponsive[]
    labels: any
    colors: string[]
};

@Component({
    selector: 'person-locale-component',
    templateUrl: './person-locale.component.html',
    styleUrls: ['./person-locale.component.scss']
})

export class PersonLocaleComponent implements OnInit {

    @ViewChild("chart") chart: ChartComponent
    chartOptions: Partial<ChartOptions>
    loading: boolean

    refreshIconPath = '../../../assets/redo-alt.png'

    constructor(private personService: PersonService) { }

    ngOnInit(): void {
        this.buildChart()
    }

    buildChart() {

        this.loading = true

        this.personService.getChartData().then((res) => {

            var series = res.serie
            var labels = res.labels

            this.chartOptions = {
                series: series,
                chart: {
                    width: 380,
                    type: "pie"
                },
                colors: ['#5655cb', '#8B82FF', '#c0b2ff', '#E3E1FF'],
                labels: labels,
                responsive: [
                    {
                        breakpoint: 480,
                        options: {
                            chart: {
                                width: 200
                            },
                            legend: {
                                position: "bottom"
                            }
                        }
                    }
                ]
            }

            this.loading = false
        })



    }
}