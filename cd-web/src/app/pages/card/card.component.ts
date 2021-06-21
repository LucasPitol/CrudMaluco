import { Component, Input } from '@angular/core';
import { Person } from 'src/app/models/person';

@Component({
    selector: 'card-component',
    templateUrl: './card.component.html',
    styleUrls: ['./card.component.scss']
})

export class CardComponent {

    @Input("person") person: Person
    @Input("personSelectedId") personSelectedId: string

}
