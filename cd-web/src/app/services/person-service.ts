import { Injectable } from "@angular/core";
import { Person } from "../models/person";

@Injectable()
export class PersonService {

    getPersonList() {
        var personList: Person[] = []

        var p1: Person = new Person()
        p1.name = 'Judas Neto'
        p1.country = 'Brazil'
        p1.id = '123'
        p1.creationDate = new Date()

        var p2: Person = new Person()
        p2.name = 'Fulano Silva'
        p2.country = 'Netherlands'
        p2.id = '1234'
        p2.creationDate = new Date()

        personList.push(p1)
        personList.push(p2)

        return personList
    }
}