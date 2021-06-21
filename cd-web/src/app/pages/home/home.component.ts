import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material';
import { PersonService } from 'src/app/services/person-service';
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
    loading: boolean

    constructor(
        public newPersonDialog: MatDialog,
        private personService: PersonService,
    ) { }

    ngOnInit(): void {
        this.loading = false
        this.currentPageIndex = this.listPageIndex
    }

    switchPage(index) {
        this.currentPageIndex = index
    }

    openDialog(): void {
        const dialogRef = this.newPersonDialog.open(NewPersonDialogComponent, {
            width: '350px',
            data: { name: '', country: 'Brazil' }
        });

        dialogRef.afterClosed().subscribe(async result => {

            if (result != undefined) {

                this.loading = true

                var personName = result.name
                var country = result.country

                await this.personService.saveNewPerson(personName, country)

                // update childs

                this.loading = false
            }
        });
    }
}