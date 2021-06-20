import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'home-component',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.scss']
})

export class HomeComponent implements OnInit {

    listDarkPath = '../../../assets/list-ul.png'
    listLightPath = '../../../assets/list-ul-light.png'
    
    ngOnInit(): void {
        console.log('Home')
    }
    
}