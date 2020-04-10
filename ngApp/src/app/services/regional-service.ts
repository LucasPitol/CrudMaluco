import { Injectable } from "@angular/core";
import { Observable, observable } from 'rxjs';
import * as firebase from 'firebase';

@Injectable()
export class RegionalService {

    private db = firebase.firestore();

    getRegionalDataMap(): Observable<any> {
        let regionalMap = new Map()

        var belemDoParaDto = new CityAndCountDto('Belem do Pará', 0.0)
        var pernambucoDto = new CityAndCountDto('Pernambuco', 0.0)
        var rioDto = new CityAndCountDto('Rio de Janeiro', 0.0)
        var saoPauloDto = new CityAndCountDto('São Paulo', 0.0)


        var collectionsRef = this.db.collection('client')

        return new Observable((observer) => {
            collectionsRef
            .onSnapshot(async (snapShot) => {
                var docs = await snapShot.docs

                docs.forEach((doc) => {
                    var obj = doc.data()

                    let city = obj.cidade

                    switch (city) {
                        case 'Belem do Pará':
                            belemDoParaDto.cityCount = belemDoParaDto.cityCount + 1
                            break;

                        case 'Pernambuco':
                            pernambucoDto.cityCount = pernambucoDto.cityCount + 1
                            break;

                        case 'Rio de Janeiro':
                            rioDto.cityCount = rioDto.cityCount + 1;
                            break;

                        case 'São Paulo':
                            saoPauloDto.cityCount = saoPauloDto.cityCount + 1;
                            break;

                        default:
                            break;
                    }
                })
                let cityAndCountList = []

                cityAndCountList.push(belemDoParaDto)
                cityAndCountList.push(pernambucoDto)
                cityAndCountList.push(rioDto)
                cityAndCountList.push(saoPauloDto)

                cityAndCountList.sort((a, b) => (a.cityCount < b.cityCount) ? 1 : -1)

                cityAndCountList.forEach(element => {
                    regionalMap.set(element.cityName, element.cityCount)
                })
                observer.next(regionalMap)
            })
        })
    }
}

class CityAndCountDto {

    constructor(public cityName: string, public cityCount: number) { }
}