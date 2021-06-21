import { Injectable } from "@angular/core";
import { Person } from "../models/person";
import firebase from "firebase";
import { Constants } from "../utils/constants";
import { CountryAndPersonsDto } from "../models/country-and-persons-dto";

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

    async saveNewPerson(personName: string, country: string) {

        var person = new Person()

        person.name = personName
        person.country = country

        const batch = this.db.batch()

        const docRef = this.db.collection(this.personsCollectionName).doc()

        batch.set(docRef, {
            name: person.name,
            country: person.country,
            creationDate: new Date(),
        })

        await batch.commit()
    }

    async getChartData() {

        var graphData = {
            serie: [],
            labels: [],
        }

        var personList = await this.getPersonList()

        if (personList != null && personList.length > 0) {

            var countryList = Constants.countryList

            var countryAndPersonsDtoList: CountryAndPersonsDto[] = []

            for (var country of countryList) {

                var personsFromCurrentCountry = personList.filter((e) => e.country == country)

                if (personsFromCurrentCountry != null &&
                    personsFromCurrentCountry.length > 0) {

                    var countryAndPersonsDto = new CountryAndPersonsDto()

                    countryAndPersonsDto.personCount = (personsFromCurrentCountry.length)

                    countryAndPersonsDto.country = country

                    countryAndPersonsDtoList.push(countryAndPersonsDto)
                }
            }

            countryAndPersonsDtoList.sort((e) => e.personCount)



            graphData.serie = countryAndPersonsDtoList.map(e => e.personCount)
            graphData.labels = countryAndPersonsDtoList.map(e => e.country)

            return graphData
        }
    }
}