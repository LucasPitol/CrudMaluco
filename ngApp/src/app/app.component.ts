import { Component, OnInit } from '@angular/core';
import * as firebase from 'firebase';

const settings = {timestampsInSnapshots: true};
const firebaseConfig = {
	apiKey: "AIzaSyAF5gAN5uJ71tydTbMKZwol1zzLTLjYFPE",
	authDomain: "crud-maluco.firebaseapp.com",
	databaseURL: "https://crud-maluco.firebaseio.com",
	projectId: "crud-maluco",
	storageBucket: "",
	messagingSenderId: "990961054227",
	appId: "1:990961054227:web:109d15e1665475ecef85e6"
};



@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  ngOnInit(): void {
    firebase.initializeApp(firebaseConfig);
    firebase.firestore().settings(settings);
  }
  title = 'app';
}
