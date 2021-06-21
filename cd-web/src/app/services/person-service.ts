import { Injectable } from "@angular/core";
import { Person } from "../models/person";
import firebase from "firebase";

@Injectable()
export class PersonService {

    private db = firebase.firestore()

    personsCollectionName = 'persons'

    async getPersonList() {
        var personList: Person[] = []

        var snapshot = await this.db
            .collection(this.personsCollectionName)
            .orderBy("name", "asc")
            .get()

        if (!snapshot.empty) {

            for (const doc of snapshot.docs) {

                var person = new Person()

                person.id = doc.id

                var docMap = doc.data()

                person.name = docMap.name
                person.country = docMap.country
                person.creationDate = (docMap.creationDate).toDate()

                personList.push(person)
            }
            return personList
        }

        return personList
    }

    async editPerson(person: Person) {

        const batch = this.db.batch()

        var personId = person.id

        const docRef = this.db.collection(this.personsCollectionName).doc(personId)

        batch.set(docRef, {
            name: person.name,
            country: person.country,
            lastUpdate: new Date(),
        }, { merge: true })

        await batch.commit()
    }

    async deletePerson(personId: string) {

        const batch = this.db.batch()

        const docRef = this.db.collection(this.personsCollectionName).doc(personId)

        batch.delete(docRef)

        await batch.commit()
    }
}