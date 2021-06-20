import { Component, OnInit } from "@angular/core";

@Component({
    selector: 'person-locale-component',
    templateUrl: './person-locale.component.html',
    styleUrls: ['./person-locale.component.scss']
})

export class PersonLocaleComponent implements OnInit {

    ngOnInit(): void {
        console.log('init chart')
    }
}