import { Component, OnInit } from "@angular/core";
import { Person } from "src/app/models/person";
import { PersonService } from "src/app/services/person-service";

@Component({
    selector: 'list-person-component',
    templateUrl: './list-person.component.html',
    styleUrls: ['./list-person.component.scss']
})

export class ListPersonComponent implements OnInit {

    personList: Person[]
    personSelectedId: string

    ngOnInit(): void {
        this.personSelectedId = ''
        this.getPersonList()
    }

    constructor(
		private personService: PersonService
	)
	{ }

    getPersonList() {
        this.personList = this.personService.getPersonList()
    }

    selectPerson(personId: string) {
        console.log(personId)
        this.personSelectedId = personId
    }
}