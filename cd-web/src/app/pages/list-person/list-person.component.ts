import { Component, OnInit, ViewChild } from "@angular/core";
import { FormControl, Validators } from "@angular/forms";
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
    nameFormControl: FormControl


    constructor(
        private personService: PersonService,
        private sidenavService: SidenavService
    ) { }

    ngOnInit(): void {
        this.personSelectedId = ''
        this.buildFormValidators()
        this.getPersonList()
    }

    ngAfterViewInit(): void {
        this.sidenavService.setSidenav(this.sidenav);
    }

    buildFormValidators() {
        this.nameFormControl = new FormControl('', [
            Validators.required,
            Validators.maxLength(20),
        ]);
    }

    getPersonList() {
        this.personList = this.personService.getPersonList()
    }

    selectPerson(person: Person) {
        this.personSelectedId = person.id

        this.nameFormControl.setValue(person.name)

        this.sidenavService.open()
    }
}