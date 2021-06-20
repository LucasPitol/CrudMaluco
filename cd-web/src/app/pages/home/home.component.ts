import { Component, OnInit } from '@angular/core';
import { Constants } from 'src/app/utils/constants';

@Component({
    selector: 'home-component',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.scss']
})

export class HomeComponent implements OnInit {

    currentPageIndex: number

    listDarkPath = '../../../assets/list-ul.png'
    listLightPath = '../../../assets/list-ul-light.png'
    pieChartDarkPath = '../../../assets/chart-pie.png'
    pieChartLightPath = '../../../assets/chart-pie-light.png'

    listPageIndex = Constants.listPageIndex
    graphPageIndex = Constants.graphPageIndex
    
    ngOnInit(): void {
        this.currentPageIndex = this.listPageIndex
    }

    switchPage(index) {
        this.currentPageIndex = index
    }
    
}