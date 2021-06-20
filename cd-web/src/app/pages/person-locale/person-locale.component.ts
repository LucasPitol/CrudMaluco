import { Component, OnInit, ViewChild } from "@angular/core";
import {
    ApexNonAxisChartSeries,
    ApexResponsive,
    ApexChart,
    ChartComponent
} from "ng-apexcharts";

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
    public chartOptions: Partial<ChartOptions>

    refreshIconPath = '../../../assets/redo-alt.png'

    ngOnInit(): void {
        this.buildChart()
    }

    buildChart() {
        this.chartOptions = {
            series: [44, 55, 13, 43],
            chart: {
                width: 380,
                type: "pie"
            },
            colors: ['#5655cb', '#8B82FF', '#c0b2ff', '#E3E1FF'],
            labels: ["Brazil", "Netherlands", "France", "United States"],
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
    }
}