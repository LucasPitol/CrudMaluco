import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material';
import { Constants } from 'src/app/utils/constants';
import { NewPersonDialogComponent } from '../new-person-dialog/new-person-dialog.component';

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

    constructor(public newPersonDialog: MatDialog) { }

    ngOnInit(): void {
        this.currentPageIndex = this.listPageIndex
    }

    switchPage(index) {
        this.currentPageIndex = index
    }

    openDialog(): void {
        const dialogRef = this.newPersonDialog.open(NewPersonDialogComponent, {
            width: '350px',
            data: {name: '', country: 'Brazil'}
        });

        dialogRef.afterClosed().subscribe(result => {
            console.log(result)
        });
    }
}