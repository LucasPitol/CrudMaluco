import { Component, OnInit, ViewChild } from "@angular/core";
import { FormControl, Validators } from "@angular/forms";
import { MatSidenav } from "@angular/material/sidenav";
import { Person } from "src/app/models/person";
import { PersonService } from "src/app/services/person-service";
import { SidenavService } from "src/app/services/side-nav-service";
import { Constants } from "src/app/utils/constants";

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
    countryList: string[]
    countrySelected: string
    loading: boolean
    selectedPerson: Person

    refreshIconPath = '../../../assets/redo-alt.png'
    closeIconPath = '../../../assets/times.png'


    constructor(
        private personService: PersonService,
        private sidenavService: SidenavService
    ) { }

    ngOnInit(): void {
        this.loading = true
        this.resetPersonSelectedId()
        this.buildFormValidators()
        this.getCountryList()
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

    getCountryList() {
        this.countryList = Constants.countryList
    }

    getPersonList() {
        this.loading = true

        this.personService.getPersonList().then((res) => {
            this.personList = res
            
            this.loading = false
        })
    }

    resetPersonSelectedId() {
        this.personSelectedId = ''
        this.selectedPerson = null
    }

    closeDrawer() {
        this.sidenavService.close()
        this.resetPersonSelectedId()
    }

    selectPerson(person: Person) {
        this.personSelectedId = person.id
        this.selectedPerson = person

        this.nameFormControl.setValue(person.name)
        this.countrySelected = person.country

        this.sidenavService.open()
    }

    async editPerson() {

        this.loading = true

        var personToEdit = new Person()

        personToEdit.id = this.selectedPerson.id
        personToEdit.name = this.nameFormControl.value
        personToEdit.country = this.countrySelected

        this.closeDrawer()

        await this.personService.editPerson(personToEdit)

        this.getPersonList()
    }
}