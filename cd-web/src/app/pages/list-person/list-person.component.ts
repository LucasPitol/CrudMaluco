import { Component, OnInit, ViewChild } from "@angular/core";
import { MatSidenav } from "@angular/material/sidenav";
import { Person } from "src/app/models/person";
import { PersonService } from "src/app/services/person-service";
import { SidenavService } from "src/app/services/side-nav-service";

@Component({
    selector: 'list-person-component',
    templateUrl: './list-person.component.html',
    styleUrls: ['./list-person.component.scss']
})

export class ListPersonComponent implements OnInit {

    @ViewChild('sidenav') public sidenav: MatSidenav;

    personList: Person[]
    personSelectedId: string

    constructor(
        private personService: PersonService,
        private sidenavService: SidenavService
    ) { }

    ngOnInit(): void {
        this.personSelectedId = ''
        this.getPersonList()
    }

    ngAfterViewInit(): void {
        this.sidenavService.setSidenav(this.sidenav);
    }

    getPersonList() {
        this.personList = this.personService.getPersonList()
    }

    selectPerson(personId: string) {
        console.log(personId)
        this.personSelectedId = personId

        this.sidenavService.open()
    }
}